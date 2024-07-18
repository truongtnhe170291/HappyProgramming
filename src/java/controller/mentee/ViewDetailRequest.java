/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.CVDAO;
import dal.FeedBackDAO;
import dal.MentorDAO;
import dal.MentorProfileDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import dal.WalletDAO;
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
import models.CV;
import models.Day;
import models.FeedBack;
import models.Mentor;
import models.MentorProfileDTO;
import models.Request;
import models.RequestDTO;
import models.SchedulePublic;
import models.Skill;
import models.Slot;
import models.Status;
import models.Wallet;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "ViewDetailRequest", urlPatterns = {"/ViewDetailRequest"})
public class ViewDetailRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        try {
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String requestId = request.getParameter("requestId");

            MentorDAO mentorDao = new MentorDAO();
            String menteeName = a.getUserName();
            RequestDAO rdao = new RequestDAO();
            FeedBackDAO fbDao = new FeedBackDAO();

            ArrayList<Slot> listSlots = mentorDao.listSlots();
            ArrayList<Day> listDays = mentorDao.listDays();

            LocalDate today = LocalDate.now();
            LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
            LocalDate nextNextMonday = nextMonday.plusWeeks(1);

            // Lọc danh sách ngày cho một tuần
            ArrayList<Day> oneWeekDays = getOneWeekDays(listDays);

            rdao.updateExpiredRequestsStatus();

            List<RequestDTO> requests = new ArrayList<>();
            List<Status> statuses = rdao.getAllStatuses();
            List<Mentor> mentors1 = rdao.getMentorByRequest(menteeName);

            int statusId = -1;
            requests = rdao.getRequestOfMenteeByStatusNotPaging(menteeName, requestId);

            List<SchedulePublic> listSchedule = requests.get(0).getListSchedule();
            RequestDTO requestDetail = requests.get(0);
            // Log schedules for debugging
            String skill = requestDetail.getListSkills().get(0).getSkillName();

            request.setAttribute("listScheduleSave", listSchedule);
            request.setAttribute("startTime", listSchedule.get(0).getStartTime());
            request.setAttribute("requestDetail", requestDetail);
            request.setAttribute("skillName", skill);

            request.setAttribute("mon", nextNextMonday.toString());

            request.setAttribute("requests", requests);
            request.setAttribute("listSlot", listSlots);

            // kiểm tra xem hôm nay có phải là ngày nằm giữa các ngày của requestID này không
            String startTimeStr = listSchedule.get(0).getDayOfSlot().toString();
            String endTimeStr = listSchedule.get(listSchedule.size() - 1).getDayOfSlot().toString();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate startDate = LocalDate.parse(startTimeStr, formatter);
            LocalDate endDate = LocalDate.parse(endTimeStr, formatter);

            long daysBetween = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate);
            LocalDate middleDate = startDate.plusDays(daysBetween / 2);

//            System.out.println(middleDate.format(formatter));
//            System.out.println(today);
            String isFeedback = request.getParameter("feedback");

            if (isFeedback != null) {
                if (today.isEqual(middleDate) || today.isAfter(middleDate) && requests.get(0).getStatus().getStatusId() == 1) {
                    MentorDAO mentorDAO = new MentorDAO();
                    MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
                    MentorProfileDTO mentor = mentorProfileDAO.getOneMentor(requests.get(0).getMentorName());
                    request.setAttribute("mentor", mentor);
                    request.setAttribute("mentorName", requests.get(0).getMentorName());
                    request.setAttribute("requestId", requestId);

                    if (fbDao.isContainFeedback(Integer.parseInt(requestId))) {
                        FeedBack fb = fbDao.getFeedBackByRequestId(Integer.parseInt(requestId));
                        request.setAttribute("feedbackObj", fb);
                    } else {
                        request.setAttribute("isContainFb", "no");
                    }
                    request.getRequestDispatcher("Rate_Comment.jsp").forward(request, response);
                } else {
                    request.setAttribute("avaiableFb", "avaiableFb");
                    request.getRequestDispatcher("ListRequest.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("ViewDetail_MenteeRequest.jsp").forward(request, response);
            }

//            System.out.println(dateStrBegin);
//            System.out.println(dateStrEnd);
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
//        processRequest(request, response);
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
