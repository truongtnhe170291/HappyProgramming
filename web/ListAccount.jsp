<%-- 
    Document   : ListAccount
    Created on : 15 May 2024, 3:10:23 pm
    Author     : 2k3so
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
            <c:forEach var="a" items="${listAccount}">
                <h4>${a.toString()}</h4>
            </c:forEach>
        </h1>
    </body>
</html>
