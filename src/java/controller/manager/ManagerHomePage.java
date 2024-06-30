/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.AccountDAO;
import dal.CVDAO;
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
            if(user == null){
                response.sendRedirect("LoginManager");
                return;
            }
            CVDAO cvDao = new CVDAO();
            WalletDAO dao = new WalletDAO();
            AccountDAO accountDao = new AccountDAO();

            int totalAccountRegisted = accountDao.listAccountRegisted().size();
            int totalCVs = cvDao.getTotalCVCountByStatus(1);
            int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());
            List<Transaction> listTr = dao.getTransactionByPaging(user.getUserName(), 1);
            request.setAttribute("totalCVs", totalCVs);
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
