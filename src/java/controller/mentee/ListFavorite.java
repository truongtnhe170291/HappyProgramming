/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.MentorDAO;
import dal.MentorProfileRateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.MentorProfileRate;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ListFavorite", urlPatterns = {"/Favorites"})
public class ListFavorite extends HttpServlet {

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
            out.println("<title>Servlet ListFavoriteMentors</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListFavoriteMentors at " + request.getContextPath() + "</h1>");
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

            Account currentAcc = (Account) request.getSession().getAttribute("user");
            if (currentAcc == null) {
                response.sendRedirect("login");
                return;
            }
            String menteeUserName = currentAcc.getUserName();

            MentorProfileRateDAO mentorprofiledao = new MentorProfileRateDAO();
            List<MentorProfileRate> mentor = mentorprofiledao.getAllListFavMentor(menteeUserName);

            request.setAttribute("mentorlist", mentor);
            request.getRequestDispatcher("ListFavorite.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ListFavorite.class.getName()).log(Level.SEVERE, null, ex);
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

        Account currentAcc = (Account) request.getSession().getAttribute("user");
        if (currentAcc == null) {
            response.sendRedirect("login");
            return;
        }
        String menteeUserName = currentAcc.getUserName();
        String mentorUserName = request.getParameter("mentorUsername");
        MentorDAO mentorDAO = new MentorDAO();

        String notification = "Mentor unfavorited!";
        mentorDAO.removeFavorite(menteeUserName, mentorUserName);
        request.getSession().setAttribute("notification", notification);
        response.sendRedirect("Favorites");
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
