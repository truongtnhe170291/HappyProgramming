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
import java.util.Arrays;
import java.util.List;
import models.Day;
import models.ScheduleDTO;
import models.SchedulePublic;
import models.Slot;
import models.Status;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HandleRequestMentor", urlPatterns = {"/HandleSlotMentor"})
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
    MentorDAO mentorDao = new MentorDAO();

    // Lấy các tham số từ request
    String mentorName = request.getParameter("mentorName");
    String statusFilter = request.getParameter("statusFilter");
    String pageParam = request.getParameter("page");
    int page = pageParam != null ? Integer.parseInt(pageParam) : 1;
    int pageSize = 2; // Số lượng item trên mỗi trang

    List<ScheduleDTO> list;
    int totalRequests;

    // Xử lý các trường hợp search và filter
    if (mentorName != null && !mentorName.isEmpty() && statusFilter != null && !statusFilter.isEmpty()) {
        // Search và Filter
        int statusId = Integer.parseInt(statusFilter);
        list = scheduleDAO.searchRequestByMentorNameAndStatus(mentorName, statusId, page, pageSize);
        totalRequests = scheduleDAO.getTotalRequestByMentorNameAndStatus(mentorName, statusId);
    } else if (mentorName != null && !mentorName.isEmpty() && (statusFilter == null || statusFilter.isEmpty())) {
        // Chỉ Search
        list = scheduleDAO.getAllRequestByMentorName(mentorName, page, pageSize);
        totalRequests = scheduleDAO.getTotalRequestByMentorName(mentorName);
    } else if (statusFilter != null && !statusFilter.isEmpty() && (mentorName == null || mentorName.isEmpty())) {
        // Chỉ Filter
        int statusId = Integer.parseInt(statusFilter);
        list = scheduleDAO.getAllRequestByMentorByStatus(statusId, page, pageSize);
        totalRequests = scheduleDAO.getTotalRequestByStatus(statusId);
    } else {
        // Không Search, Không Filter
        list = scheduleDAO.getAllRequestByMentor(page, pageSize);
        totalRequests = scheduleDAO.getTotalRequests();
    }

    // Tính số trang dựa trên tổng số request và pageSize
    int totalPages = (int) Math.ceil((double) totalRequests / pageSize);

    // Lấy danh sách các Slot từ MentorDAO
    ArrayList<Slot> listSlot = mentorDao.listSlots();
    List<Status> statusList = scheduleDAO.getAllStatus();

    // Đặt các thuộc tính vào request để chuyển đến trang ScheduleManagement.jsp
    request.setAttribute("list", list);
    request.setAttribute("statusList", statusList);
    request.setAttribute("listSlot", listSlot);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("mentorName", mentorName);
    request.setAttribute("statusFilter", statusFilter);
    request.setAttribute("pageSize", pageSize); // Gán pageSize vào request

    request.getRequestDispatcher("ScheduleManagement.jsp").forward(request, response);
}


    public static void main(String[] args) {
          ScheduleDAO scheduleDAO = new ScheduleDAO();
    MentorDAO mentorDao = new MentorDAO();
    int totalRequests = scheduleDAO.getTotalRequestByMentorName("son");
     List<ScheduleDTO> list = scheduleDAO.getAllRequestByMentorName("son",1,5);
        System.out.println(totalRequests);
        System.out.println(list.size());
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
        int cycleId = Integer.parseInt(request.getParameter("cycleID"));
        int action = Integer.parseInt(request.getParameter("action"));
        String message = request.getParameter("notes");
        System.out.println(cycleId + ""+ action);
        // Kiểm tra action và gọi hàm tương ứng
        System.out.println(message);
        if (action == 2) {
            scheduleDAO.approveRequest(cycleId);
        } else if (action == 3) {
                  scheduleDAO.rejectRequestNew(cycleId, message);
        }

//    if (action == 2) {
//        scheduleDAO.approveRequest(cycleId);
//    } else if (action == 3) {
//        String rejectReason = request.getParameter("rejectReason");
//        scheduleDAO.rejectRequest(cycleId, rejectReason);
//    }

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
