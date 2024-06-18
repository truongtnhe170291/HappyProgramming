/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.Mentor;
import models.RequestDTO;
import models.SchedulePublic;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListRequest", urlPatterns = {"/ListRequest"})
public class ListRequest extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Lấy tham số menteeName từ request
            String menteeName = a.getUserName();
            RequestDAO rdao = new RequestDAO();
            rdao.updateExpiredRequestsStatus();
            // Gọi hàm getRequestOfMenteeInDeadlineByStatus để lấy danh sách các yêu cầu
            List<RequestDTO> requests = rdao.getRequestOfMenteeInDeadlineByStatus(menteeName);
            List<Status> statuses = rdao.getAllStatuses();
            List<SchedulePublic> combinedSchedulePublics = new ArrayList<>();
        for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> schedulePublics = requestDTO.getListSchedule();
            if (schedulePublics != null) {
                combinedSchedulePublics.addAll(schedulePublics);
            }
        }
        
        // Lọc để lấy một tuần
        List<SchedulePublic> listSchedule = getOneWeek(combinedSchedulePublics);
            List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);
            request.setAttribute("requests", requests);
            request.setAttribute("listSchedule", listSchedule);
            request.setAttribute("mentors1", mentors1);
            request.setAttribute("statuses", statuses);
            
            // Chuyển hướng đến trang ListRequest.jsp
            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    private List<SchedulePublic> getOneWeek(List<SchedulePublic> list) {
        List<SchedulePublic> listOne = new ArrayList<>();
        LocalDate referenceDate = list.get(0).getDayOfSlot().toLocalDate();

        // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
        LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        // Tạo danh sách các ngày trong tuần
        List<LocalDate> weekDates = new ArrayList<>();
        LocalDate current = startOfWeek;
        while (!current.isAfter(endOfWeek)) {
            weekDates.add(current);
            current = current.plusDays(1);
        }
        for (SchedulePublic s : list) {
            for (LocalDate d : weekDates) {
                if (s.getDayOfSlot().toLocalDate().isEqual(d)) {
                    listOne.add(s);
                }
            }
        }

        return listOne;
    }
    

       



//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int requestId = Integer.parseInt(request.getParameter("requestId"));
//        RequestDAO requestDAO = new RequestDAO();
//        try {
//            List<RequestDTO> requests = requestDAO.getRequestDetails(requestId);
//            request.setAttribute("requests", requests);
//            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
//        } catch (SQLException ex) {
//            Logger.getLogger(ListRequest.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

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
