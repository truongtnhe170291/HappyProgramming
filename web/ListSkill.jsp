<%-- 
    Document   : ListSkill
    Created on : May 15, 2024, 9:31:34 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FMASTER</title>
    </head>
    <body>
       <h1>
            <c:forEach var="a" items="${listSkill}">
                <h4>${a.toString()}</h4>
            </c:forEach>
        </h1>
    </body>
</html>
