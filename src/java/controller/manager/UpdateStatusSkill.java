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

/**
 *
 * @author DIEN MAY XANH
 */
@WebServlet(name = "UpdateStatusSkill", urlPatterns = {"/udatestatus"})

public class UpdateStatusSkill extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateStatsSkill</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatsSkill at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // Đọc các tham số từ request
    int skillId = Integer.parseInt(request.getParameter("skillID"));
    boolean status = Boolean.parseBoolean(request.getParameter("status"));

    // Gọi DAO để cập nhật trường status của kỹ năng trong cơ sở dữ liệu
    SkillDAO skillDAO = new SkillDAO(); // Thay thế bằng tên của lớp DAO thực tế
    try {
        skillDAO.updateSkillStatus(skillId, status);
        
        // Chuyển hướng người dùng sau khi cập nhật thành công (nếu cần)
        response.sendRedirect("skills"); // Điều hướng đến trang quản lý kỹ năng
    } catch (Exception e) {
        e.printStackTrace();
        // Xử lý lỗi và thông báo cho người dùng nếu có lỗi xảy ra
        // Ví dụ:
        request.setAttribute("errorMessage", "Error updating skill status: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
    }


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
