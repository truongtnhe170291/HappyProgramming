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
                <th>Request ID</th>
                <th>Mentor Name</th>
                <th>Mentee Name</th>
                <th>Deadline Date</th>
                <th>Deadline Hour</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status ID</th>
                <th>Skills</th>
            </tr>
            <c:forEach var="request" items="${requests}">
                <tr>
                    <td>${request.requestId}</td>
                    <td>${request.mentorName}</td>
                    <td>${request.menteeName}</td>
                    <td>${request.deadlineDate}</td>
                    <td>${request.deadlineHour}</td>
                    <td>${request.title}</td>
                    <td>${request.description}</td>
                    <td>${request.statusId}</td>
                    <td>
                        <ul>
                            <c:forEach var="skill" items="${request.listSkills}">
                                <li>${skill.skillName}</li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
