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
            boolean checkValidDate = true;
            Account acc = (Account) request.getSession().getAttribute("user");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            MentorDAO mentorDao = new MentorDAO();
            ArrayList<Slot> listSlots = mentorDao.listSlots();

            LocalDate today = LocalDate.now();
            String todayName = "" + today.getDayOfWeek();
            // Tìm ngày tiếp theo có thể là thứ 2
            LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
            // Tìm ngày Chủ Nhật của tuần tiếp theo
            LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);

            // Mảng để lưu trữ tên các thứ trong tuần
            String[] periodName = new String[7];
            LocalDate currentDay = nextMonday;

            for (int i = 0; i < 7; i++) {
//                periodName[i] = "" + currentDay;
                periodName[i] = "" + currentDay.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
                currentDay = currentDay.plusDays(1);
            }

            String SundayMonday = nextMonday + " - " + nextSunday;

            if (todayName.equalsIgnoreCase("FRIDAY") || todayName.equalsIgnoreCase("Saturday") || todayName.equalsIgnoreCase("Sunday")) {
                String error = "You cannot send request this time! Please try again in next week";
                request.setAttribute("error", error);
            }

            request.setAttribute("period", periodName);
            request.setAttribute("listSlots", listSlots);
            request.setAttribute("SundayMonday", SundayMonday);
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
        String[] schedule = request.getParameterValues("schedule");
        String outLine = "";
        for (String string : schedule) {
            outLine += string;
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MentorRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + outLine + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
