<%-- 
    Document   : ListCV
    Created on : May 30, 2024, 11:12:26 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>FMaster</title>
    </head>
    <body>
        <div class="container">
            <table class="table table-striped">
                <thead>
                <th> No</th>
                <th> Mentor</th>
                <th> Status</th>
                <th> Actions</th>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.cvList}" var="cv">
                        <tr>
                            <td>${cv.cvId}</td>
                            <td>${cv.fullName}</td>
                            <td>PENDING</td>
                            <td>
                                <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=2"><button class="btn btn-info">Approve</button></a>
                                <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=3"><button class="btn btn-danger" style="margin-left: 10px;">Reject</button></a>
                                <a href="CVDetailServlet?cvId=${cv.cvId}"><button class="btn btn-info" style="margin-left: 10px;">View CV</button></a>
                            </td>
                        </tr>
                    </c:forEach>    
                </tbody>
            </table>
        </div>
    </body>
</html>
