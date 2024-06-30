/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Skill;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SkillsController", urlPatterns = {"/skills"})
public class SkillsController extends HttpServlet {

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
            out.println("<title>Servlet SkillsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SkillsController at " + request.getContextPath() + "</h1>");
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
    private SkillDAO skillDAO;

    @Override
    public void init() {
        skillDAO = new SkillDAO();
    }

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        SkillDAO skillDAO = new SkillDAO();
        
        // Parameters for pagination
        String pageParam = request.getParameter("page");
        int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = 3; // Number of skills per page

        // Parameters for filtering and searching
        String statusParam = request.getParameter("status");
        String skillName = request.getParameter("skillName");
        
        Boolean status = null;
        if (statusParam != null && !statusParam.isEmpty()) {
            status = Boolean.parseBoolean(statusParam);
        }
        
        List<Skill> skills = new ArrayList<>();
        int totalSkills = 0;

        if (status != null && skillName != null && !skillName.isEmpty()) {
            // Filter by status and search by skill name
            skills = skillDAO.getAllSkillByStatusAndSkillName(status, skillName, page, pageSize);
            totalSkills = skillDAO.getCountSkillByStatusAndSkillName(status, skillName);
        } else if (status != null) {
            // Filter by status only
            skills = skillDAO.getAllSkillByStatus(status, page, pageSize);
            totalSkills = skillDAO.getCountSkillByStatus(status);
        } else if (skillName != null && !skillName.isEmpty()) {
            // Search by skill name only
            skills = skillDAO.getAllSkillBySkillName(skillName, page, pageSize);
            totalSkills = skillDAO.getCountSkillBySkillName(skillName);
        } else {
            // No filter or search
            skills = skillDAO.getAllSkills(page, pageSize);
            totalSkills = skillDAO.getCountSkill();
        }

        int totalPages = (int) Math.ceil((double) totalSkills / pageSize);

        // Set attributes for JSP rendering
        request.setAttribute("skills", skills);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("status", statusParam);
        request.setAttribute("skillName", skillName);

        request.getRequestDispatcher("Manager_Skill.jsp").forward(request, response);
    } catch (Exception e) {
        throw new ServletException(e);
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
        int skillID = Integer.parseInt(request.getParameter("skillID"));
        String skillName = request.getParameter("skillName");
        String img = request.getParameter("img");
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        
        skillDAO.updateSkill(skillID, skillName, img, description, status);
        response.sendRedirect("skills");

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
