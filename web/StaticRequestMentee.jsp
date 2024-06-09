<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
        text-align: center;
    }
    tfoot td {
        font-weight: bold;
        text-align: right;
    }
</style>

<html>
    <head>
             <jsp:include page="header.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Static Request Mentee</title>
    </head>
    <body>
     <h1>Static Request Mentee</h1>
<table border="1" cellspacing="0" cellpadding="5">
    <thead>
        <tr>
            <th>Mentor Name</th>
            <th>Title</th>
            <th>Deadline Date</th>
            <th>Deadline Hour</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="req" items="${requests}">
            <tr>
                <td>${req.mentorName}</td>
                <td>${req.title}</td>
                <td>${req.deadlineDate}</td>
                <td>${req.deadlineHour}</td>
            </tr>
        </c:forEach>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="4" style="text-align: right;">
                <strong>Total Requests:</strong> ${staticMentees.totalRequest} |
                <strong>Total Hours:</strong> ${staticMentees.totalHour} |
                <strong>Total Mentors:</strong> ${staticMentees.totalMentor}
            </td>
        </tr>
    </tfoot>
</table>



    </body>
</html>