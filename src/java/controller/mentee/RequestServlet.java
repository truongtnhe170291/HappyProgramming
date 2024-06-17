/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.CVDAO;
import dal.MentorDAO;
import dal.RequestDAO;
import dal.ScheduleDAO;
import dal.SkillDAO;
import dal.WalletDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.CV;
import models.FormData;
import models.Request;
import models.SchedulePublic;
import models.Skill;
import models.Wallet;

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
            Account acc = (Account) request.getSession().getAttribute("user");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            // check if not enough binance
            String warning = (String) request.getSession().getAttribute("warning");
            if (warning != null && warning.length() > 0) {
                request.setAttribute("warning", warning);
            }

            CVDAO cvdao = new CVDAO();
            int cvId = Integer.parseInt(request.getParameter("cvId"));
            request.getSession().setAttribute("cvId", cvId);
            SkillDAO skillDAO = new SkillDAO();
            List<Skill> list = skillDAO.getSkillByCVId(cvId);
            request.setAttribute("skills", list);

            LocalDate today = LocalDate.now();
            // Tìm ngày tiếp theo có thể là thứ 2
            LocalDate nextMonday = today.plusDays(7).with(DayOfWeek.MONDAY);
            // Tìm ngày Chủ Nhật của tuần tiếp theo
            LocalDate nextSunday = nextMonday.with(DayOfWeek.SUNDAY);

            //get user_name of Mentor  by cvid
            String userName = cvdao.getCVByCVId(cvId).getUserName();

            //get rate of mentor
            MentorDAO mentorDAO = new MentorDAO();
            int rate = mentorDAO.getRateOfMentor(userName);
            request.setAttribute("rate", rate);

            // get Schedule public by user mentor name
            ScheduleDAO scheduleDAO = new ScheduleDAO();
            List<SchedulePublic> listSchedule = scheduleDAO.getListSchedulePublicByMentorName(userName, java.sql.Date.valueOf(nextMonday), java.sql.Date.valueOf(nextSunday));
            if (listSchedule.isEmpty()) {
                response.sendRedirect("homes.jsp");
                return;
            }
            for (SchedulePublic s : listSchedule) {
                DayOfWeek nameOfDay = s.getDayOfSlot().toLocalDate().getDayOfWeek();
                s.setNameOfDay(nameOfDay);
            }
            request.setAttribute("listSchedule", listSchedule);
            // set attribute CV
            CV cv = cvdao.getCVByCVId(cvId);
            request.setAttribute("cv", cv);
            request.getRequestDispatcher("Mentee_Request.jsp").forward(request, response);

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }

        String jsonString = jsonBuffer.toString();

        Gson gson = new Gson();
        FormData formData = gson.fromJson(jsonString, FormData.class);

        System.out.println("Title: " + formData.getTitle());
        System.out.println("Description: " + formData.getDescription());
        System.out.println("Deadline Date: " + formData.getDeadlineDate());
        System.out.println("Deadline Hour: " + formData.getDeadlineHour());
        System.out.println("Skill: " + formData.getSkill());
        for (FormData.Slot slot : formData.getSelectedSlots()) {
            System.out.println("Slot: " + slot.getSlot() + ", Day: " + slot.getDay());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("status", "success");
        response.getWriter().write(responseJson.toString());
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
