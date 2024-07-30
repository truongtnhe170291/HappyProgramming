/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentee;

import controllers.ShowMentors_Servlet;
import dal.MentorProfileDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.MentorProfile;

/**
 *
 * @author DIEN MAY XANH
 */
@WebServlet(name="ListMentor", urlPatterns={"/listmentor"})
public class ListMentor extends HttpServlet {
   
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
            out.println("<title>Servlet ListMentor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListMentor at " + request.getContextPath () + "</h1>");
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
         try {
             // Lấy tham số tìm kiếm từ yêu cầu
            String searchTerm = request.getParameter("searchTerm");
            String searchTermName = request.getParameter("searchTermName");
            
            // Tạo đối tượng DAO để lấy dữ liệu mentor từ cơ sở dữ liệu
            MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
            List<MentorProfile> mentors = mentorProfileDAO.getAllListMentor();
              // Nếu có từ khóa tìm kiếm, tìm mentor theo kỹ năng
             // Nếu có từ khóa tìm kiếm theo tên, tìm mentor theo tên
        if (searchTermName != null && !searchTermName.isEmpty()) {
            mentors = mentorProfileDAO.searchMentorsByName(searchTermName);
        } else if (searchTerm != null && !searchTerm.isEmpty()) {
            // Nếu có từ khóa tìm kiếm theo kỹ năng, tìm mentor theo kỹ năng
            mentors = mentorProfileDAO.searchMentorsBySkill(searchTerm);
        } else {
            // Nếu không có từ khóa tìm kiếm, lấy tất cả danh sách mentor
            mentors = mentorProfileDAO.getAllListMentor();
        }
            // Đặt danh sách mentor vào request attribute
            request.setAttribute("mentorlist", mentors);
             System.out.println(mentors);
            // Chuyển tiếp yêu cầu đến trang JSP để hiển thị danh sách mentor
           request.getRequestDispatcher("Mentorskill.jsp").forward(request, response);
        } catch (SQLException ex) {
            // Xử lý ngoại lệ SQL và chuyển tiếp đến trang lỗi
            Logger.getLogger(ShowMentors_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
public static void main(String[] args) {
        MentorProfileDAO dao = new MentorProfileDAO();

        try {
            List<MentorProfile> mentors = dao.getAllListMentor();
            for (MentorProfile mentor : mentors) {
                System.out.println(mentor);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
