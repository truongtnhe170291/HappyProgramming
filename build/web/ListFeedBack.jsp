<%-- 
    Document   : ListFeedBack
    Created on : May 16, 2024, 11:16:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of Feedbacks</title>
</head>
<body>
    <h1>List of Feedbacks</h1>
    <table border="1">
        <tr>
            <th>Id Feedback</th>
            <th>Star</th>
            <th>Mentee Name</th>
            <th>Mentor Name</th>
            <th>Comment</th>
            <th>Time Feedback</th>
        </tr>
        <c:forEach var="a" items="${listFeedBack}">
            <tr>
                <td>${a.feedbackID}</td>
                <td>${a.star}</td>
                <td>${a.menteeName}</td>
                <td>${a.mentorName}</td>
                <td>${a.comment}</td>
                <td>${a.timeFeedBack}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>