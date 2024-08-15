/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import dal.FeedBackDAO;
import dal.MentorDAO;
import dal.MentorProfileDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
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
import models.AttendanceRecord;
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
 * @author 2k3so
 */
@WebServlet(name = "PayForMentor", urlPatterns = {"/PayForMentor"})
public class PayForMentor extends HttpServlet {

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
            out.println("<title>Servlet PayForMentor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayForMentor at " + request.getContextPath() + "</h1>");
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
            Account a = (Account) request.getSession().getAttribute("user");
            if (a == null) {
                response.sendRedirect("LoginManager");
                return;
            }
            MentorDAO mentorDao = new MentorDAO();
            ScheduleDAO sdao = new ScheduleDAO();
            String requestId = request.getParameter("requestId");
            List<AttendanceRecord> listAtten = sdao.getListAttendanceRecoderByRequestId(requestId);
            int priceOfMentor = mentorDao.getRateOfMentor(listAtten.get(0).getMentorName());
            // chuyển đến trang dữ liệu thô
            request.setAttribute("priceOfMentor", priceOfMentor);
            request.setAttribute("listAtten", listAtten);
            request.getRequestDispatcher("ListRequestFromMenteeManager.jsp").forward(request, response);
            
            String menteeName = a.getUserName();
            RequestDAO rdao = new RequestDAO();

            rdao.updateExpiredRequestsStatus();

            List<RequestDTO> requests = new ArrayList<>();

            requests = rdao.getRequestManager(requestId);

            // Log schedules for debugging
            request.setAttribute("requests", requests);
            for (RequestDTO request1 : requests) {
                System.out.println(request1);
            }
            
            request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
 
        } catch (SQLException e) {
            throw new ServletException(e);
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
