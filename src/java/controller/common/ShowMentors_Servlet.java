/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.MentorProfileDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.MentorProfile;
import models.Skill;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShowMentors_Servlet", urlPatterns = {"/showmentor"})
public class ShowMentors_Servlet extends HttpServlet {

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
            out.println("<title>Servlet ShowMentors_Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowMentors_Servlet at " + request.getContextPath() + "</h1>");
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
            int skillId = Integer.parseInt(request.getParameter("id"));

            MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
            List<MentorProfile> mentors = mentorProfileDAO.getAllMentorBySkillID(skillId);

            SkillDAO skillDAO = new SkillDAO();
            Skill skill = skillDAO.getSkillById(skillId);
            List<Skill> Topskill = skillDAO.getTopSkills(skillId);
            // Đặt đối tượng Skill vào request attribute
            request.setAttribute("skillDetail", skill);
            request.setAttribute("Topskill", Topskill);
            // Set the list of mentors with matching skillId as a request attribute
            request.setAttribute("mentors", mentors);

            // Forward to the courseListSkillDetail.jsp
            request.getRequestDispatcher("courseListSkillDetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ShowMentors_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
