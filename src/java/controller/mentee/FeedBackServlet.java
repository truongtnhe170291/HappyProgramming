/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import controllers.*;
import dal.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.Account;
import models.FeedBack;
import services.VietnameseConverter;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FeedBackServlet", urlPatterns = {"/feedback"})
public class FeedBackServlet extends HttpServlet {

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
            out.println("<title>Servlet FeedBackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedBackServlet at " + request.getContextPath() + "</h1>");
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
//       FeedBackDAO feedBackDAO = new FeedBackDAO();
//        ArrayList<FeedBack> list = feedBackDAO.listFeedBacks();
//        request.setAttribute("listFeedBack", list);
//        request.getRequestDispatcher("ListFeedBack.jsp").forward(request, response);
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
        try {
            HttpSession session = request.getSession();
            //kiểm tra đã login chx
            Account account = (Account) session.getAttribute("user");

            if (account != null) {
                //lấy thông tin đã nhập từ jsp
                int star = Integer.parseInt(request.getParameter("rate"));
                String comment = VietnameseConverter.removeDiacritics(request.getParameter("comment"));
                String mentorName = request.getParameter("mentorname");
                String requestId_raw = request.getParameter("requestId");
                int requestId = Integer.parseInt(requestId_raw);
                java.util.Date utilDate = new java.util.Date(); // Current date
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // Convert to java.sql.Date

                System.out.println(star);
                System.out.println(comment);
                System.out.println(mentorName);
                System.out.println(requestId);
                System.out.println(sqlDate);

//                FeedBack feedBack = new FeedBack(mentorName, account.getUserName(), star, comment, sqlDate);
                FeedBack feedBack = new FeedBack(mentorName, account.getUserName(), star, requestId, comment, sqlDate);

                FeedBackDAO feedBackDAO = new FeedBackDAO();

                String status = "";

                if (request.getParameter("isContainFb") != null) {
                    status = feedBackDAO.updateFeedBack(feedBack);
                } else {
                    status = feedBackDAO.addFeedBack(feedBack);
                }
                if ("OK".equals(status)) {
                    response.sendRedirect("ListRequest"); // Redirect on success
                } else {
                    response.getWriter().write("fail to insert: " + status); // Chi tiết lỗi// Redirect on failure
                }
            } else {
                response.sendRedirect("login.jsp?error=You must be logged in to submit feedback.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("System Error");
        }
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
