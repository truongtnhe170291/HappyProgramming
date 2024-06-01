<%-- 
    Document   : CVDetails
    Created on : May 30, 2024, 11:48:56 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>CV Id: ${requestScope.cv.cvId}</div><br>
        <div>Avatar: ${requestScope.cv.imgcv}</div><br>
        <div>Mentor Name: ${requestScope.cv.userName}</div><br>
        <div>Email: ${requestScope.cv.gmail}</div><br>
        <div>Full name: ${requestScope.cv.fullName}</div><br>
        <div>DoB: ${requestScope.cv.dob.toString()}</div><br>
        <div>Gender: ${requestScope.cv.sex}</div><br>
        <div>Address: ${requestScope.cv.address}</div><br>
        <div>Profession: ${requestScope.cv.profession}</div><br>
        <div>Profession Introduction: ${requestScope.cv.professionIntro}</div><br>
        <div>Achievement Description: ${requestScope.cv.achievementDescription}</div><br>
        <div>Service Description: ${requestScope.cv.serviceDescription}</div><br>
        <div>Skills: 
            <c:forEach items="${requestScope.skills}" var="s">
                <p>${s.skillName}</p>
            </c:forEach>
            
        </div><br>
        <div>Status: ${requestScope.cv.stattusId}</div><br>
    </body>
</html>


<!--[cv_id]
      ,[mentor_name]
      ,[gmail]
      ,[full_name]
      ,[dob]
      ,[sex]
      ,[address]
      ,[profession]
      ,[profession_intro]
      ,[achievement_description]
      ,[service_description]
      ,[avatar]
      ,[status_id]-->