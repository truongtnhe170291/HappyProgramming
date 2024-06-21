<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic Requests Mentor</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f4f4f4;
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
            }

            .status-open {
                color: green;
            }

            .status-processing {
                color: orange;
            }

            .status-cancel, .status-closed {
                color: red;
            }

            .statistics {
                margin-bottom: 20px;
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
            }

            .statistics div {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                flex: 1;
                margin: 5px;
                text-align: center;
            }

            .statistics div strong {
                display: block;
                font-size: 18px;
                margin-bottom: 5px;
            }

            .statistics div span {
                font-size: 24px;
            }

            .accepted {
                background-color: #d4edda;
                color: #155724;
            }

            .invited {
                background-color: #cce5ff;
                color: #004085;
            }

            .canceled {
                background-color: #f8d7da;
                color: #721c24;
            }

            .percentage {
                background-color: #fff3cd;
                color: #856404;
            }

            .cancel-percentage {
                background-color: #e2e3e5;
                color: #383d41;
            }

            .rating {
                background-color: #FFFFFF;
                color: #FF9933;
            }

            .star-icon {
                color: #ffc107;
                font-size: 24px;
            }
            .star-rating {
                display: flex;
                color: #ffc107;
            }

            .star-rating i {
                font-size: 24px; 
            }

            .star-rating i.fas {
                color: #FF9933; 
            }

            .star-rating i.far {
                color: #ccc; 
            }

        </style>
        <!-- Include Font Awesome for star icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body>
        <jsp:include page="control_nav.jsp" />
        <main class="main-content">
            <jsp:include page="sidebar.jsp" />
            <div class="contents">
                <h1>Statistic Requests Mentor</h1>
                <div class="statistics">
                    <div class="accepted">
                        <strong>Accepted Requests:</strong>
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
