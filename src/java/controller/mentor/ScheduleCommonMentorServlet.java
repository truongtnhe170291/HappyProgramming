/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import models.Account;
import models.ScheduleCommon;
import models.SchedulePublic;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ScheduleCommonMentorServlet", urlPatterns = {"/scheduleCommonMentor"})
public class ScheduleCommonMentorServlet extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        if (acc.getRoleId() == 2) {
            ScheduleDAO dao = new ScheduleDAO();
            
            List<ScheduleCommon> list = dao.getScheduleCommonByMentorName(acc.getUserName());

Set<String> uniqueMenteeNamesSet = new HashSet<>();
for (ScheduleCommon schedule : list) {
    uniqueMenteeNamesSet.add(schedule.getMenteeName());
}
List<String> uniqueMenteeNames = new ArrayList<>(uniqueMenteeNamesSet);

request.setAttribute("listSchedule", list);
request.setAttribute("uniqueMenteeNames", uniqueMenteeNames);
            request.getRequestDispatcher("Mentor_Mentee_calendar.jsp").forward(request, response);
        }
    } catch (Exception e) {
        // Xử lý exception
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
