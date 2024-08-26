<%-- 
    Document   : ListRequestFromMenteeManager
    Created on : Aug 27, 2024, 1:30:30 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Price of Mentor: ${requestScope.priceOfMentor}</h2>
        <c:forEach items="${requestScope.listAtten}" var="atten">
            <b> ${atten.attendanceId} - ${atten.menteeName} - ${atten.mentorName} - ${atten.skillName} - ${atten.dayOfSlot} - ${atten.slotId} - ${atten.slotName} - ${atten.attendanceStatus} - ${atten.attendanceDate}</b> <br/>
        </c:forEach>
    </body>
</html>
