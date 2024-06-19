/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentor;

import dal.CVDAO;
import dal.MentorDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import models.Account;
import models.CV;
import models.Day;
import models.SchedulePublic;
import models.Skill;
import models.Slot;
import models.Week;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "MentorRequest", urlPatterns = {"/MentorRequest"})
public class MentorRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MentorRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MentorRequest at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

            Account acc = (Account) request.getSession().getAttribute("user");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            LocalDate today = LocalDate.now();
            String todayName = "" + today.getDayOfWeek();
            // Tìm ngày tiếp theo có thể là thứ 2
            LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
            // Tìm ngày Chủ Nhật của tuần tiếp theo
            LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
            // Mảng để lưu trữ tên các thứ trong tuần

            MentorDAO mentorDao = new MentorDAO();
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            ArrayList<Slot> listSlots = mentorDao.listSlots();
            String status = scheduleDAO.getSelectedSlotStatus(acc.getUserName(), java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
            ArrayList<Day> listDays = mentorDao.listDays();
            ArrayList<Week> listCycleWeek = mentorDao.listCycleWeek();
            String SundayMonday = listDays.get(0).getDateName() + " - " + listDays.get(6).getDateName();

            if (mentorDao.getNextMonSunByUserName(acc.getUserName()).equalsIgnoreCase(SundayMonday)) {
                String error = "You already send request! Please try again in next week";
                request.setAttribute("error", error);
            } else {
                if (todayName.equalsIgnoreCase("Saturday") || todayName.equalsIgnoreCase("Sunday")) {
                    String error = "You cannot send request this time! Please try again in next week";
                    request.setAttribute("error", error);
                    if (status.equalsIgnoreCase("Approved")) {
                        //List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublic(acc.getUserName(), java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
                        //request.setAttribute("listSchedule", listSchedule);
                    }
                }
                if (status.equalsIgnoreCase("Pending")) {
                    String error = "You have booking a schedule for this week";
                    request.setAttribute("error", error);
                    //List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublic(acc.getUserName(), java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
                    //request.setAttribute("listSchedule", listSchedule);
                }
            }

            request.setAttribute("listSlots", listSlots);
            request.setAttribute("status", status);
            request.setAttribute("listDays", listDays);
            request.setAttribute("listCycleWeek", listCycleWeek);
            request.getRequestDispatcher("calendar_booking.jsp").forward(request, response);

        } catch (NumberFormatException e) {
        }
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
        MentorDAO mentorDao = new MentorDAO();
        ScheduleDAO scheduleDAO = new ScheduleDAO();

        Account acc = (Account) request.getSession().getAttribute("user");

        String[] schedule = request.getParameterValues("schedule");

        LocalDate today = LocalDate.now();
        String todayName = "" + today.getDayOfWeek();
        // Tìm ngày tiếp theo có thể là thứ 2
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        String nextMondayS = "" + nextMonday;
        // Tìm ngày Chủ Nhật của tuần tiếp theo
        LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
        String nextSundayS = "" + nextSunday;
        String SundayMonday = nextMonday + " " + nextSunday;
        String status = scheduleDAO.getSelectedSlotStatus(acc.getUserName(), java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));

        int cycleID = mentorDao.getCycleIdByStart_End(nextMondayS, nextSundayS);

        if (status.equalsIgnoreCase("pending")) {
            mentorDao.deleteSchedulePublic(acc.getUserName(), cycleID);
            for (String string : schedule) {
                String userName = acc.getUserName();
                String slotId = string.split(" ")[0];
                String slotDate = string.split(" ")[2];
                String startTime = SundayMonday.split(" ")[0];
                String endTime = SundayMonday.split(" ")[1];
                mentorDao.insertSchedulePublic(slotId, cycleID, slotDate, 1);
            }
        } else {
            for (String string : schedule) {
                String userName = acc.getUserName();
                String slotId = string.split(" ")[0];
                String slotDate = string.split(" ")[2];
                String startTime = SundayMonday.split(" ")[0];
                String endTime = SundayMonday.split(" ")[1];
                mentorDao.insertSchedulePublic(slotId, cycleID, slotDate, 1);
            }
        }

        response.sendRedirect("MentorRequest");

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
