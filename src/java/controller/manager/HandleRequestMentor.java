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
import java.util.ArrayList;
import java.util.List;
import models.Day;
import models.ScheduleDTO;
import models.SchedulePublic;
import models.Slot;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HandleSlotMentor", urlPatterns = {"/HandleSlotMentor"})
public class HandleRequestMentor extends HttpServlet {

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
            out.println("<title>Servlet HandleRequestMentor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleRequestMentor at " + request.getContextPath() + "</h1>");
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

        ScheduleDAO scheduleDAO = new ScheduleDAO();

        List<ScheduleDTO> list = scheduleDAO.getAllRequestByMentorByStatus(1);
        for(ScheduleDTO s : list){
            List<SchedulePublic> listpublic = s.getList();
            s.setList(getOneWeek(listpublic));
        }
        
        MentorDAO mentorDao = new MentorDAO();
        ArrayList<Slot> listSlot = mentorDao.listSlots();
        ArrayList<Day> listDay = mentorDao.listDays();
        
        request.setAttribute("list", list);
        request.setAttribute("listDay", listDay);
        request.setAttribute("listSlot", listSlot);
        
        request.getRequestDispatcher("ScheduleManagement.jsp").forward(request, response);

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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ScheduleDAO scheduleDAO = new ScheduleDAO();

        // Lấy mentorName, cycleId và action từ request
        String mentorName = request.getParameter("mentorName");
        int cycleId = Integer.parseInt(request.getParameter("cycleID"));
        int action = Integer.parseInt(request.getParameter("action"));

        // Kiểm tra action và gọi hàm tương ứng
        if (action == 2) {
            scheduleDAO.approveRequest(mentorName, cycleId);
        } else if (action == 3) {
            scheduleDAO.rejectRequest(mentorName, cycleId);
        }

        // Chuyển hướng người dùng về trang mong muốn sau khi xử lý
        response.sendRedirect("HandleSlotMentor");
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
