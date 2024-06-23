/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.MentorDAO;
import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Day;
import models.Mentee;
import models.Mentor;
import models.RequestDTO;
import models.SchedulePublic;
import models.Slot;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FilterStatusMentorServlet", urlPatterns = {"/FilterStatusMentorServlet"})
public class FilterStatusMentorServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterStatusServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        MentorDAO mentorDao = new MentorDAO();
        String userName = a.getUserName();
        String statusFilter = request.getParameter("statusFilter");
        String menteeNameFilter = request.getParameter("menteeNameFilter");
        String startTimeFilter = request.getParameter("startTimeFilter");
        String endTimeFilter = request.getParameter("endTimeFilter");
        ArrayList<Slot> listSlots = mentorDao.listSlots();
        ArrayList<Day> listDays = mentorDao.listDays();
        RequestDAO rdao = new RequestDAO();
        
        List<Mentee> mentee = rdao.getMenteeByRequest(userName);
        List<Status> listStatus = rdao.getAllStatuses();

        // Lọc danh sách ngày cho một tuần
        ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

        int statusId = -1;
        LocalDate startTime = null;
        LocalDate endTime = null;
        String menteeName = menteeNameFilter != null && !menteeNameFilter.equals("all") ? menteeNameFilter : "";

        if (startTimeFilter != null && !startTimeFilter.isEmpty()) {
            startTime = LocalDate.parse(startTimeFilter);
        }
        if (endTimeFilter != null && !endTimeFilter.isEmpty()) {
            endTime = LocalDate.parse(endTimeFilter);
        }

        List<RequestDTO> requests = new ArrayList<>();

        try {
            if (("all".equals(statusFilter) || statusFilter == null || statusFilter.isEmpty())
                    && ("all".equals(menteeName) || menteeName.isEmpty())
                    && (startTime != null || endTime != null)) {
                // Case 3: statusFilter is "all" or empty, mentorName is "all" or empty, but startTime or endTime is not null
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, userName, startTime, endTime);
            } else if (("all".equals(statusFilter) || statusFilter == null || statusFilter.isEmpty())
                    && ("all".equals(menteeName) || menteeName.isEmpty())) {
                // Case 1: statusFilter is "all" or empty, and mentorName is "all" or empty
                requests = rdao.getRequestOfMentorInDeadlineByStatus(menteeName);
            } else if ("all".equals(statusFilter) || statusFilter == null || statusFilter.isEmpty()) {
                // Case 2: statusFilter is "all" or empty
                requests = rdao.getRequestOfMentorInDeadlineByStatus(menteeName);
            } else {
                // Other cases
                statusId = Integer.parseInt(statusFilter);
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, userName, startTime, endTime);
            }

            List<Status> statuses = rdao.getAllStatuses();
            List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);
            request.setAttribute("requests", requests);
            request.setAttribute("mentors1", mentors1);
            request.setAttribute("statuses", statuses);
            request.setAttribute("statusId", statusId);
            request.setAttribute("mentorName", userName);
            request.setAttribute("startTime", startTimeFilter);
            request.setAttribute("endTime", endTimeFilter);
            request.setAttribute("listSlots", listSlots);
            request.setAttribute("listDays", oneWeekDays);  // 
            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
