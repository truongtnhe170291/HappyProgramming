/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.MentorDAO;
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
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Day;
import models.Mentor;
import models.RequestDTO;
import models.SchedulePublic;
import models.Slot;
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

        MentorDAO mentorDao = new MentorDAO();
        String menteeName = a.getUserName();
        RequestDAO rdao = new RequestDAO();

        ArrayList<Slot> listSlots = mentorDao.listSlots();
        ArrayList<Day> listDays = mentorDao.listDays();

        // Lọc danh sách ngày cho một tuần
        ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

        rdao.updateExpiredRequestsStatus();

        List<RequestDTO> requests = rdao.getRequestOfMenteeInDeadlineByStatus(menteeName);
        List<Status> statuses = rdao.getAllStatuses();
        List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);

        // Log schedules for debugging
        for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
            List<SchedulePublic> oneWeekSchedule = getOneWeek(listSchedule);  // Lọc lịch trình theo tuần
            requestDTO.setListSchedule(oneWeekSchedule);  // Cập nhật danh sách lịch trình cho requestDTO

            for (SchedulePublic schedule : oneWeekSchedule) {
                System.out.println("Request ID: " + requestDTO.getRequestId() + 
                                    " Schedule: " + schedule.getSlotId() + 
                                    " " + schedule.getDayOfSlot());
            }
        }

        request.setAttribute("requests", requests);
        request.setAttribute("listSlots", listSlots);
        request.setAttribute("listDays", oneWeekDays);  // Chỉ hiển thị danh sách ngày của một tuần
        request.setAttribute("mentors1", mentors1);
        request.setAttribute("statuses", statuses);

        request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
    } catch (SQLException e) {
        throw new ServletException(e);
    }
}

private ArrayList<Day> getOneWeekDays(ArrayList<Day> list) {
    ArrayList<Day> listOne = new ArrayList<>();
    if (list.isEmpty()) {
        return listOne;
    }

    LocalDate referenceDate = list.get(0).getDate1().toLocalDate();

    // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
    LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
    LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

    // Lọc các ngày trong tuần đó
    for (Day day : list) {
        LocalDate dayDate = day.getDate1().toLocalDate();
        if (!dayDate.isBefore(startOfWeek) && !dayDate.isAfter(endOfWeek)) {
            listOne.add(day);
        }
    }

    return listOne;
}


// Hàm lấy lịch trình cho một tuần
private List<SchedulePublic> getOneWeek(List<SchedulePublic> list) {
    List<SchedulePublic> listOne = new ArrayList<>();
    if (list.isEmpty()) {
        return listOne;
    }
    LocalDate referenceDate = list.get(0).getDayOfSlot().toLocalDate();

    // Tìm ngày đầu tiên và ngày cuối cùng của tuần chứa ngày cho trước
    LocalDate startOfWeek = referenceDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
    LocalDate endOfWeek = referenceDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

    // Lọc các schedule trong tuần đó
    for (SchedulePublic s : list) {
        LocalDate slotDate = s.getDayOfSlot().toLocalDate();
        if (!slotDate.isBefore(startOfWeek) && !slotDate.isAfter(endOfWeek)) {
            listOne.add(s);
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