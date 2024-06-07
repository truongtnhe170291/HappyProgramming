/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentee;

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
import models.StaticMentee;

/**
 *
 * @author Admin
 */
@WebServlet(name="StaticRequest", urlPatterns={"/StaticRequest"})
public class StaticRequest extends HttpServlet {
   
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
            out.println("<title>Servlet StaticRequest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaticRequest at " + request.getContextPath () + "</h1>");
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
        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // Lấy tham số menteeName từ request
        String menteeName = a.getUserName();
        RequestDAO rdao = new RequestDAO();
        // Gọi hàm getRequestList để lấy danh sách các yêu cầu
        List<RequestDTO> requests = rdao.getRequestList(menteeName);
        StaticMentee staticMentees  = rdao.getStaticRequest(menteeName);
        request.setAttribute("requests", requests);
        request.setAttribute("staticMentees", staticMentees);
        // Chuyển hướng đến trang StaticRequestMentee.jsp
        request.getRequestDispatcher("StaticRequestMentee.jsp").forward(request, response);
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