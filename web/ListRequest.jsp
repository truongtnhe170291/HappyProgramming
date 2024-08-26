<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>List of Requests</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
                integrity="sha512-vP0MSTlp4tfcX8OYKTBOCCi0A+zjRgw4ADYz2F0tL4J4/lA/FW5V6hfEjNUtAeECb6dJwyuV4EjZ1lkl9EP0dQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
                integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 20px;
                    background-color: #f0f0f0;
                }

                h1 {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    margin-bottom: 20px;
                }



                .header {
                    display: flex;
                    margin-bottom: 20px;
                }

                .select-container {
                    display: flex;
                    align-items: center;
                    margin-right: 20px;
                }

                label {
                    margin-right: 5px;
                    font-weight: bold;
                    color: #666;
                }

                select {
                    padding: 5px;
                    border: 1px solid #ccc;
                    border-radius: 3px;
                    background-color: #f8f8f8;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                th,
                td {
                    border: 1px solid #ddd;
                    padding: 10px;
                    text-align: center;
                    vertical-align: top;

                }

                td {
                    text-align: left;
                }

                th {
                    background-color: #4a86e8;
                    color: white;
                    font-weight: normal;
                }

                .class-block {
                    background-color: #e6f3ff;
                    border-radius: 5px;
                    padding: 5px;
                    margin-bottom: 5px;
                    text-align: left;
                }

                .attended {
                    color: green;
                }

                .absent {
                    color: red;
                }

                .view-materials,
                .edu-next {
                    display: inline-block;
                    padding: 2px 5px;
                    margin: 2px;
                    border-radius: 3px;
                    font-size: 0.8em;
                    cursor: pointer;
                }

                .view-materials {
                    background-color: #ffa500;
                    color: white;
                }

                .edu-next {
                    background-color: #4682b4;
                    color: white;
                }

                .time {
                    font-size: 0.9em;
                    color: #666;
                }

                .online-indicator {
                    display: inline-block;
                    width: 10px;
                    height: 10px;
                    background-color: #4caf50;
                    border-radius: 50%;
                    margin-left: 5px;
                    vertical-align: middle;
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

                .status-open,
                .status-processing,
                .status-cancel,
                .status-closed {
                    width: 100px !important;
                    height: 50px !important;
                }

                .status-open {
                    color: greenyellow !important;
                }

                .status-processing {
                    color: yellow !important;
                }

                .status-cancel,
                .status-closed {
                    color: red !important;
                }

                .contents {
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

                .filter-container {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 10px;
                    background-color: #f4f4f4;
                    border-radius: 5px;
                    margin-bottom: 20px;
                }

                .filter-container>form {
                    display: flex;
                    align-items: center;
                    width: 100%;
                }

                .filter-container label,
                .filter-container select,
                .filter-container input[type="date"] {
                    margin-right: 10px;
                }

                .filter-container button {
                    background-color: #007bff;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    margin-left: 20px;
                }

                .filter-container button:hover {
                    background-color: #0056b3;
                }

                .custom_modal .modal-dialog {
                    width: 100%;
                    max-width: 90%;
                }

                .equal-width {
                    background-color: #4a86e8 !important;
                    color: #fff !important;
                }

                .custom_modal .modal-content {
                    width: 100%;
                }

                .scheduleTable {
                    width: 80% !important;
                    max-width: 50% !important;
                }

                .modal-dialog-scrollable {
                    max-height: calc(100vh - 100px);
                    overflow-y: auto;
                }

                .custom_modal .modal-content {
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
                }

                .modal-header {
                    display: flex;
                    justify-content: flex-end;
                }

                .modal-header button.close img {
                    width: 20px;
                    height: 20px;
                }

                .ticket_modal-modal h1 {
                    font-size: 24px;
                    margin-bottom: 20px;
                }

                .form-container table {
                    width: 100% !important;
                    border-collapse: collapse !important;
                    font-family: Arial, sans-serif !important;
                }

                .form-container th,
                .form-container td {
                    border: 1px solid #e0e0e0 !important;
                    padding: 10px !important;
                    text-align: center !important;
                    vertical-align: top !important;
                }

                .form-container thead tr:first-child {
                    background-color: #4285f4 !important;
                    color: white !important;
                }

                .form-container thead tr:first-child th {
                    font-weight: bold !important;
                    padding: 15px 10px !important;
                }

                .form-container thead tr:nth-child(2) {
                    background-color: #e8f0fe !important;
                    color: #202124 !important;
                }

                .form-container tbody tr:first-child td:first-child {
                    font-weight: bold !important;
                    color: #202124 !important;
                }

                .form-container .slot-info {
                    background-color: #e8f0fe !important;
                    border-radius: 4px !important;
                    padding: 8px !important;
                    margin: 4px !important;
                    text-align: left !important;
                    font-size: 12px !important;
                    box-shadow: 0 1px 2px rgba(60, 64, 67, 0.3) !important;
                }

                .form-container .slot-info div {
                    margin-bottom: 4px !important;
                }

                .form-container .slot-info .class-code {
                    font-weight: bold !important;
                    color: #1a73e8 !important;
                }

                .form-container .slot-info .room {
                    color: #5f6368 !important;
                }

                .form-container .slot-info .time {
                    color: #3c4043 !important;
                }

                .form-container select {
                    border: none !important;
                    background: transparent !important;
                    font-size: inherit !important;
                    color: inherit !important;
                    cursor: pointer !important;
                }

                .form-container td:first-child,
                .form-container th:first-child {
                    width: 100px !important;
                }

                .filter-container {
                    display: flex !important;
                    justify-content: space-between !important;
                    align-items: center !important;
                    flex-wrap: wrap !important;
                    margin-bottom: 20px !important;
                    padding: 15px !important;
                    background-color: #f5f5f5 !important;
                    border-radius: 8px !important;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
                }

                .filter-container>div {
                    margin: 5px 10px !important;
                }

                .filter-container select,
                .filter-container input[type="date"] {
                    padding: 8px !important;
                    border: 1px solid #ccc !important;
                    border-radius: 4px !important;
                    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1) !important;
                    transition: border-color 0.3s ease-in-out !important;
                }

                .filter-container select:focus,
                .filter-container input[type="date"]:focus {
                    border-color: #007bff !important;
                }

                .filter-container button {
                    padding: 8px 15px !important;
                    background-color: #007bff !important;
                    color: white !important;
                    border: none !important;
                    border-radius: 4px !important;
                    cursor: pointer !important;
                    transition: background-color 0.3s ease-in-out !important;
                }

                .filter-container button:hover {
                    background-color: #0056b3 !important;
                }

                h1 {
                    text-align: center !important;
                    margin-bottom: 20px !important;
                    font-family: 'Arial', sans-serif !important;
                    color: #333 !important;
                }

                .action-buttons {
                    display: flex !important;
                    justify-content: flex-end !important;
                    align-items: center !important;
                    margin-top: 10px !important;
                }

                .action-buttons>* {
                    margin-left: 5px !important;
                }

                .action-btn {
                    display: flex;
                    justify-content: space-between;
                }

                .action-btn a {
                    display: inline-block;
                    margin-right: 10px;
                }

                .pagination {
                    display: flex;
                    width: fit-content;
                    margin-top: 10px;
                }

                .prev {
                    border-right: solid 1px rgba(0, 0, 0, .2);
                    padding-top: 13px;
                    padding-bottom: 13px;
                    padding-right: 10px;
                    padding-left: 10px;
                    margin-right: 6px;
                }

                .next {
                    border-left: solid 1px rgba(0, 0, 0, .2);
                    padding-top: 13px;
                    padding-bottom: 13px;
                    padding-left: 10px;
                    padding-right: 10px;
                    margin-left: 6px;
                }

                .pagination a,
                .pagination span {
                    text-decoration: none;
                    padding: 5px 10px;
                    border: 1px solid #ddd;
                    color: #007bff;
                    display: block;
                }

                .pagination a:hover {
                    background-color: #007bff;
                    color: #fff;
                }

                .pagination span {
                    background-color: #007bff;
                    color: #fff;
                    border-color: #007bff;
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
                            <form method="GET" action="ListRequest">
                                <label for="statusFilter">Filter by Status: </label>
                                <select id="statusFilter" name="statusFilter">
                                    <option value="all" ${statusId==-1 ? 'selected' : '' }>All</option>
                                    <c:forEach var="status" items="${statuses}">
                                        <option value="${status.statusId}" ${statusId==status.statusId ? 'selected' : ''
                                            }>
                                            ${status.statusName}
                                        </option>
                                    </c:forEach>
                                </select>

                                <label for="mentorNameFilter">Filter by Mentor Name: </label>
                                <select id="mentorNameFilter" name="mentorNameFilter">
                                    <option value="all" ${empty param.mentorNameFilter ? 'selected' : '' }>All</option>
                                    <c:forEach var="mentor" items="${mentors1}">
                                        <option value="${mentor.userName}" ${mentorName==mentor.userName ? 'selected'
                                            : '' }>
                                            ${mentor.userName}
                                        </option>
                                    </c:forEach>
                                </select>

                                <label for="startTimeFilter">Filter by Start Time: </label>
                                <input type="date" id="startTimeFilter" name="startTimeFilter"
                                    value="${startTime != null ? startTime : ''}">

                                <label for="endTimeFilter">Filter by End Time: </label>
                                <input type="date" id="endTimeFilter" name="endTimeFilter"
                                    value="${endTime != null ? endTime : ''}">

                                <button type="submit">Filter</button>
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
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <div class="action-btn">
                                                <!--                                            <a href="#" class="btn btn-primary align-center centaxs" data-bs-toggle="modal" data-bs-target="#${request.menteeName}${request.requestId}" style="background-color: #fff; border: none;">
                                                <i class="uil uil-eye align-center" style="color: blue;"></i>
                                            </a>-->

                                                <a href="ViewDetailRequest?requestId=${request.requestId}"
                                                    class="btn btn-primary align-center centaxs"
                                                    style="background-color: #fff; border: none;">
                                                    <i class="uil uil-eye align-center" style="color: blue;"></i>
                                                </a>

                                       

                                                        <c:if test="${request.status.statusId eq 1}">
                                                            <a href="ViewDetailRequest?requestId=${request.requestId}&feedback=yes"
                                                                class="btn btn-primary align-center centaxs"
                                                                style="background-color: #fff; border: none;">
                                                                <i class="uil uil-comment-alt-message align-center"
                                                                    style="color: blue;"></i>
                                                            </a>
                                                        </c:if>
                                                        <!--uil-comment-alt-message-->

                                                        <div class="modal fade ticket_modal custom_modal"
                                                            id="${request.menteeName}${request.requestId}" role="dialog"
                                                            tabindex="-1" aria-hidden="true">
                                                            <div
                                                                class="modal-dialog modal-dialog-centered modal-dialog-scrollable custom_modal">
                                                                <div class="modal-content radius-xl">
                                                                    <div class="modal-body pb-sm-50 pb-30">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close">
                                                                                <img src="img/svg/x.svg" alt="x"
                                                                                    class="svg">
                                                                            </button>
                                                                        </div>
                                                                        <div class="ticket_modal-modal">
                                                                            <h1>Request Details</h1>
                                                                            <div class="text-center">Title:
                                                                                ${request.title}</div><br>
                                                                            <div class="text-center">Mentor Name:
                                                                                ${request.mentorName}</div><br>
                                                                            <div class="text-center">Description:
                                                                                ${request.description}</div><br>
                                                                            <div class="text-center">Deadline:
                                                                                ${request.deadlineHour}
                                                                                ${request.deadlineDate}</div><br>

                                                                            <div class="form-container">
                                                                                <table border="1" width="100%">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th rowspan="2">WEEK
                                                                                                <div
                                                                                                    class="select-container">
                                                                                                    <select
                                                                                                        id="week"></select>
                                                                                                </div>
                                                                                            </th>
                                                                                            <c:forEach var="day"
                                                                                                items="${listDays}">
                                                                                                <th class="equal-width">
                                                                                                    ${day.dateName}</th>
                                                                                            </c:forEach>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <c:forEach var="slot"
                                                                                            items="${listSlots}"
                                                                                            varStatus="loop">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <c:choose>
                                                                                                        <c:when
                                                                                                            test="${slot.slot_name == '7:00 - 9:00'}">
                                                                                                            Slot 1
                                                                                                        </c:when>
                                                                                                        <c:when
                                                                                                            test="${slot.slot_name == '9:00 - 11:00'}">
                                                                                                            Slot 2
                                                                                                        </c:when>
                                                                                                        <c:when
                                                                                                            test="${slot.slot_name == '13:00 - 15:00'}">
                                                                                                            Slot 3
                                                                                                        </c:when>
                                                                                                        <c:when
                                                                                                            test="${slot.slot_name == '15:00 - 17:00'}">
                                                                                                            Slot 4
                                                                                                        </c:when>
                                                                                                        <c:otherwise>
                                                                                                            Invalid Slot
                                                                                                        </c:otherwise>
                                                                                                    </c:choose>
                                                                                                </td>
                                                                                                <c:forEach var="day"
                                                                                                    items="${listDays}">
                                                                                                    <c:set var="found"
                                                                                                        value="false" />
                                                                                                    <c:forEach
                                                                                                        var="scheduleItem"
                                                                                                        items="${request.listSchedule}">
                                                                                                        <c:if
                                                                                                            test="${scheduleItem.nameOfDay == day.dateWeek && scheduleItem.slotId == slot.slot_id}">
                                                                                                            <td>
                                                                                                                <div
                                                                                                                    class="slot-info">

                                                                                                                    <div
                                                                                                                        class="class-code">
                                                                                                                        Subject:
                                                                                                                        <c:forEach
                                                                                                                            items="${request.listSkills}"
                                                                                                                            var="skill">
                                                                                                                            ${skill.skillName}
                                                                                                                        </c:forEach>
                                                                                                                    </div>

                                                                                                                    <div
                                                                                                                        class="class-code">
                                                                                                                        time:
                                                                                                                        ${scheduleItem.slot_name}
                                                                                                                    </div>
                                                                                                                    <div class="start class-code"
                                                                                                                        value="${scheduleItem.startTime}">
                                                                                                                        startTime:
                                                                                                                        ${scheduleItem.startTime}
                                                                                                                    </div>
                                                                                                                    <div
                                                                                                                        class="class-code">
                                                                                                                        endTime:
                                                                                                                        ${scheduleItem.endTime}
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </td>
                                                                                                            <c:set
                                                                                                                var="found"
                                                                                                                value="true" />
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                    <c:if
                                                                                                        test="${not found}">
                                                                                                        <td></td>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </tr>
                                                                                        </c:forEach>
                                                                                    </tbody>
                                                                                </table>
                                                                                <br />

                                                                                <c:if
                                                                                    test="${request.status.statusId == 3}">
                                                                                    <div class="reject-note">
                                                                                        <div class="reject-icon">!</div>
                                                                                        <div class="reject-message">
                                                                                            Reason for reject:
                                                                                            ${request.note}</div>
                                                                                    </div>
                                                                                </c:if>



                                                                                <input type="hidden" id="selectedSlots"
                                                                                    name="selectedSlots" value="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Edit and Delete buttons -->
                                                        <c:if test="${request.status.statusId == 6}">
                                                            <form method="GET" action="request" ">
                                                    <input type=" hidden" name="cvId" value="${request.cvId}" />
                                                            <button type="submit" class="edit-btn btn "
                                                                style="width: 59.5px; height: 41px;border-radius: 0.42rem;" ">
                                                        <i class=" fas fa-pencil-alt"></i>
                                                            </button>
                                                            </form>
                                                            <form method="POST" action="EditOrDeleteRequest"
                                                                onsubmit="return confirm('Are you sure you want to delete this request?');">
                                                                <input type="hidden" name="requestId"
                                                                    value="${request.requestId}" />
                                                                <button type="submit" class="edit-btn btn "
                                                                    style="width: 59.5px; height: 41px;border-radius: 0.42rem;">
                                                                    <i class="fas fa-trash-alt"></i> </button>
                                                            </form>
                                                        </c:if>



                                                        <!-- Payment button for 'Wait For Payment' status -->
                                                        <c:if test="${request.status.statusName == 'Wait For Payment'}">
                                                            <form method="POST" action="payment">
                                                                <input type="hidden" name="requestId"
                                                                    value="${request.requestId}" />
                                                                <button type="submit"
                                                                    style="
                                                            width: 59.5px;
                                                            height: 41px; border-radius: 0.42rem; align-items: center; text-align: center; font-size: 20px; font-weight: bold;">
                                                                    <li>
                                                                        <a href="#" class="pay">
                                                                            <i class="uil uil-credit-card"></i>
                                                                        </a>
                                                                    </li>
                                                                </button>
                                                            </form>
                                                        </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages}">
                                    <li>
                                        <a href="ListRequest?page=${currentPage + 1}&pageSize=${pageSize}&statusFilter=${statusFilter}&mentorNameFilter=${mentorNameFilter}&startTimeFilter=${startTimeFilter}&endTimeFilter=${endTimeFilter}">Next</a>
                                    </li>
                                </c:if>
                        
                        
                    </div>


                        </div>

                    </div>
                </div>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        // Function to format date as DD-MM-YYYY
                        function formatDate(date) {
                            return (
                                date.getDate().toString().padStart(2, "0") + "-" +
                                (date.getMonth() + 1).toString().padStart(2, "0") + "-" +
                                date.getFullYear().toString().padStart(4, "0")
                            );
                        }

                        // Function to generate week options
                        function generateWeekOptions(startDateString) {
                            const startDate = new Date(startDateString);
                            const options = [];
                            for (let week = 0; week < 4; week++) {
                                const mondayOfWeek = new Date(startDate);
                                mondayOfWeek.setDate(mondayOfWeek.getDate() + week * 7);
                                const sundayOfWeek = new Date(mondayOfWeek);
                                sundayOfWeek.setDate(sundayOfWeek.getDate() + 6);
                                const optionText = formatDate(mondayOfWeek) + " to " + formatDate(sundayOfWeek);
                                options.push({ value: week + 1, text: optionText });
                            }
                            return options;
                        }

                        // Find all week selectors
                        const weekSelectors = document.querySelectorAll('.select-container select');

                        // For each week selector
                        weekSelectors.forEach((weekSelect) => {
                            // Find the start date for this specific request
                            const startElement = weekSelect.closest('.modal-body').querySelector('.start');
                            if (startElement) {
                                const startDateString = startElement.getAttribute('value');

                                // Generate week options for this specific request
                                const weekOptions = generateWeekOptions(startDateString);

                                // Populate the week selector
                                weekOptions.forEach((option) => {
                                    const optionElement = document.createElement("option");
                                    optionElement.value = option.value;
                                    optionElement.textContent = option.text;
                                    weekSelect.appendChild(optionElement);
                                });
                            }
                        });
                    });

                </script>
                <% String avaiableFb=(String) request.getAttribute("avaiableFb"); %>
                    <script>
                        const isAvaiable = "<%= avaiableFb %>";
                        if (isAvaiable != "null") {
                            alert("Not yet the date of implementation of feedback");
                        }
                    </script>
            </div>
        </body>

        </html>