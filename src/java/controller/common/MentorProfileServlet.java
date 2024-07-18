/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.CVDAO;
import dal.MentorDAO;
import dal.MentorProfileDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import dal.WalletDAO;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.CV;
import models.Cycle;
import models.MentorProfileDTO;
import models.Request;
import models.SchedulePublic;
import models.Skill;
import models.Slot;
import models.Wallet;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MentorProfileServlet", urlPatterns = {"/MentorProfileServlet"})
public class MentorProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet MentorProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MentorProfileServlet at " + request.getContextPath() + "</h1>");
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
        MentorProfileDAO mentorProfileDAO = new MentorProfileDAO();
        MentorProfileDTO mentor;
        try {

            CVDAO cvdao = new CVDAO();
            MentorDAO mentorDAO = new MentorDAO();
            ScheduleDAO scheduleDAO = new ScheduleDAO();

            int cvId = Integer.parseInt(request.getParameter("cvId"));

            //get user_name of Mentor  by cvid
            String userName = cvdao.getCVByCVId(cvId).getUserName();
            //get rate of mentor
            int rate = mentorDAO.getRateOfMentor(userName);
            Cycle c = mentorDAO.getNewCycleByUser(userName);
            if (c != null) {
                if (LocalDate.now().isBefore(LocalDate.parse(c.getStart()))) {

                    // get Schedule public by user mentor name
                    List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublicByMentorNameAndStatus(userName, 2, c.getCycleId());
                    if (listSchedule.isEmpty()) {
                        System.out.println("Schedule not null");
                        request.setAttribute("noBook", "No Shedules");
                    } else {

                        for (SchedulePublic s : listSchedule) {
                            DayOfWeek nameOfDay = s.getDayOfSlot().toLocalDate().getDayOfWeek();
                            s.setNameOfDay(nameOfDay);
                        }
                        request.setAttribute("listSchedule", listSchedule);
                        request.setAttribute("mon", listSchedule.get(0).getStartTime());
                    }
                } else {
                    request.setAttribute("noBook", "No Shedules");
                }
            } else {
                request.setAttribute("noBook", "No Shedules");
            }
            CV cv = cvdao.getCVByCVId(cvId);

            List<Slot> listSlot = mentorDAO.listSlots();
            // set attribute
            request.setAttribute("listSlot", listSlot);
            request.setAttribute("rate", rate);
            request.setAttribute("cv", cv);

            mentor = mentorProfileDAO.getOneMentor(userName);
            request.setAttribute("mentor", mentor);
            request.getRequestDispatcher("Mentor.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MentorProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
