/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.CVDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import models.CV;
import models.Request;
import models.SchedulePublic;
import models.Skill;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RequestServlet", urlPatterns = {"/request"})
public class RequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CVDAO cvdao = new CVDAO();
            //int cvId = Integer.parseInt(request.getParameter("cvId"));
            int cvId = 2;
            SkillDAO skillDAO = new SkillDAO();
            List<Skill> list = skillDAO.getSkillByCVId(cvId);
            request.setAttribute("skills", list);

            LocalDate today = LocalDate.now();
            // Tìm ngày tiếp theo có thể là thứ 2
            LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
            // Tìm ngày Chủ Nhật của tuần tiếp theo
            LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);
            
            //get user_name of Mentor  by cvid
            //String userName = cvdao.getCVByCVId(cvId).getUserName();
            String userName = cvdao.getCVByCVId(cvId).getUserName();
            System.out.println(userName);
            request.setAttribute("userNameMentor", userName);
            // get Schedule public by user mentor name
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<SchedulePublic> listSchedule = scheduleDAO.GetListSchedulePublicByMentorName(userName, java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
            request.setAttribute("listSchedule", listSchedule);
            
            // set attribute CV
            CV cv = cvdao.getCVByCVId(cvId);
            request.setAttribute("cv", cv);
            request.getRequestDispatcher("Mentor_calendar.jsp").forward(request, response);
            
            
            
            
            for(SchedulePublic s : listSchedule){
                
            }
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
        String[] paramValues = request.getParameterValues("skills");
        List<Integer> skills = new ArrayList<>();
        for (String paramValue : paramValues) {
            skills.add(Integer.parseInt(paramValue));
        }
        if (paramValues == null) {
            response.sendRedirect("http://localhost:8080/happyprogramming/RequestController");
        }
        String rawMentorName = request.getParameter("mentorName");
        String rawMenteeName = request.getParameter("menteeName");
        String rawDatelineDate = request.getParameter("deadlineDate");
        LocalDate dateLineDate = LocalDate.parse(rawDatelineDate);
        String rawTime = request.getParameter("deadlineHour");
        LocalTime time = LocalTime.parse(rawTime);
        String rawTitle = request.getParameter("deadlineHour");
        //description
        String rawDescription = request.getParameter("description");

        RequestDAO dao = new RequestDAO();
//        boolean rs = dao.insertRequest(new Request(
//                1,
//                rawMentorName,
//                rawMenteeName,
//                dateLineDate,
//                rawTitle,
//                rawDescription,
//                1,
//                time), skills);

        response.sendRedirect("http://localhost:8080/happyprogramming/RequestController?isTrue=");

    }

    /*
    <form action="RequestServlet" method="post">
        <label for="mentorName">Mentor Name:</label>
        <input type="text" id="mentorName" name="mentorName" value="user2" required><br>
        
        <label for="gMailMentee">Mentee Name:</label>
        <input type="text" id="menteeName" name="menteeName" value="user1" required><br>
        
        <label for="deadlineDate">Deadline Date:</label>
        <input type="date" id="deadlineDate" name="deadlineDate" required><br>
        
        <label for="deadlineHour">Deadline Hour:</label>
        <input type="time" id="deadlineHour" name="deadlineHour" required><br>
        
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br>
        
        <label for="skills">Select Skills:</label><br>
        <c:forEach var="skill" items="${skills}">
            <input type="checkbox" id="skill${skill.skillID}" name="skills" value="${skill.skillID}">
            <label for="skill${skill.skillID}">${skill.skillName}</label><br>
        </c:forEach>
        
        <input type="submit" value="Submit">
    </form>*/
}
