package controller.mentor;

import dal.RequestDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RequestStatusServlet", urlPatterns = {"/success", "/reject"})
public class RequestStatusServlet extends HttpServlet {

 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int requestId = Integer.parseInt(request.getParameter("requestId"));
    String action = request.getServletPath();
    RequestDAO requestDao = new RequestDAO();
    
    if ("/success".equals(action)) {
        requestDao.updateStatus(requestId, 5);
    } else if ("/reject".equals(action)) {
        String note = request.getParameter("note");
        // Cập nhật trạng thái và lý do reject
        requestDao.updateStatusNote(requestId, 3, note);
    }
    //        requestDao.checkAndUpdateOverdueStatus();
    response.sendRedirect("ListRequestMentor");
}

}



