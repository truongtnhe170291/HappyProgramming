/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.mentee;

import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Day;
import models.SchedulePublic;

/**
 *
 * @author 84979
 */
@WebServlet(name="Schedule_General_Mentee", urlPatterns={"/Schedule_General_Mentee"})
public class Schedule_General_Mentee extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet Schedule_General_Mentee</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Schedule_General_Mentee at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
                response.sendRedirect("Login.jsp");
                return;
            }
            if (acc.getRoleId() == 1) {
                ScheduleDAO dao = new ScheduleDAO();
                List<SchedulePublic> list = dao.getScheduleByMenteeName(acc.getUserName());
                 List<SchedulePublic> getonelist = getOneWeek(list);
                request.setAttribute("listSchedule", getonelist);
                request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
            }

        } catch (Exception e) {
request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
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
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
