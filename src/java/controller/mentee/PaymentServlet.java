/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.RequestDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import models.Account;
import models.Request;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

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
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int requestId = Integer.parseInt(request.getParameter("requestId"));
            RequestDAO rdao = new RequestDAO();
            WalletDAO wdao = new WalletDAO();
            Request r = rdao.getRequestById(requestId);
            if (r != null) {
                Wallet wallet = wdao.getWalletByUsenName(a.getUserName());
                wallet.setReal_binance(wallet.getReal_binance() - r.getPrice());
                if (wdao.updateWallet(wallet)) {
                    wdao.insertTransaction(new Transaction(0, a.getUserName(), "manager", LocalDateTime.now(), r.getPrice(), "Pay Request to Menttor: " + r.getMentorName()));
                    wallet = wdao.getWalletByUsenName("manager");
                    if (wallet != null) {
                        wallet.setReal_binance(wallet.getReal_binance() + r.getPrice());
                        wdao.updateWallet(wallet);
                    } else {
                        wdao.insertWallet(new Wallet("manager", r.getPrice(), 0));
                    }
                    if(rdao.updateStatus(requestId, 1)){
                        response.sendRedirect("ListRequest");
                        //return;
                    }
                }
                // chuyen huong neu error
            }
            // chuyen huong neu error
        } catch (IOException e) {
            // chuyen huong neu error
        }
        // chuyen huong neu error
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
