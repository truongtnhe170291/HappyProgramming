<%-- 
    Document   : FeedBackForm
    Created on : May 16, 2024, 4:29:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Feedback Form</title>
</head>
<body>
    <h1>Feedback Form</h1>
  <form action="FeedBackServlet" method="post">
    <label for="mentorGmail">Mentor Name:</label><br>
    <input type="text" id="mentorName" name="mentorName"><br>
    <label for="menteeGmail">Mentee Name:</label><br>
    <input type="text" id="menteeName" name="menteeName"><br>
    <label for="star">Star:</label><br>
    <input type="number" id="star" name="star" min="1" max="5"><br>
    <label for="comment">Comment:</label><br>
    <textarea id="comment" name="comment"></textarea><br>
    <input type="submit" value="Submit">
</form>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</body>
</html>

