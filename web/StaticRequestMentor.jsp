<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic Requests Mentor</title>
   <style>
    body {
        font-family: 'Roboto', Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        
        background-color: #fff;
        width: 90%;
        max-width: 1200px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    h1 {
       
        text-align: center;
        font-size: 2.5em;
        margin-top: 300px;
        color: #333;
    }

    .statistics {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 30px;
    }

    .statistics div {
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        text-align: center;
        background-color: #f8f9fa;
        width: calc(33.33% - 40px);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .statistics div:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .statistics div strong {
        display: block;
        font-size: 18px;
        margin-bottom: 10px;
        color: #007bff;
    }

    .statistics div span {
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }

    .accepted {
        background-color: #d4edda;
    }

    .invited {
        background-color: #cce5ff;
    }

    .canceled {
        background-color: #f8d7da;
    }

    .cancel-percentage {
        background-color: #e2e3e5;
    }

    .percentage {
        background-color: #fff3cd;
    }

    .rating {
        background-color: #f8f9fa;
    }

    .star-rating {
        display: flex;
        justify-content: center;
        gap: 5px;
        margin-top: 10px;
    }

    .star-rating i {
        font-size: 24px; 
        color: #ffc107;
        transition: transform 0.2s ease;
    }

    .star-rating i.far {
        color: #ccc; 
    }

    .star-rating i:hover {
        transform: scale(1.2);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        color: #333;
    }

    th {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
        text-transform: uppercase;
    }

    tr:hover {
        background-color: #f5f5f5;
    }

    ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    li {
        margin-bottom: 5px;
        color: #666;
    }

    .status-open {
        color: green;
        font-weight: bold;
    }

    .status-processing {
        color: orange;
        font-weight: bold;
    }

    .status-cancel, .status-closed {
        color: red;
        font-weight: bold;
    }
    .contents {
        margin-top: 400px !important;
    }
</style>

        <!-- Include Google Fonts and Font Awesome for enhanced styling and icons -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body>
        <jsp:include page="control_nav.jsp" />
        <main class="main-content">
            <jsp:include page="sidebar.jsp" />
            <div class="contents">
                <h1 style="
    margin-top: 80px;
    margin-bottom: 30px;">Statistic Requests Mentor</h1>
                <div class="statistics">
                    <div class="accepted">
                        <strong>Completed Requests:</strong>
                        <span>${staticMentor.acceptedRequests}</span>
                    </div>
                    <div class="invited">
                        <strong>Invited Requests:</strong>
                        <span>${staticMentor.invitedRequests}</span>
                    </div>
                    <div class="canceled">
                        <strong>Canceled Requests:</strong>
                        <span>${staticMentor.canceledRequests}</span>
                    </div>
                    <div class="cancel-percentage">
                        <strong>Cancel Percentage:</strong>
                        <span>${staticMentor.cancelPercentage}%</span>
                    </div>
                    <div class="percentage">
                        <strong>Completed Percentage:</strong>
                        <span>${staticMentor.completePercentage}%</span>
                    </div>
                    <div class="rating">
                        <strong>Average Rating Stars:</strong>
                        <span class="star-rating">
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${i <= staticMentor.ratingStars}">
                                        <i class="fas fa-star"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="far fa-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </span>
                     
                    </div>

                </div>
                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">
                        <table class="table mb-0 table-borderless">
                            <thead>
                                <tr class="userDatatable-header">
                                    <th><span class="userDatatable-title">STT</span></th>
                                    <th><span class="userDatatable-title">Title</span></th>
                                    <th><span class="userDatatable-title">Mentee Name</span></th>
                                    <th><span class="userDatatable-title">Deadline</span></th>
                                    <th><span class="userDatatable-title">Skills</span></th>
                                    <th><span class="userDatatable-title">Status</span></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="request" items="${requests}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${request.title}</td>
                                        <td>${request.menteeName}</td>
                                        <td>${request.deadlineDate} ${request.deadlineHour}</td>
                                        <td>
                                            <ul>
                                                <c:forEach var="skill" items="${request.listSkills}">
                                                    <li>${skill.skillName}</li>
                                                    </c:forEach>
                                            </ul>
                                        </td>
                                        <td class="status-cell" data-status="${request.status.statusName}">${request.status.statusName}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
