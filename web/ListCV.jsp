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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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
                                <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=2&mentorName=${cv.userName}" data-toggle="modal" data-target="#rateModal">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Approve</button>
                                </a>
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
