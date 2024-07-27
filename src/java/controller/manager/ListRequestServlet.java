/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.MentorDAO;
import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.Account;
import models.Day;
import models.Mentor;
import models.RequestDTO;
import models.SchedulePublic;
import models.Slot;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListRequestServlet", urlPatterns = {"/requestmentee"})
public class ListRequestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListRequestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {
            response.sendRedirect("LoginManager");
            return;
        }

        MentorDAO mentorDao = new MentorDAO();
        String menteeName = a.getUserName();
        RequestDAO rdao = new RequestDAO();

        ArrayList<Slot> listSlots = mentorDao.listSlots();
        ArrayList<Day> listDays = mentorDao.listDays();

        // Lọc danh sách ngày cho một tuần
        ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

        rdao.updateExpiredRequestsStatus();

        String statusFilterParam = request.getParameter("statusFilter");
        String mentorNameFilter = request.getParameter("mentorName");
        String pageParam = request.getParameter("page");
        int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = 5; // Số lượng yêu cầu trên mỗi trang

        List<RequestDTO> requests;
        int totalRequests;

        if ((statusFilterParam != null && !statusFilterParam.isEmpty()) && (mentorNameFilter != null && !mentorNameFilter.isEmpty())) {
            int statusFilter = Integer.parseInt(statusFilterParam);
            requests = rdao.getRequestMenteeByStatusAndMentorName(statusFilter, mentorNameFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMenteeCountByStatusAndMentorName(statusFilter, mentorNameFilter);
        } else if (statusFilterParam != null && !statusFilterParam.isEmpty()) {
            int statusFilter = Integer.parseInt(statusFilterParam);
            requests = rdao.getRequestMenteeByStatus(statusFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMenteeCountByStatus(statusFilter);
        } else if (mentorNameFilter != null && !mentorNameFilter.isEmpty()) {
            requests = rdao.getRequestMenteeByMentorName(mentorNameFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMenteeCountByMentorName(mentorNameFilter);
        } else {
            requests = rdao.getRequestOfManagerInDeadlineByStatus(page, pageSize);
            totalRequests = rdao.getTotalRequestMentee();
        }

        int totalPages = (int) Math.ceil((double) totalRequests / pageSize);

        List<Status> statuses = rdao.getAllStatusesMentee();
        List<Status> listStatus = rdao.getAllStatuses();
        List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);

        // Lọc lịch trình cho một tuần
        for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
            List<SchedulePublic> oneWeekSchedule = getOneWeek(listSchedule);
            requestDTO.setListSchedule(oneWeekSchedule);
        }

        // Kiểm tra điều kiện
        LocalDate todayLocalDate = LocalDate.now();
        String todayString = todayLocalDate.toString();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date today = null;
        
        try {
            today = sdf.parse(todayString);
        } catch (ParseException e) {
        }

        for (RequestDTO requestDTO : requests) {
            System.out.println(requestDTO);
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
            System.out.println(listSchedule.get(listSchedule.size() - 1).getDayOfSlot());
            if(requestDTO.getStatus().getStatusId() == 1 && (listSchedule.get(listSchedule.size() - 1).getDayOfSlot().equals(today) || listSchedule.get(listSchedule.size() - 1).getDayOfSlot().before(today))){
                requestDTO.setIsEnoughPay(true);
            } else {
                requestDTO.setIsEnoughPay(false);
            }
        }

        request.setAttribute("requests", requests);
        request.setAttribute("listSlots", listSlots);
        request.setAttribute("listDays", oneWeekDays);
        request.setAttribute("mentors1", mentors1);
        request.setAttribute("statuses", statuses);
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("statusFilter", statusFilterParam != null ? statusFilterParam : "");
        request.setAttribute("mentorNameFilter", mentorNameFilter != null ? mentorNameFilter : "");
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("RequestManagement_list.jsp").forward(request, response);
    } catch (SQLException e) {
        response.sendRedirect("PageError");
    }
}


    private ArrayList<Day> getOneWeekDays(ArrayList<Day> list) {
        ArrayList<Day> listOne = new ArrayList<>();
        if (list.isEmpty()) {
            return listOne;
        }

        LocalDate referenceDate = list.get(0).getDate1().toLocalDate();

        // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
        LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // Lọc các ngày trong tuần đó
        for (Day day : list) {
            LocalDate dayDate = day.getDate1().toLocalDate();
            if (!dayDate.isBefore(startOfWeek) && !dayDate.isAfter(endOfWeek)) {
                listOne.add(day);
            }
        }

        return listOne;
    }

// Hàm lấy lịch trình cho một tuần
    private List<SchedulePublic> getOneWeek(List<SchedulePublic> list) {
        List<SchedulePublic> listOne = new ArrayList<>();
        if (list.isEmpty()) {
            return listOne;
        }
        LocalDate referenceDate = list.get(0).getDayOfSlot().toLocalDate();

        // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
        LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // Lọc các schedule trong tuần đó
        for (SchedulePublic s : list) {
            LocalDate slotDate = s.getDayOfSlot().toLocalDate();
            if (!slotDate.isBefore(startOfWeek) && !slotDate.isAfter(endOfWeek)) {
                listOne.add(s);
            }
        }

        return listOne;
    }
        public static void main(String[] args) throws SQLException {
            RequestDAO rdao = new RequestDAO();
            List<RequestDTO> requests = rdao.getAllRequestsByPagManager();
               for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
                   System.out.println(listSchedule);
               }
        
    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
