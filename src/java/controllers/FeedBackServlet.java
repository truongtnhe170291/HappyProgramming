/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.FeedBack;

/**
 *
 * @author Admin
 */
@WebServlet(name="FeedBackServlet", urlPatterns={"/FeedBackServlet"})
public class FeedBackServlet extends HttpServlet {
   
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
            out.println("<title>Servlet FeedBackServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedBackServlet at " + request.getContextPath () + "</h1>");
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
       FeedBackDAO feedBackDAO = new FeedBackDAO();
        ArrayList<FeedBack> list = feedBackDAO.listFeedBacks();
        request.setAttribute("listFeedBack", list);
        request.getRequestDispatcher("ListFeedBack.jsp").forward(request, response);
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
    try {
        // Get data from form
      
        String mentorName = request.getParameter("mentorName");
        String menteeName = request.getParameter("menteeName");
        int star = Integer.parseInt(request.getParameter("star"));
        String comment = request.getParameter("comment");

        // Create new FeedBack object
        FeedBack feedBack = new FeedBack(mentorName, menteeName, star, comment, new java.sql.Date(System.currentTimeMillis()));

        // Save to database
        FeedBackDAO feedBackDAO = new FeedBackDAO();
        String status = feedBackDAO.addFeedBack(mentorName, menteeName, star, comment);

        // Redirect or forward based on status
        if ("OK".equals(status)) {
            // If successful, redirect to a success page or reload the page
            doGet(request, response);
        } else {
            // If there was an error, forward back to the form page and display an error message
            request.setAttribute("error", "There was an error submitting your feedback. Please try again.");
            request.getRequestDispatcher("FeedBackForm.jsp").forward(request, response);
        }
    } catch (Exception e) {
        // Handle any exceptions (e.g., invalid input, database connection issues)
        e.printStackTrace();
        // Forward back to the form page and display an error message
        request.setAttribute("error", "An unexpected error occurred. Please try again later.");
        request.getRequestDispatcher("feedbackForm.jsp").forward(request, response);
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