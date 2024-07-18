<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistics Request Mentee</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
     
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0px 40px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            padding: 30px;
            width: 90%;
            max-width: 1200px;
        }
        h1 {
            color: #4a4a4a;
            text-align: center;
            font-size: 2.8em;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        th, td {
            padding: 20px;
            text-align: left;
            vertical-align: middle;
        }
        thead tr {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        thead th:first-child { border-top-left-radius: 15px; }
        thead th:last-child { border-top-right-radius: 15px; }
        tbody tr {
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        tbody tr:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        tbody td:first-child { border-top-left-radius: 15px; border-bottom-left-radius: 15px; }
        tbody td:last-child { border-top-right-radius: 15px; border-bottom-right-radius: 15px; }
        .totals {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            padding: 20px;
            background: linear-gradient(90deg, #4b6cb7 0%, #182848 100%);
            border-radius: 15px;
            color: white;
            font-weight: 600;
        }
        .total-item {
            text-align: center;
        }
        .total-item i {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .total-value {
            font-size: 1.5em;
        }
    </style>
</head>
<body>
       <jsp:include page="header.jsp" />
<br/>
    <div class="container">
        <h1>Statistics Request Mentee</h1>
        <table>
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
        </table>
        <div class="totals">
            <div class="total-item">
                <i class="fas fa-clipboard-list"></i>
                <div>Total Requests</div>
                <div class="total-value">${staticMentees.totalRequest}</div>
            </div>
            <div class="total-item">
                <i class="fas fa-clock"></i>
                <div>Total Hours</div>
                <div class="total-value">${staticMentees.totalHour}</div>
            </div>
            <div class="total-item">
                <i class="fas fa-user-tie"></i>
                <div>Total Mentors</div>
                <div class="total-value">${staticMentees.totalMentor}</div>
            </div>
        </div>
    </div>
</body>
</html>