
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
import java.util.List;
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
        
        try {
            if ("/success".equals(action)) {
                requestDao.updateStatus(requestId, 5);
                List<SchedulePublic> listSchedule = sdao.getScheduleByRequestId(requestId);
                for(SchedulePublic s : listSchedule){
                    
                }
                
            } else if ("/reject".equals(action)) {
                if(requestDao.updateStatus(requestId, 3)){
                    Request r = requestDao.getRequestById(requestId);
                    Wallet w = wdao.getWalletByUsenName(r.getMenteeName());
                    w.setAvaiable_binance(w.getAvaiable_binance()+r.getPrice());
                    wdao.updateWallet(w);
                }
            }
            requestDao.checkAndUpdateOverdueStatus();
            response.sendRedirect("ListRequestMentor");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
