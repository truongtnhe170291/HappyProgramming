/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

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
import models.Hold;
import models.Transaction;
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PagingHold", urlPatterns = {"/PagingHold"})
public class PagingHold extends HttpServlet {

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
            String action = request.getParameter("action");
            Account user = (Account) request.getSession().getAttribute("user");
            String indexs = request.getParameter("index");
            int index;
            if (indexs != null) {
                index = Integer.parseInt(indexs);
            } else {
                index = 1;
            }
            WalletDAO dao = new WalletDAO();
            // Tạo đối tượng DAO để thao tác với dữ liệu ví
            Wallet wallet = dao.getWalletByUsenName(user.getUserName());

            // Nếu ví chưa tồn tại, tạo ví mới với số dư ban đầu bằng 0
            if (wallet == null) {
                if (dao.insertWallet(new Wallet(user.getUserName(), 0, 0))) {
                    wallet = dao.getWalletByUsenName(user.getUserName());
                }
            }

            // Đặt ví vào request attribute
            request.setAttribute("wallet", wallet);
            if (action.equals("menteeHold")) {
                if (user == null) {
                    response.sendRedirect("login");
                    return;
                }
                // transaction
                List<Transaction> list = dao.getTransactionByPaging(user.getUserName(), 1);
                int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());
                request.setAttribute("listTran", list);
                request.setAttribute("numPage", numPage);
                //hold
                List<Hold> listHold = dao.getHoldByPaging(user.getUserName(), index);
                int numPageHold = dao.getNumberPageByUserNameHold(user.getUserName());
                request.setAttribute("listHold", listHold);
                request.setAttribute("numPageHold", numPageHold);

                request.getRequestDispatcher("Wallet.jsp").forward(request, response);
                //paging for manager

            }
        } catch (ServletException | IOException | NumberFormatException e) {
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
