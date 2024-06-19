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
import models.RequestDTO;
import models.SchedulePublic;
import models.Slot;

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

        List<RequestDTO> requests = rdao.getRequestOfMentorInDeadlineByStatus(mentorName);

        ArrayList<Slot> listSlots = mentorDao.listSlots();
        ArrayList<Day> listDays = mentorDao.listDays();

        // Lọc lịch trình của mentor theo từng tuần
        for (RequestDTO requestDTO : requests) {
            List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
            List<SchedulePublic> filteredSchedule = getOneWeek(listSchedule);
            requestDTO.setListSchedule(filteredSchedule);
        }

        request.setAttribute("requests", requests);
        request.setAttribute("listSlots", listSlots);
        request.setAttribute("listDays", listDays);

        request.getRequestDispatcher("ListRequestMentor.jsp").forward(request, response);
    } catch (SQLException e) {
        throw new ServletException(e);
    }
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
