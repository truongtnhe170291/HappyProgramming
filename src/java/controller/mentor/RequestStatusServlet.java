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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import models.Account;
import models.Hold;
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
                List<Request> listRequest = requestDao.getAllRequestByStatusAndMentor(2, curentAccount.getUserName());
                List<Request> listReject = new ArrayList<>();

                for (SchedulePublic s : listSchedule) {//6: Done
                    sdao.updateStatusSelectedSlot(s.getSelectedId(), 6);
                    if (!listRequest.isEmpty()) {
                        for (Request r : listRequest) {
                            if (requestDao.isDuplicateSlot(s.getSelectedId(), r.getRequestId())) {
                                listReject.add(r);
                            }
                        }
                    }
                }
                if (!listReject.isEmpty()) {
                    Set<Request> listRejectAll = new HashSet<>(listReject);
                    for (Request r : listRejectAll) {
                        if (requestDao.updateStatus(r.getRequestId(), 3)) {
                            Wallet w = wdao.getWalletByUsenName(r.getMenteeName());
                            w.setHold(w.getHold() - r.getPrice());
                            wdao.updateWalletHold(w);
                            Hold h = new Hold(r.getMenteeName(), r.getRequestId(), r.getPrice(), LocalDateTime.now(), "Return the money hold by request with title: " + r.getTitle(), false);
                            wdao.inserHold(h);
                            requestDao.updateNoteRequest(r.getRequestId(), "The schedule you selected was rejected because this mentor has accepted another mentee, Please choose another schedule");
                        }
                    }
                }

            } else if ("/reject".equals(action)) {
                String note = request.getParameter("note");
                if (requestDao.updateStatus(requestId, 3)) {
                    Request r = requestDao.getRequestById(requestId);
                    Wallet w = wdao.getWalletByUsenName(r.getMenteeName());
                    w.setHold(w.getHold() - r.getPrice());
                    wdao.updateWalletHold(w);
                    Hold h = new Hold(r.getMenteeName(), r.getRequestId(), r.getPrice(), LocalDateTime.now(), "Return the money hold by request with title: " + r.getTitle(), false);
                    wdao.inserHold(h);
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
