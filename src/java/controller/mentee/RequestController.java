/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.mentee;

import dal.RequestDAO;
import dal.SkillDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Request;
import models.Skill;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "RequestController", urlPatterns = {"/RequestController"})
public class RequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SkillDAO skillDAO = new SkillDAO();
        List<Skill> list = skillDAO.getSkillByUserName("user2");
        request.setAttribute("skills", list);
        request.getRequestDispatcher("request.jsp").forward(request, response);
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
        if(paramValues == null)
            response.sendRedirect("http://localhost:8080/happyprogramming/RequestController");
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
        boolean rs = dao.insertRequest(new Request(
                1,
                rawMentorName,
                rawMenteeName,
                dateLineDate,
                rawTitle,
                rawDescription,
                1,
                time), skills);
        
        response.sendRedirect("http://localhost:8080/happyprogramming/RequestController?isTrue=" + rs);
        
    }
    
    /*
    <form action="RequestController" method="post">
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
