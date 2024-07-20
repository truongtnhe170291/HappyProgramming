<%-- 
    Document   : MyMentee
    Created on : Jun 27, 2024, 3:57:03 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Mentee</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            .main-content {
                display: flex;
            }

            .contents {
                flex: 1;
                padding: 20px;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 20px;
            }

            h1 {
                margin-top: 80px;
                margin-bottom: 30px;
                font-size: 24px;
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 15px;
                text-align: left;
            }

            th {
                background-color: #f4f4f4;
                color: #333;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .request-desc p {
                margin: 0;
            }

            .table-container {
                overflow-x: auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="control_nav.jsp" />
        <main class="main-content">
            <jsp:include page="sidebar.jsp" />
            <div class="contents">
                <h1>My Mentee</h1>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th style="background-color: #4CAF50; color: white;">Mentee Name</th>
                                <th style="background-color: #2196F3; color: white;">Title Request</th>
                                <th style="background-color: #f44336; color: white;">Skill</th>
                                <th style="background-color: #FF9800; color: white;">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${menteeRequests}" var="request">
                                <tr>
                                    <td>${request.menteeName}</td>
                                    <td>${request.title}</td>
                                    <td>
                                        <c:forEach items="${request.skills}" var="skill">
                                            <p>${skill.skillName}</p>
                                        </c:forEach>
                                    </td>
                                    <td>${request.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </body>
</html>
