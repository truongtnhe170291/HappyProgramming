/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Mentor;
import models.RequestDTO;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FilterStatusServlet", urlPatterns = {"/FilterStatusServlet"})
public class FilterStatusServlet extends HttpServlet {

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

    String menteeName = a.getUserName();
    String statusFilter = request.getParameter("statusFilter");
    String mentorNameFilter = request.getParameter("mentorNameFilter");
    String startTimeFilter = request.getParameter("startTimeFilter");
    String endTimeFilter = request.getParameter("endTimeFilter");

    int statusId = -1;
    LocalDate startTime = null;
    LocalDate endTime = null;
    String mentorName = mentorNameFilter != null && !mentorNameFilter.equals("all") ? mentorNameFilter : "";

    if (startTimeFilter != null && !startTimeFilter.isEmpty()) {
        startTime = LocalDate.parse(startTimeFilter);
    }
    if (endTimeFilter != null && !endTimeFilter.isEmpty()) {
        endTime = LocalDate.parse(endTimeFilter);
    }

    List<RequestDTO> requests = new ArrayList<>();
    RequestDAO rdao = new RequestDAO();

    try {
        if (("all".equals(statusFilter) || statusFilter == null || statusFilter.isEmpty()) &&
            ("all".equals(mentorName) || mentorName.isEmpty())) {
            // Case 1: statusFilter is "all" or empty, and mentorName is "all" or empty
            requests = rdao.getRequestOfMenteeInDeadlineByStatus(menteeName);
        } else if ("all".equals(statusFilter) || statusFilter == null || statusFilter.isEmpty()) {
            // Case 2: statusFilter is "all" or empty
            requests = rdao.getRequestOfMenteeInDeadlineByStatus(menteeName);
        } else {
            // Other cases
            statusId = Integer.parseInt(statusFilter);
            requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, startTime, endTime);
        }

        List<Status> statuses = rdao.getAllStatuses();
        List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);
        request.setAttribute("requests", requests);
        request.setAttribute("mentors1", mentors1);
        request.setAttribute("statuses", statuses);
        request.setAttribute("statusId", statusId);
        request.setAttribute("mentorName", mentorName);
        request.setAttribute("startTime", startTimeFilter);
        request.setAttribute("endTime", endTimeFilter);
        request.getRequestDispatcher("ListRequest.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
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
