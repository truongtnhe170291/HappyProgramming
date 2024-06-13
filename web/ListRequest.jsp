<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Requests</title>
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



            tr:hover {
                background-color: #f5f5f5;
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            li {
                align-items: center;
                list-style: none;
                margin-bottom: 5px;
            }

            button {
                border-radius: 40%;
                width: 60px;
                height: 41px;
                background-color: #fff;
                margin-right: 5px;
                color: white;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
            }
            .modal-content.radius-xl {
                border-radius: 15px;
                padding: 20px;
                background-color: #fff;
            }

            .modal-body.pb-sm-50.pb-30 {
                padding-bottom: 50px;
            }

            .ticket_modal-modal h1 {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .ticket_modal-modal div {
                font-size: 16px;
                margin-bottom: 10px;
            }

            .ticket_modal-modal section {
                margin-top: 20px;
            }

            .calendar .header {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
                text-align: center;
            }

            .calendar .day {
                border-bottom: 1px solid #ccc;
                padding: 10px 0;
            }

            .calendar .day-header {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .calendar .event {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .calendar .event-dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .ticket_modal-modal label {
                font-weight: bold;
            }
            .status-open {
                width: 100px !important;
                height: 50px !important;
                color: greenyellow !important;
            }

            .status-processing {
                width: 100px !important;
                height: 50px !important;
                color: yellow !important;
            }

            .status-cancel, .status-closed {
                width: 100px !important;
                height: 50px !important;
                color: red !important;
            }
            .contents{
                padding: 0 !important;
            }
            .reject-reason {
                color: red;
                font-weight: bold;
                font-size: larger;
                background-color: yellow;
                padding: 10px;
                border: 2px solid red;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="contents">
            <h1>My Requests</h1>
            <div class="userDatatable userDatatable--ticket mt-1">
                <div class="table-responsive">
                    <div class="filter-container">
                        <form method="POST" action="FilterStatusServlet">
                            <label for="statusFilter">Filter by Status: </label>
                            <select id="statusFilter" name="statusFilter">
                                <option value="all">All</option>
                                <c:forEach var="status" items="${statuses}">
                                    <option value="${status.statusId}">${status.statusName}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="menteeName" value="${menteeName}" />
                            <button type="submit">Submit</button>
                        </form>
                    </div>

                    <table class="table mb-0 table-borderless">
                        <thead>
                            <tr class="userDatatable-header">
                                <th>
                                    <span class="userDatatable-title">Title</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Mentor Name</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Deadline</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Status</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Actions</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody id="requestTableBody">
                            <c:forEach var="request" items="${requests}">
                                <tr class="request-row" data-status="${request.status.statusName}">
                                    <td>${request.title}</td>
                                    <td>${request.mentorName}</td>
                                    <td>${request.deadlineHour} ${request.deadlineDate}</td>
                                    <td>${request.status.statusName}</td>
                                    <td class="d-flex" style="margin-top:12px;">
                                        <!-- View button -->
                                        <form method="POST" action="ListRequest">
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <div class="action-btn">
                                                <a href="#" class="btn btn-primary align-center centaxs" data-bs-toggle="modal" data-bs-target="#${request.menteeName}${request.requestId}" style="background-color: #fff; border: none;">
                                                    <i class="uil uil-eye align-center" style="color: blue;"></i>
                                                </a>
                                                <div class="modal fade ticket_modal" id="${request.menteeName}${request.requestId}" role="dialog" tabindex="-1" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                        <div class="modal-content radius-xl">
                                                            <div class="modal-body pb-sm-50 pb-30">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                        <img src="img/svg/x.svg" alt="x" class="svg">
                                                                    </button>
                                                                </div>
                                                                <div class="ticket_modal-modal">
                                                                    <h1>Request Details</h1>
                                                                    <div>Title: ${request.title}</div><br>
                                                                    <div>Mentor Name: ${request.mentorName}</div><br>
                                                                    <div>Description: ${request.description}</div><br>
                                                                    <div>Deadline: ${request.deadlineHour} ${request.deadlineDate}</div><br>
                                                                    <section id="page-content" class="no-sidebar">
                                                                        <div class="container">
                                                                            <div class="row mb-5">
                                                                                <div class="col-lg-6"></div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <div class="calendar">
                                                                                        <div class="header">
                                                                                            <h2>${request.listSchedule.get(0).startTime} - ${request.listSchedule.get(0).endTime}</h2>
                                                                                        </div>
                                                                                        <c:forEach items="${request.listSchedule}" var="schedule">
                                                                                            <div class="day">
                                                                                                <div class="day-header">${schedule.nameOfDay} - ${schedule.dayOfSlot}</div>
                                                                                                <div class="event">
                                                                                                    <div class="event-dot" style="background-color: red;"></div>
                                                                                                    <div>${schedule.slotId}: ${schedule.slot_name}</div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </section>

                                                                    <c:forEach items="${request.listSkills}" var="skill">
                                                                        <div>Request Skill :<label>${skill.skillName}</label></div><br/>
                                                                    </c:forEach>

                                                                    <c:if test="${request.status.statusId == 3}">
                                                                        <div class="reject-reason">
                                                                            Reason for reject: ${request.note}
                                                                        </div><br/>
                                                                    </c:if>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>

                                        <!-- Edit and Delete buttons -->
                                        <c:if test="${request.status.statusId == 2}">
                                            <button style="margin-bottom: 6px; border-radius: 0.42rem;" onclick="editRequest(${request.requestId})">
                                                <li>
                                                    <a href="#" class="edit">
                                                        <i class="uil uil-check"></i>
                                                    </a>
                                                </li>
                                            </button>
                                            <form method="POST" action="EditOrDeleteRequest" onsubmit="return confirm('Are you sure you want to delete this request?');">
                                                <input type="hidden" name="requestId" value="${request.requestId}" />
                                                <button style="border-radius: 0.42rem;" type="submit">
                                                    <li>
                                                        <a href="#" class="remove">
                                                            <i class="uil uil-times"></i>
                                                        </a>
                                                    </li>
                                                </button>
                                            </form>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>



        </div>
    </body>

</html>