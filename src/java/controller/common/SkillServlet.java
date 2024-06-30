/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Skill;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SkillServlet", urlPatterns = {"/skill"})
public class SkillServlet extends HttpServlet {

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
            out.println("<title>Servlet SkillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SkillServlet at " + request.getContextPath() + "</h1>");
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
    SkillDAO skillDAO = new SkillDAO();
    String searchTerm = request.getParameter("searchTerm");
    String pageParam = request.getParameter("page");

    int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
    int pageSize = 6; // Số lượng kỹ năng trên mỗi trang

    List<Skill> list;
    int totalSkillCount;

    if (searchTerm != null && !searchTerm.isEmpty()) {
        // Nếu có từ khóa tìm kiếm, lấy danh sách kỹ năng tìm kiếm theo từ khóa và đếm số lượng kết quả
        list = skillDAO.searchSkills(searchTerm, page, pageSize);
        totalSkillCount = skillDAO.getCountSearchSkill(searchTerm);
    } else {
        // Nếu không có từ khóa tìm kiếm, lấy danh sách kỹ năng theo trang và đếm tổng số kỹ năng
        list = skillDAO.getSkillsPage(page, pageSize);
        totalSkillCount = skillDAO.getTotalSkillCount();
    }

    int totalPages = (int) Math.ceil((double) totalSkillCount / pageSize);

    // Đặt các thông tin cần thiết vào request để gửi đến JSP
    request.setAttribute("listSkill", list);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("searchTerm", searchTerm); // Đặt lại searchTerm

    // Chuyển tiếp đến trang JSP để hiển thị danh sách kỹ năng
    request.getRequestDispatcher("blog_skill.jsp").forward(request, response);
}



    public static void main(String[] args) {
        SkillDAO skillDAO = new SkillDAO();
        List<Skill> list = skillDAO.getSkillsPage(1, 5);

        System.out.println(list);

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
        processRequest(request, response);
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
