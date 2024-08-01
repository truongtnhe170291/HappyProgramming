/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;


import dal.MentorProfileRateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

import models.MentorProfileRate;

/**
 *
 * @author DIEN MAY XANH
 */
@WebServlet(name="SearchMentorBySkill", urlPatterns={"/SearchMentorBySkill"})
public class SearchMentorBySkill extends HttpServlet {
   
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
            out.println("<title>Servlet SearchMentorBySkill</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchMentorBySkill at " + request.getContextPath () + "</h1>");
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
         // Lấy chuỗi tìm kiếm từ tham số yêu cầu
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm != null) {
            searchTerm = searchTerm.trim(); // Loại bỏ khoảng trắng đầu và cuối
        }

        // Tạo đối tượng DAO để truy cập dữ liệu
        MentorProfileRateDAO dao = new MentorProfileRateDAO();
       
            // Tìm kiếm các mentor dựa trên kỹ năng
            List<MentorProfileRate> mentors = dao.searchMentorsBySkill(searchTerm);
            // Đưa danh sách mentor vào thuộc tính của yêu cầu để sử dụng trong JSP
            request.setAttribute("mentors", mentors);
            // Chuyển tiếp yêu cầu đến trang JSP để hiển thị kết quả
            request.getRequestDispatcher("Mentorskill.jsp").forward(request, response);
       
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
        processRequest(request, response);
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
