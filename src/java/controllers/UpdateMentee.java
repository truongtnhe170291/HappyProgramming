/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.MenteeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Mentee;
import dal.MenteeDAO;
import services.MenteeService;
import services.SkillService;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/updatementee"})
public class UpdateMentee extends HttpServlet {

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
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
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
        MenteeService menteeService = MenteeService.getInstance();
        Mentee mentee = menteeService.getCurrentMentee("user1");
        SkillService skillService = SkillService.getInstance();
        request.setAttribute("skills", skillService.getSkills());
        request.setAttribute("mentee", mentee);
        request.getRequestDispatcher("user_info.jsp").forward(request, response);
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
        try {
            // Get data from UpdateMenteeProfileDemo.jsp
            String gmail = request.getParameter("gmail");
            String avatar = request.getParameter("avatar");
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String dob = request.getParameter("dob");
            String sex = request.getParameter("sex");
            String address = request.getParameter("address");

            MenteeDAO dao = new MenteeDAO();
            boolean check = false;

            if (!gmail.isEmpty() || avatar.isEmpty() || fullname.isEmpty() || dob.isEmpty() || address.isEmpty()) {
                dao.updateAccountMentee(username, fullname, dob, sex, address, gmail);
                dao.updateMentee(avatar, username);
                // Load data to form
                Mentee mentee = dao.getCurrentMentee("user1");
                request.setAttribute("message", "Update Success");
                request.setAttribute("mentee", mentee);
                request.getRequestDispatcher("user_info.jsp").forward(request, response);
            } else {
                Mentee mentee = dao.getCurrentMentee("user1");
                request.setAttribute("message1", "Update Fail");
                request.setAttribute("mentee", mentee);
                request.getRequestDispatcher("user_info.jsp").forward(request, response);
            }

        } catch (Exception e) {
            MenteeDAO dao = new MenteeDAO();
            Mentee mentee = dao.getCurrentMentee("user1");
            request.setAttribute("message1", "Update Fail");
            request.setAttribute("mentee", mentee);
            request.getRequestDispatcher("user_info.jsp").forward(request, response);
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
