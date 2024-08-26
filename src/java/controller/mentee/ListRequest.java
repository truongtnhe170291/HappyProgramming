/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.MentorDAO;
import dal.MentorProfileDAO;
import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import models.Account;
import models.Day;
import models.FeedBack;
import models.Mentor;
import models.MentorProfileDTO;
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
                response.sendRedirect("login");
                return;
            }

            MentorDAO mentorDao = new MentorDAO();
            String menteeName = a.getUserName();
            RequestDAO rdao = new RequestDAO();

            ArrayList<Slot> listSlots = mentorDao.listSlots();
            ArrayList<Day> listDays = mentorDao.listDays();

            // Lọc danh sách ngày cho một tuần
            ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

//            rdao.updateExpiredRequestsStatus();

            List<RequestDTO> requests = new ArrayList<>();
            List<Status> statuses = rdao.getAllStatusesMentee();
            List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);

            String statusFilter = request.getParameter("statusFilter");
            String mentorNameFilter = request.getParameter("mentorNameFilter");
            String startTimeFilter = request.getParameter("startTimeFilter");
            String endTimeFilter = request.getParameter("endTimeFilter");

            int statusId = -1;
            LocalDate startTime = null;
            LocalDate endTime = null;
            String mentorName = mentorNameFilter != null && !mentorNameFilter.equals("all") ? mentorNameFilter : "";

            if (startTimeFilter != null && !startTimeFilter.isEmpty()) {
                startTime = LocalDate.parse(startTimeFilter);
            }
            if (endTimeFilter != null && !endTimeFilter.isEmpty()) {
                endTime = LocalDate.parse(endTimeFilter);
            }

            // Lấy thông tin phân trang
            int page = 1;
            int pageSize = 5;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
            }

            int totalRequests = 0;

            if ((statusFilter == null || statusFilter.isEmpty() || "all".equals(statusFilter))
                    && (mentorNameFilter == null || mentorNameFilter.isEmpty() || "all".equals(mentorName))
                    && startTime == null && endTime == null) {
                // Case 1: No filters applied
                totalRequests = rdao.getCountRequestOfMenteeInDeadlineByStatus(menteeName);
                requests = rdao.getRequestOfMenteeInDeadlineByStatus(menteeName, page, pageSize);

            } else if ((statusFilter == null || statusFilter.isEmpty() || "all".equals(statusFilter))
                    && (mentorNameFilter == null || mentorNameFilter.isEmpty() || "all".equals(mentorName))
                    && (startTime != null || endTime != null)) {
                // Case 2: Only time filters applied
                totalRequests = rdao.getCountRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, startTime, endTime);
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, startTime, endTime, page, pageSize);

            } else if ((statusFilter == null || statusFilter.isEmpty() || "all".equals(statusFilter))
                    && (startTime == null && endTime == null)) {
                // Case 3: Only mentor filter applied
                totalRequests = rdao.getCountRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, null, null);
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, null, null, page, pageSize);

            } else if ((mentorNameFilter == null || mentorNameFilter.isEmpty() || "all".equals(mentorName))
                    && (startTime == null && endTime == null)) {
                // Case 4: Only status filter applied
                statusId = Integer.parseInt(statusFilter);
                totalRequests = rdao.getCountRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, null, null);
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, null, null, page, pageSize);

            } else {
                // Case 5: Combination of filters
                statusId = (statusFilter == null || statusFilter.isEmpty() || "all".equals(statusFilter)) ? -1 : Integer.parseInt(statusFilter);
                totalRequests = rdao.getCountRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, startTime, endTime);
                requests = rdao.getRequestsByMenteeStatusMentorTime(menteeName, statusId, mentorName, startTime, endTime, page, pageSize);

            }

            int totalPages = (int) Math.ceil((double) totalRequests / pageSize);

            // Log schedules for debugging
            for (RequestDTO requestDTO : requests) {
                List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
                List<SchedulePublic> oneWeekSchedule = getOneWeek(listSchedule);  // Lọc lịch trình theo tuần
                requestDTO.setListSchedule(oneWeekSchedule);  // Cập nhật danh sách lịch trình cho requestDTO

                for (SchedulePublic schedule : oneWeekSchedule) {
                    System.out.println("Request ID: " + requestDTO.getRequestId()
                            + " Schedule: " + schedule.getSlotId()
                            + " " + schedule.getDayOfSlot());
                }
            }

            //Check điều kiện nếu như trnajg thái là openclass và thời gian nằm giữa 2 slot đầu và cuối thì sẽ điền form "ý kiến giảng dạy"
            LocalDate todayLocalDate = LocalDate.now();
            String todayString = todayLocalDate.toString();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date today = null;
            
            try {
                today = sdf.parse(todayString);
            } catch (Exception e) {
                e.printStackTrace();
            }

            for (RequestDTO requestDTO : requests) {
                List<SchedulePublic> listSchedule = requestDTO.getListSchedule();
                if(listSchedule.get(listSchedule.size() - 1).getDayOfSlot().equals(today) || listSchedule.get(listSchedule.size() - 1).getDayOfSlot().before(today)){
                    requestDTO.setIsEnoughPay(true);
                }else{
                    requestDTO.setIsEnoughPay(false);
                }
            }
            
            for (RequestDTO requestDTO : requests) {
                System.out.println(requestDTO.isIsEnoughPay());
            }
            //Check điều kiện nếu như trnajg thái là openclass và thời gian nằm giữa 2 slot đầu và cuối thì sẽ điền form "ý kiến giảng dạy"

            request.setAttribute("requests", requests);
            request.setAttribute("listSlots", listSlots);
            request.setAttribute("listDays", oneWeekDays);  // Chỉ hiển thị danh sách ngày của một tuần
            request.setAttribute("mentors1", mentors1);
            request.setAttribute("statuses", statuses);
            request.setAttribute("statusId", statusId);
            request.setAttribute("mentorName", mentorName);
            request.setAttribute("startTime", startTimeFilter);
            request.setAttribute("endTime", endTimeFilter);
            request.setAttribute("currentPage", page);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        RequestDAO rdao = new RequestDAO();
        int totalR = rdao.getCountRequestOfMenteeInDeadlineByStatus("truong"); 
        System.out.println(totalR);
        System.out.println(rdao.getRequestOfMenteeInDeadlineByStatus("truong",1,7).size());
        List<RequestDTO> requests = new ArrayList<>();

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
