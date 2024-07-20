/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.MD_5;
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
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

            // Hash the input password
//           MD_5 md5 = new MD_5();
//           String hashedPassword = md5.getMd5(password);

            AccountService accountService = AccountService.getInstance();
            Account acc = accountService.getAccount(username, password); // Retrieve account info using username and hashed password

            // Check if account exists
            if (acc == null) {
                request.setAttribute("mess", "Incorrect username or password. Please check your credentials and try again");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Check if password matches (hashed password)
            if (!acc.getPassword().equals(password)) {
                request.setAttribute("mess", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("user", acc);

            // Redirect based on user role
            if (acc.getRoleId() == 1) {
               if(acc.getStatusId()!=2){
                response.sendRedirect("homeMentee");
               }else{
                    request.setAttribute("mess", "Your account has been banned because you have violated the website's rules");
                request.getRequestDispatcher("login.jsp").forward(request, response);
               }
               
            } else if (acc.getRoleId() == 2) {
                if(acc.getStatusId()!=2){
                response.sendRedirect("home");
                }else{
                    request.setAttribute("mess", "Your account has been banned because you have violated the website's rules");
                request.getRequestDispatcher("login.jsp").forward(request, response);
               }
            } else if(acc.getRoleId() == 3){
                request.setAttribute("mess", "You are not authorized to log in");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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

