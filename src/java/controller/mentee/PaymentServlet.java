/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.WalletDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import models.Account;
import models.AttendanceRecord;
import models.Hold;
import models.Request;
import models.SchedulePublic;
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
            ScheduleDAO sdao = new ScheduleDAO();
            Request r = rdao.getRequestById(requestId);
            if (r != null) {
                Wallet wallet = wdao.getWalletByUsenName(a.getUserName());
                wallet.setReal_balance(wallet.getReal_balance() - r.getPrice());
                if (wdao.updateWallet(wallet)) {
                    //update hold
                    wallet.setHold(wallet.getHold() - r.getPrice());
                    wdao.updateWalletHold(wallet);
                    Hold h = new Hold(r.getMenteeName(), requestId, r.getPrice(), LocalDateTime.now(), "Cancel hold money because paid request with title: " + r.getTitle(), false);
                    wdao.inserHold(h);
                    wdao.insertTransaction(new Transaction(0, a.getUserName(), "manager", LocalDateTime.now(), r.getPrice(), "Pay request to mentor with title: " + r.getTitle()));
                    wallet = wdao.getWalletByUsenName("manager");
                    if (wallet != null) {
                        wallet.setReal_balance(wallet.getReal_balance() + r.getPrice());
                        wdao.updateWallet(wallet);
                    } else {
                        wdao.insertWallet(new Wallet("manager", r.getPrice(), 0));
                    }
                    if (rdao.updateStatus(requestId, 1)) {
                        // reject request if duplicate schedule
                        List<Request> listRequest = rdao.getAllRequestByMenteeToReject(a.getUserName());
                        List<SchedulePublic> listSchedule = sdao.getScheduleByRequestId(requestId);
                        List<Request> listReject = new ArrayList<>();

                        for (SchedulePublic s : listSchedule) {//6: Done
                            sdao.updateStatusSelectedSlot(s.getSelectedId(), 6);
                            if (!listRequest.isEmpty()) {
                                for (Request rqu : listRequest) {
                                    if (rdao.isDuplicateSlotAndDate(s.getSlotId(), s.getDayOfSlot(), rqu.getRequestId())) {
                                        listReject.add(rqu);
                                    }
                                }
                            }
                        }
                        if (!listReject.isEmpty()) {
                            Set<Request> listRejectAll = new HashSet<>(listReject);
                            for (Request rquest : listRejectAll) {
                                if (rdao.updateStatus(rquest.getRequestId(), 3)) {
                                    Wallet w = wdao.getWalletByUsenName(rquest.getMenteeName());
                                    w.setHold(w.getHold() - rquest.getPrice());
                                    wdao.updateWalletHold(w);
                                    Hold hol = new Hold(rquest.getMenteeName(), rquest.getRequestId(), rquest.getPrice(), LocalDateTime.now(), "Return the money hold by request with title: " + rquest.getTitle(), false);
                                    wdao.inserHold(hol);
                                    rdao.updateNoteRequest(rquest.getRequestId(), "The schedule you selected was rejected because this request The schedule you selected was rejected because this request is duplicated with another request, Please choose another schedule");
                                }
                            }
                        }
                        // Insert Schedule to Attendance table
                        for(SchedulePublic s : listSchedule){
                            AttendanceRecord record = new AttendanceRecord();
                            record.setMenteeName(r.getMenteeName());
                            record.setRequestId(r.getRequestId());
                            record.setSelectedId(s.getSelectedId());
                            sdao.updateAttendance(record);
                        }
                        
                        
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
