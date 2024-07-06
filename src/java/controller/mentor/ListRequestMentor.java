/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.MentorDAO;
import dal.RequestDAO;
import java.io.IOException;
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
import models.Account;
import models.Day;
import models.Mentee;
import models.Mentor;
import models.RequestDTO;
import models.SchedulePublic;
import models.Slot;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ListRequestMentor", urlPatterns = {"/ListRequestMentor"})
public class ListRequestMentor extends HttpServlet {


 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Account a = (Account) request.getSession().getAttribute("user");
        if (a == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String mentorName = a.getUserName();
        RequestDAO rdao = new RequestDAO();
        MentorDAO mentorDao = new MentorDAO();

        String statusFilterParam = request.getParameter("statusFilter");
        String menteeNameFilter = request.getParameter("menteeNameFilter");
        String pageParam = request.getParameter("page");
        int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = 3; // Number of requests per page

        List<RequestDTO> requests;
        int totalRequests;

        if ((statusFilterParam != null && !statusFilterParam.isEmpty()) && (menteeNameFilter != null && !menteeNameFilter.isEmpty())) {
            int statusFilter = Integer.parseInt(statusFilterParam);
            requests = rdao.getRequestMentorByStatusAndMenteeName(mentorName, statusFilter, menteeNameFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMentorCountByStatusAndMenteeName(mentorName, statusFilter, menteeNameFilter);
        } else if (statusFilterParam != null && !statusFilterParam.isEmpty()) {
            int statusFilter = Integer.parseInt(statusFilterParam);
            requests = rdao.getRequestMentorByStatus(mentorName, statusFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMentorCountByStatus(mentorName, statusFilter);
        } else if (menteeNameFilter != null && !menteeNameFilter.isEmpty()) {
            requests = rdao.getRequestMentorByMenteeName(mentorName, menteeNameFilter, page, pageSize);
            totalRequests = rdao.getTotalRequestMentorCountByMenteeName(mentorName, menteeNameFilter);
        } else {
            requests = rdao.getRequestOfMentorInDeadlineByStatus(mentorName, page, pageSize);
            totalRequests = rdao.getTotalRequestMentor(mentorName);
        }

        int totalPages = (int) Math.ceil((double) totalRequests / pageSize);

        // Fetch other necessary data like slots, days, mentees, and statuses
        ArrayList<Slot> listSlots = mentorDao.listSlots();
        ArrayList<Day> listDays = mentorDao.listDays();
        List<Mentee> mentee1 = rdao.getMenteeByRequest(mentorName);
        List<Status> listStatus = rdao.getAllStatuses();

        // Filter schedule to show only one week
        for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
            List<SchedulePublic> filteredSchedule = getOneWeek(listSchedule);
            requestDTO.setListSchedule(filteredSchedule);
        }

        // Filter list of days to show only the current week
        ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

        // Set attributes for JSP rendering
        request.setAttribute("mentee1", mentee1);
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("requests", requests);
        request.setAttribute("listSlots", listSlots);
        request.setAttribute("listDays", oneWeekDays);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("statusFilter", statusFilterParam != null ? statusFilterParam : "");
        request.setAttribute("menteeNameFilter", menteeNameFilter != null ? menteeNameFilter : "");

        request.getRequestDispatcher("ListRequestMentor.jsp").forward(request, response);
    } catch (SQLException e) {
        throw new ServletException(e);
    }
}





    public static void main(String[] args) throws SQLException {
      MentorDAO mentorDao = new MentorDAO();
      RequestDAO rdao = new RequestDAO();
         List<RequestDTO> requests = rdao.getRequestMentorByStatus("son", 1,1,2);
         int d = rdao.getTotalRequestMentorCountByStatus("son", 1);
           System.out.println(requests.size());
           System.out.println(d);
    }

// Hàm để lọc lịch trình theo tuần
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

// Hàm để lọc các ngày trong một tuần từ danh sách các ngày
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



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       request.getRequestDispatcher("ListRequestMentor.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
