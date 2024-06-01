<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Requests</title>
    </head>
    <body>
       <h1>List of Requests</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Mentor Name</th>
        <th>Deadline Date</th>
        <th>Deadline Hour</th>
        <th>Skills</th>
        <th>Description</th>
        <th>Actions</th> <!-- Thêm cột mới cho các hành động -->
    </tr>
    <c:forEach var="request" items="${requests}">
        <tr>
            <td>${request.title}</td>
            <td>${request.mentorName}</td>
            <td>${request.deadlineDate}</td>
            <td>${request.deadlineHour}</td>
            <td>
                <ul>
                    <c:forEach var="skill" items="${request.listSkills}">
                        <li>${skill.skillName}</li>
                    </c:forEach>
                </ul>
            </td>
            <td>${request.description}</td>
            <td> <!-- Thêm các nút hành động vào cột mới -->
                <button onclick="viewDetails(${request.requestId})">View Details</button>
                <button onclick="editRequest(${request.requestId})">Edit</button>
                <button onclick="deleteRequest(${request.requestId})">Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>

</html>
