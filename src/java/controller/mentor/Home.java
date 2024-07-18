/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.MentorDAO;
import dal.MentorProfileDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.CV;
import models.FeedBackDTO;
import models.MentorProfileDTO;
import models.RequestDTO;
import models.Skill;
import models.StaticMentor;
import services.AccountService;
import services.CVService;

/**
 *
 * @author 84979
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            Account currentAccount = (Account) request.getSession().getAttribute("user");
            if (currentAccount == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            AccountService accountService = AccountService.getInstance();
            Account acc = accountService.getAccount(currentAccount.getUserName(), currentAccount.getPassword());
            request.setAttribute("userAvatar", acc.getAvatar());
            request.setAttribute("userFullName", acc.getFullName());
            
            ScheduleDAO sdao = new ScheduleDAO();
            MentorDAO mentorDAO = new MentorDAO();
            double rate = sdao.calculateTotalEarnings(currentAccount.getUserName());
            System.out.println("Calculated rate: " + rate);
            request.setAttribute("rate", rate);
            SkillDAO skillDAO = new SkillDAO();
            List<Skill> skillList = skillDAO.topSkillPrice();
            request.setAttribute("skillList", skillList);
            RequestDAO rdao = new RequestDAO();
            // Thêm thông tin thống kê và số lượng mentee
            StaticMentor staticMentor = rdao.getStaticRequestMentor(currentAccount.getUserName());
            request.setAttribute("staticMentor", staticMentor);

            int countMentee = rdao.getCountMentee(currentAccount.getUserName());
            request.setAttribute("countMentee", countMentee);
            List<Map<String, Object>> totalR = rdao.getTotalRequestMonth(currentAccount.getUserName());
            request.setAttribute("totalR", totalR); 
            List<RequestDTO> list = rdao.getRequestProcessing(currentAccount.getUserName());
            request.setAttribute("list", list);
            MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
            List<FeedBackDTO> feedback = mentorProfileDAO.get5Feedback(currentAccount.getUserName());
            request.setAttribute("feedback", feedback);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
        ScheduleDAO sdao = new ScheduleDAO();
        double rate = sdao.calculateTotalEarnings("son");

        List<FeedBackDTO> feedback = mentorProfileDAO.get5Feedback("son");
        System.out.println(rate);
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
//        processRequest(request, response);
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
