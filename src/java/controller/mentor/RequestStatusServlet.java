
package controller.mentor;


import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.WalletDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Request;
import models.SchedulePublic;
import models.Wallet;

@WebServlet(name = "RequestStatusServlet", urlPatterns = {"/success", "/reject"})
public class RequestStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getServletPath();
        RequestDAO requestDao = new RequestDAO();
        ScheduleDAO sdao = new ScheduleDAO();
        WalletDAO wdao = new WalletDAO();
        Account curentAccount = (Account) request.getSession().getAttribute("user");
        if (curentAccount == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            if ("/success".equals(action)) {
                requestDao.updateStatus(requestId, 5);
                List<SchedulePublic> listSchedule = sdao.getScheduleByRequestId(requestId);

                //Get all reqest in status Pening
                List<Request> listRequest = requestDao.getAllRequestByStatus(2, curentAccount.getUserName());
                List<Request> listReject = new ArrayList<>();

                for (SchedulePublic s : listSchedule) {//7: status wait for pay ment
                    sdao.updateStatusSelectedSlot(s.getSelectedId(), 7);
                    if (!listRequest.isEmpty()) {
                        for (Request r : listRequest) {
                            if (requestDao.isDuplicateSlot(s.getSelectedId(), r.getRequestId())) {
                                listReject.add(r);
                            }
                        }
                    }
                }
                if(!listReject.isEmpty()){
                    for(Request r : listReject){
                        if(r.getRequestId() == requestId){
                            continue;
                        }
                        System.out.println("1");
                        if(requestDao.updateStatus(r.getRequestId(), 3)){
                            requestDao.updateNoteRequest(r.getRequestId(), "The schedule you selected was rejected because this mentor has accepted another mentee, Please choose another schedule");
                        }
                    }
                }

            } else if ("/reject".equals(action)) {
                String note = request.getParameter("note");
                if (requestDao.updateStatus(requestId, 3)) {
                    Request r = requestDao.getRequestById(requestId);
                    Wallet w = wdao.getWalletByUsenName(r.getMenteeName());
                    w.setAvaiable_binance(w.getAvaiable_binance() + r.getPrice());
                    wdao.updateWallet(w);
                    requestDao.updateNoteRequest(requestId, note);
                }
            }
            requestDao.checkAndUpdateOverdueStatus();
            response.sendRedirect("ListRequestMentor");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}




