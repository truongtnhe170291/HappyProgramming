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

            MentorDAO mentorDao = new MentorDAO();
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            ArrayList<Slot> listSlots = mentorDao.listSlots();
            ArrayList<Day> listCurrentDays = mentorDao.listCurrentDays();

            LocalDate startDate = LocalDate.parse(listCurrentDays.get(0).getDateValue());
            LocalDate endDate = startDate.plusDays(27);

            List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublic(acc.getUserName(), java.sql.Date.valueOf(startDate), java.sql.Date.valueOf(endDate));
            if (!listSchedule.isEmpty()) {
                String status = listSchedule.get(0).getStatus();
                request.setAttribute("isSend", status);
            }
            request.setAttribute("listSlots", listSlots);
            request.setAttribute("listDays", listCurrentDays);
            request.setAttribute("listSchedule", listSchedule);
            request.getRequestDispatcher("Menter_Request.jsp").forward(request, response);

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
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ArrayList<Day> listCurrentDays = mentorDao.listCurrentDays();

        LocalDate startDate = LocalDate.parse(listCurrentDays.get(0).getDateValue());
        LocalDate endDate = startDate.plusDays(27);
        LocalDate deadLineDate = LocalDate.now().plusDays(5);

        // Lấy dữ liệu từ trang web
        String[] schedule = request.getParameterValues("schedule");
        String action = request.getParameter("action");

        System.out.println(action);

        for (String string : schedule) {
            System.out.println(string);
        }

        // Xóa đi dữ liệu về cycle cũ 
        int cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate.toString(), endDate.toString());

        //1. Xóa đi dữ liệu về Selected Slot
        mentorDao.deleteSchedulePublic(cycleID);
        //2. Xóa đi dữ liệu về Cycle
        mentorDao.deleteCycle(startDate.toString(), endDate.toString(), acc.getUserName());
        // Insert cycle cho lịch vừa book

        if (action.equalsIgnoreCase("save")) {
            if (!mentorDao.checkContainCycle(acc.getUserName(), startDate.toString(), endDate.toString())) {
                mentorDao.insertCycle(startDate.toString(), endDate.toString(), "", acc.getUserName(), deadLineDate.toString());
                for (String string : schedule) {
                    String slotId = string.split(" ")[0];
                    cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate.toString(), endDate.toString());
                    for (int i = 0; i < 4; i++) {
                        LocalDate dateByString = LocalDate.parse(string.split(" ")[1]);
                        mentorDao.insertSchedulePublic(slotId, cycleID, dateByString.plusWeeks(i).toString(), 6);
//                    System.out.println("oke");
                    }
                }
            } else {
                for (String string : schedule) {
                    cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate.toString(), endDate.toString());
                    String slotId = string.split(" ")[0];
                    for (int i = 0; i < 4; i++) {
                        LocalDate dateByString = LocalDate.parse(string.split(" ")[1]);
                        mentorDao.insertSchedulePublic(slotId, cycleID, dateByString.plusWeeks(i).toString(), 6);
//                        System.out.println("oke");
                    }
                }
            }
            response.sendRedirect("MentorRequest");
        }

        if (action.equalsIgnoreCase("send")) {
            if (!mentorDao.checkContainCycle(acc.getUserName(), startDate.toString(), endDate.toString())) {
                mentorDao.insertCycle(startDate.toString(), endDate.toString(), "", acc.getUserName(), deadLineDate.toString());
                for (String string : schedule) {
                    String slotId = string.split(" ")[0];
                    cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate.toString(), endDate.toString());
                    for (int i = 0; i < 4; i++) {
                        LocalDate dateByString = LocalDate.parse(string.split(" ")[1]);
                        mentorDao.insertSchedulePublic(slotId, cycleID, dateByString.plusWeeks(i).toString(), 1);
//                    System.out.println("oke");
                    }
                }
            } else {
                for (String string : schedule) {
                    cycleID = mentorDao.getCycleIdByMentor(acc.getUserName(), startDate.toString(), endDate.toString());
                    String slotId = string.split(" ")[0];
                    for (int i = 0; i < 4; i++) {
                        LocalDate dateByString = LocalDate.parse(string.split(" ")[1]);
                        mentorDao.insertSchedulePublic(slotId, cycleID, dateByString.plusWeeks(i).toString(), 1);
//                        System.out.println("oke");
                    }
                }
            }
            response.sendRedirect("MentorRequest?send=ok");
        }

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
