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
import jakarta.servlet.http.HttpSession;
import models.Account;
import services.AccountService;

/**
 *
 * @author DIEN MAY XANH
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter pr = response.getWriter();
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Check for empty username or password
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("mess", "Please enter both username and password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            AccountService accountService = AccountService.getInstance();
            Account acc = accountService.getAccount(username, password); // Lấy thông tin tài khoản từ username

            // Check if account exists
            if (acc == null) {
                request.setAttribute("mess", "Incorrect username or password. Please check your credentials and try again");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Check if password matches
            if (!acc.getPassword().equals(password)) {
                request.setAttribute("mess", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("user", acc);

            // Redirect based on user role
            if (acc.getRoleId() == 1) {
                response.sendRedirect("homes.jsp");
            } else if (acc.getRoleId() == 2) {
                response.sendRedirect("home");
            }
        } catch (Exception e) {
            request.setAttribute("mess", "An error occurred while processing your request");
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
