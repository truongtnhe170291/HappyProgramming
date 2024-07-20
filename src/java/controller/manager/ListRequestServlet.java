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

            List<RequestDTO> requests = new ArrayList<>();
            List<Status> statuses = rdao.getAllStatusesMentee();
            List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);

            int statusId = -1;
            
            requests = rdao.getAllRequestsByPagManager();

            // Log schedules for debugging
            for (RequestDTO requestDTO : requests) {
                List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
                List<SchedulePublic> oneWeekSchedule = getOneWeek(listSchedule);  // Lọc lịch trình theo tuần
                requestDTO.setListSchedule(oneWeekSchedule);  // Cập nhật danh sách lịch trình cho requestDTO

                for (SchedulePublic schedule : oneWeekSchedule) {
                    System.out.println("Request ID: " + requestDTO.getRequestId()
                            + " Schedule: " + schedule.getSlotId()
                            + " " + schedule.getDayOfSlot());
                }
            }

            //Check điều kiện nếu như trnajg thái là openclass và thời gian nằm giữa 2 slot đầu và cuối thì sẽ điền form "ý kiến giảng dạy"
            LocalDate todayLocalDate = LocalDate.now();
            String todayString = todayLocalDate.toString();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date today = null;
            
            try {
                today = sdf.parse(todayString);
            } catch (Exception e) {
                e.printStackTrace();
            }

            for (RequestDTO requestDTO : requests) {
                List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
                if(listSchedule.get(listSchedule.size() - 1).getDayOfSlot().equals(today) || listSchedule.get(listSchedule.size() - 1).getDayOfSlot().before(today)){
                    requestDTO.setIsEnoughPay(true);
                }else{
                    requestDTO.setIsEnoughPay(false);
                }
            }
            
            for (RequestDTO requestDTO : requests) {
                System.out.println(requestDTO);
            }
            //Check điều kiện nếu như trnajg thái là openclass và thời gian nằm giữa 2 slot đầu và cuối thì sẽ điền form "ý kiến giảng dạy"

            request.setAttribute("requests", requests);
            request.setAttribute("listSlots", listSlots);
            request.setAttribute("listDays", oneWeekDays);  // Chỉ hiển thị danh sách ngày của một tuần
            request.setAttribute("mentors1", mentors1);
            request.setAttribute("statuses", statuses);
            request.setAttribute("statusId", statusId);
//            request.setAttribute("mentorName", mentorName);
//            request.setAttribute("startTime", startTimeFilter);
//            request.setAttribute("endTime", endTimeFilter);
//            request.setAttribute("currentPage", page);
//            request.setAttribute("pageSize", pageSize);
//            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("RequestManagement_list.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
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
