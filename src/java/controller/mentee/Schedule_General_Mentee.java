/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.MentorDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Day;
import models.Request;
import models.RequestDTO;
import models.SchedulePublic;
import models.Skill;
import models.Slot;

/**
 *
 * @author 84979
 */
@WebServlet(name = "Schedule_General_Mentee", urlPatterns = {"/Schedule_General_Mentee"})
public class Schedule_General_Mentee extends HttpServlet {

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
            out.println("<title>Servlet Schedule_General_Mentee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Schedule_General_Mentee at " + request.getContextPath() + "</h1>");
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
                response.sendRedirect("Login.jsp");
                return;
            }

            MentorDAO mentorDao = new MentorDAO();
            RequestDAO rdao = new RequestDAO();

            ArrayList<Slot> listSlots = mentorDao.listSlots();
            if (acc.getRoleId() == 1) {
                ScheduleDAO dao = new ScheduleDAO();
                List<SchedulePublic> list = dao.getScheduleByMenteeName(acc.getUserName());
                List<Skill> listSkill = rdao.getListSkillsByMenteeRequestWithOpenClass(acc.getUserName());
                request.setAttribute("listSchedule_gereral", list);
                request.setAttribute("listSkill", listSkill);
                request.setAttribute("startTime", list.get(0).getStartTime());
                List<RequestDTO> listReqq = rdao.getAllRequestByStatusAndMentee(acc.getUserName(), 1);
                List<RequestDTO> listReq = updateAbsentAndAttended(listReqq, list);
                request.setAttribute("listSlot", listSlots);
                request.setAttribute("listRequests", listReq);
                request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
            }

        } catch (ServletException | IOException e) {
            request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
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
        request.getRequestDispatcher("General_schedule_mentee.jsp").forward(request, response);
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

    private List<RequestDTO> updateAbsentAndAttended(List<RequestDTO> listReq, List<SchedulePublic> list) {
        for(RequestDTO rDTO : listReq){
            int absent = 0;
            int attended = 0;
            for(SchedulePublic sp : list){
                        System.out.println(rDTO.getRequestId()+"abc"+sp.getRequestId());

                if(rDTO.getRequestId() == sp.getRequestId()){
                    System.out.println(sp.getAttendanceStatus());
                    if(sp.getAttendanceStatus() != null && sp.getAttendanceStatus().equals("Absent")){
                        System.out.println(sp.getAttendanceStatus()+"1");
                        absent++;
                    }
                    
                    if(sp.getAttendanceStatus() != null && sp.getAttendanceStatus().equals("Attended")){
                        attended++;
                    }
                }
            }
            rDTO.setAbsent(absent);
            rDTO.setAttended(attended);
        }
        return listReq;
    }

}
