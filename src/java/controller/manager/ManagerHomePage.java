/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.AccountDAO;
import dal.CVDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Account;
import models.Transaction;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "ManagerHomePage", urlPatterns = {"/ManagerHomePage"})
public class ManagerHomePage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        try {
            Account user = (Account) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect("LoginManager");
                return;
            }
            CVDAO cvDao = new CVDAO();
            WalletDAO dao = new WalletDAO();
            AccountDAO accountDao = new AccountDAO();
            ScheduleDAO scheduleDao = new ScheduleDAO();
            SkillDAO skillDAO = new SkillDAO();

            int totalAccountRegisted = accountDao.listAccountRegisted().size();
            int totalCVs = cvDao.getTotalCVCountByStatus(1);
            int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());
            List<Transaction> listTr = dao.getTransactionByPaging(user.getUserName(), 1);
            int totalRequest = scheduleDao.getTotalRequestsPeding();
            int totalSkills = skillDAO.getTotalSkillCount();

            request.setAttribute("totalCVs", totalCVs);
            request.setAttribute("totalRequest", totalRequest);
            request.setAttribute("totalSkills", totalSkills);
            request.setAttribute("numPage", numPage);
            request.setAttribute("listTran", listTr);
            request.setAttribute("totalAcc", totalAccountRegisted);
            request.getRequestDispatcher("Homes_manager.jsp").forward(request, response);
        } catch (Exception e) {
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
//        processRequest(request, response);
        Account user = (Account) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("LoginManager");
            return;
        }

        CVDAO cvDao = new CVDAO();
        WalletDAO dao = new WalletDAO();
        AccountDAO accountDao = new AccountDAO();
        ScheduleDAO scheduleDao = new ScheduleDAO();
        SkillDAO skillDAO = new SkillDAO();

        int totalAccountRegisted = accountDao.listAccountRegisted().size();
        int totalCVs = cvDao.getTotalCVCountByStatus(1);
        int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());
        List<Transaction> listTr = dao.getTransactionByPaging(user.getUserName(), 1);
        int totalRequest = scheduleDao.getTotalRequestsPeding();
        int totalSkills = skillDAO.getTotalSkillCount();

        String remitter = request.getParameter("remitterS");
        boolean flag = true;
        if (remitter.isEmpty()) {
            flag = false;
        }else{
            flag = true;
        }
        
        if (flag) {
            listTr = dao.getTransactionByPagingFilter(remitter, 1);
            System.out.println("helololo");
            for (Transaction transaction : listTr) {
                System.out.println(transaction);
            }
        } else {
            listTr = null;
        }

        request.setAttribute("totalCVs", totalCVs);
        request.setAttribute("totalRequest", totalRequest);
        request.setAttribute("totalSkills", totalSkills);
        request.setAttribute("numPage", numPage);
        request.setAttribute("listTran", listTr);
        request.setAttribute("totalAcc", totalAccountRegisted);
        request.getRequestDispatcher("Homes_manager.jsp").forward(request, response);

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
