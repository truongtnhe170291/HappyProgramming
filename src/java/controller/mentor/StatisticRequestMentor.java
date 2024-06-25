/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Account;
import models.RequestDTO;
import models.StaticMentor;

/**
 *
 * @author Admin
 */
@WebServlet(name="StatisticRequestMentor", urlPatterns={"/StatisticRequestMentor"})
public class StatisticRequestMentor extends HttpServlet {
   
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
            out.println("<title>Servlet StatisticRequestMentor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticRequestMentor at " + request.getContextPath () + "</h1>");
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
        // Lấy thông tin người dùng từ session
        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang login.jsp
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Lấy tên của mentor từ đối tượng Account
        String mentorName = a.getUserName();
        
        // Tạo một đối tượng RequestDAO
        RequestDAO rdao = new RequestDAO();
        
        // Gọi hàm getRequestOfMentorInDeadlineByStatus để lấy danh sách các yêu cầu
        List<RequestDTO> requests = rdao.getRequestOfMentorInDeadlineByStatus1(mentorName);
        
        // Gọi hàm getStaticRequestMentor để lấy các thông tin thống kê của mentor
        StaticMentor staticMentor = rdao.getStaticRequestMentor(mentorName);
        
        // Đặt các thuộc tính cho request để chuyển tiếp đến trang JSP
        request.setAttribute("requests", requests);
        request.setAttribute("staticMentor", staticMentor);
        
        // Chuyển hướng đến trang StaticRequestMentor.jsp
        request.getRequestDispatcher("StaticRequestMentor.jsp").forward(request, response);
    } catch (Exception e) {
        throw new ServletException(e);
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

}
