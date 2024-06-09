<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Details</title>
    </head>
    <body>
        <h1>Request Details</h1>
        <c:set var="currentRequestId" value="-1" />
        <c:forEach var="request" items="${rdto}">
            <c:if test="${request.requestId != currentRequestId}">
                <h2>${request.title}</h2>
                <p><strong>Mentor Name:</strong> ${request.mentorName}</p>
                <p><strong>Mentee Name:</strong> ${request.menteeName}</p>
                <p><strong>Description:</strong> ${request.description}</p>
                <p><strong>Deadline Date:</strong> ${request.deadlineDate}</p>
                <p><strong>Deadline Hour:</strong> ${request.deadlineHour}</p>

                <p><strong>Start Time:</strong> ${request.startTime}</p>
                <p><strong>End Time:</strong> ${request.endTime}</p>
                <p><strong>Status ID:</strong> ${request.statusId}</p>
                <p><strong>Skills:</strong></p>
                <ul>
                    <c:forEach var="skill" items="${request.listSkills}">
                        <li>${skill.skillName}</li>
                        </c:forEach>
                </ul>
                <c:set var="currentRequestId" value="${request.requestId}" />
            </c:if>
            <p><strong>Day of Slot:</strong> ${request.dayOfSlot}</p>
            <p><strong>Slot Name:</strong> ${request.slotName}</p>
            <p><strong>Slot ID:</strong> ${request.slotID}</p>
        </c:forEach>
    </body>
</html>
