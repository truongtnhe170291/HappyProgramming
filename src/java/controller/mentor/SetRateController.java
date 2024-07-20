/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.AccountDAO;
import dal.MentorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SetRateController", urlPatterns = {"/SetRate"})
public class SetRateController extends HttpServlet {

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
        Account curentAccount = (Account) request.getSession().getAttribute("user");
        if (curentAccount == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        MentorDAO mentorDAO = new MentorDAO();
        int rate = Integer.parseInt(request.getParameter("rate"));
        String mentorName = curentAccount.getUserName();
        mentorDAO.changeMentorRate(mentorName, rate);
        response.sendRedirect("cv");

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
