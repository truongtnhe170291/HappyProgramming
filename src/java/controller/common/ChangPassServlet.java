/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

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

@WebServlet(name = "ChangPassServlet", urlPatterns = {"/changepass"})
public class ChangPassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get session of user
        Account acc = (Account) request.getSession().getAttribute("user");
        //if not logged in yet, redirects user to login page to login
        if (acc == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
//            response.sendRedirect("login.jsp");
            return;
        }
        //if is logged in, redirect to change password jsp page
//        response.sendRedirect("changepass.jsp");
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        //get session of user
        Account a = (Account) request.getSession().getAttribute("user");
        //get Username of user
        String userName = a.getUserName();
        //invoke an instance of AccountService
        AccountService accountService = AccountService.getInstance();
        //check if old password is incorrect
        if (accountService.getAccount(userName, op) == null) {
            String msg = "Old password is incorrect!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        //check if new password does not match confirm password
        if (!p.equals(rp)) {
            String msg = "New passwords do not match!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        //check if new password is the same as old password
        if (op.equals(rp)) {
            String msg = "New password is the same as Old Password!";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        //invoke a new instance of Account and set new password for account
        Account acc = new Account();
        acc.setUserName(userName);
        acc.setPassword(rp);
        //if successfully submitted form then update password and redirect user to login page
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
