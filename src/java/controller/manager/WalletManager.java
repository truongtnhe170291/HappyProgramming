/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manager;

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
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name="WalletManager", urlPatterns={"/WalletManager"})
public class WalletManager extends HttpServlet {
   
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
            out.println("<title>Servlet WalletManager</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WalletManager at " + request.getContextPath () + "</h1>");
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
    Account user = (Account) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Tạo đối tượng DAO để thao tác với dữ liệu ví
    WalletDAO dao = new WalletDAO();
    Wallet wallet = dao.getWalletByUsenName(user.getUserName());

    // Nếu ví chưa tồn tại, tạo ví mới với số dư ban đầu bằng 0
    if (wallet == null) {
        if (dao.insertWallet(new Wallet(user.getUserName(), 0, 0))) {
            wallet = dao.getWalletByUsenName(user.getUserName());
        }
    }

    // Đặt ví vào request attribute
    request.setAttribute("wallet", wallet);

    // Lấy số lượng trang giao dịch
    int numPage = dao.getNumberPageByUserNameTransaction(user.getUserName());

    // Lấy danh sách giao dịch theo phân trang
    int currentPage = 1; // Hoặc lấy từ request parameter nếu có
    List<Transaction> list = dao.getTransactionByPaging(user.getUserName(), currentPage);

   
    request.setAttribute("listTran", list);
    request.setAttribute("numPage", numPage);

    // Chuyển tiếp request và response đến trang Wallet.jsp
    request.getRequestDispatcher("WalletManager.jsp").forward(request, response);
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
        processRequest(request, response);
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
