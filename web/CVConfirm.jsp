<%-- 
    Document   : CVConfirm
    Created on : May 31, 2024, 9:32:44 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <title>CV Confirm</title>
    </head>
    <body>
        <form action="ChangeCVStatusServlet" method="POST">
            CV ID: <input type="text" name="cvId" readonly value="${requestScope.cvId}" > <br>
            Status: <input type="text" name="statusId" readonly value="${requestScope.statusId}"> <br>
            Mentor name:  <input type="text" name="mentorName" readonly value="${requestScope.mentorName}"> <br>
            Rate: <input name="rate" type="number">
            <button type="submit">Send</button>
        </form>

    </body>
</html>
