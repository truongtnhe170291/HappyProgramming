/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.MentorDAO;
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
import java.util.List;
import models.Account;
import models.Cycle;
import models.SchedulePublic;
import models.Slot;

/**
 *
 * @author 2k3so
 */
@WebServlet(name = "ViewDetailSchedule", urlPatterns = {"/ViewDetailSchedule"})
public class ViewDetailSchedule extends HttpServlet {

    private MentorDAO mentorDao = new MentorDAO();

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
            out.println("<title>Servlet ViewDetailSchedule</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewDetailSchedule at " + request.getContextPath() + "</h1>");
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
        String mentorName = request.getParameter("mentorName");
//        String isNext = request.getParameter("isNext");
//        if (isNext.isBlank()) {
//            System.out.println("isNext null");
//        } else {
//            mentorName = "";
//        }
        
        // get thu 2 của tuan sau nua
        LocalDate today = LocalDate.now();
        LocalDate nextMonday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
        LocalDate nextNextMonday = nextMonday.plusWeeks(1);
        Cycle c = mentorDao.getNewCycleByUser(mentorName);
        String status = "";
        String startDate = "";
        //get list schdule
        if (mentorDao.checkContainSelectSlotSave(mentorName, 6) || mentorDao.checkContainSelectSlotSave(mentorName, 1) || mentorDao.checkContainSelectSlotSave(mentorName, 2)) {
            List<SchedulePublic> listsp = mentorDao.listSlotsCycleByMentor(mentorName, c.getStart(), c.getEnd());
            if (!listsp.isEmpty()) {
                for (SchedulePublic s : listsp) {
                    LocalDate date = LocalDate.parse(s.getDayOfSlot().toString());
                    s.setNameOfDay(date.getDayOfWeek());
                    status = s.getStatus();
                }
            } else {
                response.sendRedirect("HandleSlotMentor");
            }

            for (SchedulePublic s : listsp) {
                System.out.println(s.getNameOfDay());
            }
            request.setAttribute("listScheduleSave", listsp);
        }

        request.setAttribute("status", status);
        request.setAttribute("mentorName", mentorName);

        // get list Slot
        List<Slot> listSlot = mentorDao.listSlots();

        request.setAttribute("mon", nextNextMonday);
        request.setAttribute("listSlot", listSlot);
        request.getRequestDispatcher("ViewDetailSchedule_manager.jsp").forward(request, response);
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
        processRequest(request, response);
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
