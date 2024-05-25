package controllers;

import dal.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import models.Account;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/NewPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        String email = (String) session.getAttribute("emails");
        String username = (String) session.getAttribute("username_newpass");
        Account a = new Account();
        RequestDispatcher dispatcher = null;
        AccountDAO ac = new AccountDAO();
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            a.setUserName(username);
            a.setPassword(newPassword);
            ac.changePassWord(a);

            request.setAttribute("status", "resetSuccess");
            dispatcher = request.getRequestDispatcher("login.jsp");
        } else {
            request.setAttribute("status", "resetFailed");
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        dispatcher.forward(request, response);

    }
}
