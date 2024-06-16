/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.AccountDAO;
import dal.MentorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MentorSetRate", urlPatterns = {"/SetRate"})
public class SetRateController extends HttpServlet {

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
            out.println("<title>Servlet MentorSetRate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MentorSetRate at " + request.getContextPath() + "</h1>");
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
    private MentorDAO mentorDAO;

    public void init() {
        mentorDAO = new MentorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rate = 0;
        AccountDAO accDao = new AccountDAO();
        HttpSession session = request.getSession();
        Account curentAccount = (Account) session.getAttribute("user");
        if(curentAccount == null){
            response.sendRedirect("Login.jsp");
            return;
        }
        Account acc = accDao.getAccount(curentAccount.getUserName(), curentAccount.getPassword());
        if (acc.getRoleId() == 1) {
            response.sendRedirect("homes.jsp");
            return;
        }
        if (acc.getRoleId() == 2) {
            rate = mentorDAO.getRateOfMentor(acc.getUserName());
            request.setAttribute("rate", rate);
            request.setAttribute("mentorName", acc.getUserName());
            request.getRequestDispatcher("Mentor_SetRate.jsp").forward(request, response);
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
        int rate = Integer.parseInt(request.getParameter("rate"));
        String mentorName = request.getParameter("mentorName");
        mentorDAO.changeMentorRate(mentorName, rate);
        response.sendRedirect("SetRate");

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
