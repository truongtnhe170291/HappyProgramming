<%-- 
    Document   : request
    Created on : May 16, 2024, 6:30:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Request</title>
</head>
<body>
    <h2>Create Request</h2>
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
    </form>
</body>
</html>
