/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentor;

import controller.mentee.ListRequest;
import dal.RequestDAO;
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
import models.RequestDTO;
import models.RequestSkill;

/**
 *
 * @author 84979
 */
@WebServlet(name="ListRequestMentor", urlPatterns={"/ListRequestMentor"})
public class ListRequestMentor extends HttpServlet {
   
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
            out.println("<title>Servlet ListRequestMentor</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListRequestMentor at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("Login.jsp");
                return;
            }
            String mentor = a.getUserName();
            RequestDAO rdao = new RequestDAO();
            List<RequestSkill> requests = rdao.getAllRequestsMentor(mentor);

            request.setAttribute("requestsMentor", requests);

            request.getRequestDispatcher("ListRequestMentor.jsp").forward(request, response);
        } catch (SQLException e) {
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
//        int requestId = Integer.parseInt(request.getParameter("requestId"));
//        RequestDAO requestDAO = new RequestDAO();
//        try {
//            List<RequestDTO> rdto = requestDAO.getRequestDetails(requestId);
//            request.setAttribute("rdtos", rdto);
//            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(ListRequest.class.getName()).log(Level.SEVERE, null, ex);
//        }

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
