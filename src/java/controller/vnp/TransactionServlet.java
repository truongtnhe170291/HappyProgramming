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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import models.Account;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "TransactionServlet", urlPatterns = {"/data"})
public class TransactionServlet extends HttpServlet {

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
            WalletDAO dao = new WalletDAO();
            Account acc = (Account) request.getSession().getAttribute("user");
            String userName = acc.getUserName();
            long amount = Long.parseLong(request.getParameter("vnp_Amount")) / 100;
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
            String vnp_OrderDate = request.getParameter("vnp_PayDate");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            // Chuyển đổi chuỗi thành LocalDateTime
            LocalDateTime orderDate = LocalDateTime.parse(vnp_OrderDate, formatter);
            String status = request.getParameter("vnp_ResponseCode");
            if (status.equals("00")) {
                Transaction transaction = new Transaction(0, null, userName, orderDate, amount, vnp_OrderInfo);
                if (dao.insertTransaction(transaction)) {
                    Wallet wallet = dao.getWalletByUsenName(userName);
                    if (wallet != null) {
                        wallet.setReal_balance(wallet.getReal_balance()+transaction.getAmount());
                        dao.updateWallet(wallet);
                        response.sendRedirect("wallet");
                    } else {
                        dao.insertWallet(new Wallet(userName, transaction.getAmount(), 0));
                        response.sendRedirect("wallet");
                    }
                }
            }else{
                response.sendRedirect("wallet");
                return;
            }
        } catch (NumberFormatException e) {
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
