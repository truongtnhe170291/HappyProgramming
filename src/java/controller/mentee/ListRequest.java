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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.RequestDTO;
import models.RequestSkill;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListRequest", urlPatterns = {"/ListRequest"})
public class ListRequest extends HttpServlet {


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
            // Gọi hàm getRequestOfMenteeInDeadlineByStatus để lấy danh sách các yêu cầu
            List<RequestDTO> requests = rdao.getRequestOfMenteeInDeadlineByStatus(2,menteeName);

            request.setAttribute("requests", requests);

            // Chuyển hướng đến trang ListRequest.jsp
            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }


//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int requestId = Integer.parseInt(request.getParameter("requestId"));
//        RequestDAO requestDAO = new RequestDAO();
//        try {
//            List<RequestDTO> requests = requestDAO.getRequestDetails(requestId);
//            request.setAttribute("requests", requests);
//            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(ListRequest.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

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
