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
                        <form method="POST" action="ListRequest">
                            <input type="hidden" name="requestId" value="${request.requestId}" />
                            <button type="submit">View Details</button>
                        </form>
                        <button onclick="editRequest(${request.requestId})">Edit</button>
                        <form method="POST" action="EditOrDeleteRequest" onsubmit="return confirm('Are you sure you want to delete this request?');">
                            <input type="hidden" name="requestId" value="${request.requestId}" />
                            <button type="submit">Delete</button>
                        </form>


                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>

</html>
