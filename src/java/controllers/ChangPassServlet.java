/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import services.AccountService;

/**
 *
 * @author DIEN MAY XANH
 */
@WebServlet(name = "ChangPassServlet", urlPatterns = {"/changepass"})
public class ChangPassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc = (Account) request.getSession().getAttribute("user");
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        response.sendRedirect("changepass.jsp");
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
        String op = request.getParameter("opass"); // old password
        String p = request.getParameter("pass");   // new password
        String rp = request.getParameter("rpass"); // confirm new password
        Account a = (Account) request.getSession().getAttribute("user");
        String userName = a.getUserName();
        AccountService accountService = AccountService.getInstance();
        if (accountService.getAccount(userName, op) == null) {
            String msg = "Old password Error!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        if (!p.equals(rp)) {
            String msg = "New passwords do not match!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }

        if (op.equals(rp)) {
            String msg = "New password the same Old Password!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        Account acc = new Account();
        acc.setUserName(userName);
        acc.setPassword(rp);
        if (accountService.changePassWord(acc)) {
            response.sendRedirect("login.jsp");
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
