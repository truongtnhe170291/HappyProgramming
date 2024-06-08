/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

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
import java.util.List;
import models.ScheduleDTO;
import models.SchedulePublic;

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

        LocalDate today = LocalDate.now();
        String todayName = "" + today.getDayOfWeek();
        // Tìm ngày tiếp theo có thể là thứ 2
        LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
        // Tìm ngày Chủ Nhật của tuần tiếp theo
        LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
        // Mảng để lưu trữ tên các thứ trong tuần

        ScheduleDAO scheduleDAO = new ScheduleDAO();

        List<ScheduleDTO> list = scheduleDAO.getRequestByMentor(java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
        request.setAttribute("listSlot", list);
        request.getRequestDispatcher("ScheduleManagement.jsp").forward(request, response);
        
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
