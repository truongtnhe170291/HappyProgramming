/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.vnp;

import dal.WalletDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Account;
import models.Hold;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "WalletServlet", urlPatterns = {"/wallet"})
public class WalletServlet extends HttpServlet {

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
        Account user = (Account) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        WalletDAO dao = new WalletDAO();
        Wallet wallet = dao.getWalletByUsenName(user.getUserName());
        if (wallet == null) {
            if (dao.insertWallet(new Wallet(user.getUserName(), 0, 0))) {
                wallet = dao.getWalletByUsenName(user.getUserName());
                request.setAttribute("wallet", wallet);
            }
        } else {
            request.setAttribute("wallet", wallet);
        }
        int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());
        int numPageHold = dao.getNumberPageByUserNameHold(user.getUserName());
        request.setAttribute("userInfo", user.getUserName());
        List<Transaction> list = dao.getTransactionByPaging(user.getUserName(), 1);
        List<Hold> listHold = dao.getHoldByPaging(user.getUserName(), 1);
        request.setAttribute("listTran", list);
        request.setAttribute("listHold", listHold);
        request.setAttribute("numPage", numPage);
        request.setAttribute("numPageHold", numPageHold);
        request.getRequestDispatcher("Wallet.jsp").forward(request, response);

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
