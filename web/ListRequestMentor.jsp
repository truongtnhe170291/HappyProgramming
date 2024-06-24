<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                border-collapse: separate;
                border-spacing: 0;
                color: white;
            }
            .form-container .schedule-table .tableslot th,
            .form-container .schedule-table .tableslot td {
                border: 0.2px solid #e0e0e0 !important;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #4285f4;
                font-weight: bold;
                border-bottom: 2px solid #ffffff;
            }

            td {
                background-color: #ffffff;
                color: #333;
                vertical-align: top;
                height: 100px;
                border-bottom: 1px solid #e0e0e0;
            }

            td + td {
                border-left: 1px solid #e0e0e0;
            }

            tr + tr td {
                border-top: 1px solid #e0e0e0;
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
            .custom_modal{
                transform: translateX(50px);
                max-width: 100% !important;
                width: 90% !important;
            }
            .week-selector {
                background-color: #4285f4;
                color: white;
                padding: 5px;
                border: none;
            }

            .slot-info {
                background-color: #e8f0fe;
                padding: 5px;
                margin-bottom: 5px;
                border-radius: 4px;
                font-size: 12px;
            }

            .class-code {
                font-weight: bold;
                color: #4285f4;
            }

            .view-materials, .edu-next {
                display: inline-block;
                padding: 2px 5px;
                margin: 2px;
                font-size: 10px;
                border-radius: 3px;
            }

            .view-materials {
                background-color: #fbbc05;
                color: white;
            }

            .edu-next {
                background-color: #4285f4;
                color: white;
            }

            .room-info {
                color: #4285f4;
            }

            .attendance {
                font-style: italic;
            }

            .attendance.attended {
                color: #4285f4;
            }

            .attendance.absent {
                color: #ea4335;
            }
            .hd{
                background-color: #4285f4 !important;
            }
            .time-info {

                display: flex;
                justify-content: center;
                font-size: 11px;
                color: #80e27e;
            }

            .empty-cell {
                height: 100%;
            }

        </style>
    </head>
    <body class="layout-light side-menu">
        <div class="mobile-search">
            <form action="/" class="search-form">
                <img src="img/svg/search.svg" alt="search" class="svg">
                <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..." aria-label="Search">
            </form>
        </div>
        <div class="mobile-author-actions"></div>
        <jsp:include page="control_nav.jsp" />

        <main class="main-content">

            <jsp:include page="sidebar.jsp" />
            <div class="contents">
                <h1>List of Requests</h1>
                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">

<!--                        <div class="filter-container">
                            <form method="POST" action="FilterStatusMentorServlet">
                                <label for="statusFilter">Filter by Status: </label>
                                <select id="statusFilter" name="statusFilter">
                                    <option value="all" ${statusId == -1 ? 'selected' : ''}>All</option>
                                    <c:forEach var="status" items="${listStatus}">
                                        <option value="${status.statusId}" ${statusId == status.statusId ? 'selected' : ''}>
                                            ${status.statusName}
                                        </option>
                                    </c:forEach>
                                </select>

                                <label for="mentorNameFilter">Filter by Mentee Name: </label>
                                <select id="mentorNameFilter" name="menteeNameFilter">
                                    <option value="all" ${mentorName == '' ? 'selected' : ''}>All</option>
                                    <c:forEach var="mentee" items="${mentee}">
                                        <option value="${mentee.userName}" ${mentorName == mentee.userName ? 'selected' : ''}>
                                            ${mentee.userName}
                                        </option>
                                    </c:forEach>
                                </select>

                                <label for="startTimeFilter">Filter by Start Time: </label>
                                <input type="date" id="startTimeFilter" name="startTimeFilter" value="${startTime == null ? '' : startTime}">

                                <label for="endTimeFilter">Filter by End Time: </label>
                                <input type="date" id="endTimeFilter" name="endTimeFilter" value="${endTime == null ? '' : endTime}">

                                <button type="submit">Filter</button>
                            </form>
                        </div>-->

                        <table class="table mb-0 table-borderless">

                            <thead class="hd">
                                <tr class="userDatatable-header">
                                    <th>
                                        <span class="userDatatable-title">Title</span>
                                    </th>
                                    <th>
                                        <span class="userDatatable-title">Mentee Name</span>
                                    </th>
                                    <th>
                                        <span class="userDatatable-title">Deadline Date</span>
                                    </th>
                                    <th>
                                        <span class="userDatatable-title">Deadline Hour</span>
                                    </th>
                                    <th>
                                        <span class="userDatatable-title">Skills</span>
                                    </th>
                                    <th>
                                        <span class="userDatatable-title">Status</span>
                                    </th>
                                    <th>

                                        <span class="userDatatable-title">Actions</span>
                                    </th>

                                </tr>
                            </thead>

                            <c:forEach var="request" items="${requests}">
                                <tr>
                                    <td>${request.title}</td>
                                    <td>${request.menteeName}</td>
                                    <td>${request.deadlineDate}</td>
                                    <td>${request.deadlineHour}</td>
                                    <td>
                                        <ul>
                                            <c:forEach var="skill" items="${request.listSkills}">
                                                <li>${skill.skillName}</li>
                                                </c:forEach>
                                        </ul>
                                    </td>
                                    <td class="status-cell" data-status="${request.status.statusName}">${request.status.statusName}</td>

                                    <td class="d-flex" style="margin-top:12px;">
                                        <form method="POST" action="ListRequest">
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <div class="action-btn">
                                                <a href="#" class="btn btn-primary align-center centaxs"
                                                   data-bs-toggle="modal" data-bs-target="#${request.menteeName}${request.requestId}"
                                                   style="background-color: #fff; border: none;">

                                                    <i class="uil uil-eye  align-center" style="color: blue;"></i> </a>

                                                <div class="modal fade ticket_modal" id="${request.menteeName}${request.requestId}" role="dialog"
                                                     tabindex="-1" aria-hidden="true">

                                                    <div
                                                        class="modal-dialog modal-dialog-centered modal-dialog-scrollable custom_modal">
                                                        <div class="modal-content radius-xl custom_modal">
                                                            <div class="modal-body pb-sm-50 pb-30">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                        <img src="img/svg/x.svg" alt="x" class="svg">
                                                                    </button>
                                                                </div>
                                                                <div class="ticket_modal-modal">
                                                                    <h1>Request Details</h1>
                                                                    <div class="text-center">Title: ${request.title}</div><br>
                                                                    <div class="text-center">Mentor Name: ${request.mentorName}</div><br>
                                                                    <div class="text-center">Description: ${request.description}</div><br>
                                                                    <div class="text-center">Deadline: ${request.deadlineHour}
                                                                        ${request.deadlineDate}</div><br>

                                                                    <div class="form-container">
                                                                        <table class="schedule-table" border="1" width="100%">
                                                                            <thead>
                                                                                <tr style=" background-color: #4a86e8;">
                                                                                    <th rowspan="2" style=" background-color: #4a86e8;">WEEK
                                                                                    </th>
                                                                                    <c:forEach var="day"
                                                                                               items="${listDays}">
                                                                                        <th class="equal-width text-center" style=" background-color: #4a86e8;">
                                                                                            ${day.dateName}</th>
                                                                                        </c:forEach>
                                                                                </tr>
                                                                                <tr>
                                                                                    <c:forEach var="day"
                                                                                               items="${listDays}">
                                                                                        <th class="equal-width text-center" style=" background-color: #4a86e8 ;">
                                                                                            ${day.dateValue}</th>
                                                                                        </c:forEach>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody class="tableslot">
                                                                                <c:forEach var="slot" items="${listSlots}"
                                                                                           varStatus="loop">
                                                                                    <tr>
                                                                                        <td>Slot ${slot.slot_name}</td>
                                                                                        <c:forEach var="day"
                                                                                                   items="${listDays}">
                                                                                            <c:set var="found"
                                                                                                   value="false" />
                                                                                            <td>
                                                                                                <c:forEach
                                                                                                    var="scheduleItem"
                                                                                                    items="${request.listSchedule}">
                                                                                                    <c:if
                                                                                                        test="${scheduleItem.dayOfSlot == day.date1 && scheduleItem.slotId == slot.slot_id}">
                                                                                                        <div
                                                                                                            class="slot-info">
                                                                                                            <c:forEach var="skill"
                                                                                                                       items="${request.listSkills}">
                                                                                                                <div class="class-code"> ${skill.skillName}</div>
                                                                                                            </c:forEach>
                                                                                                            <span class="view-materials">View Materials</span>
                                                                                                            <span class="edu-next">EduNext</span>
                                                                                                            <div class="room-info" >startTime:${scheduleItem.startTime}</div>
                                                                                                            <div class="attendance attended">endTime: ${scheduleItem.endTime}</div>
                                                                                                            <div class="time-info">${scheduleItem.slot_name}</div>
                                                                                                        </div>
                                                                                                        <c:set var="found"
                                                                                                               value="true" />
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                                <c:if test="${not found}">
                                                                                                    <div class="empty-cell">
                                                                                                    </div>
                                                                                                </c:if>
                                                                                            </td>
                                                                                        </c:forEach>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                        <input type="hidden" id="selectedSlots"
                                                                               name="selectedSlots" value="">
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                        <form method="POST" action="success">
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" type="submit">
                                                <li>
                                                    <a href="#" class="edit">
                                                        <i class="uil uil-check"></i>
                                                    </a>
                                                </li>
                                            </button>
                                        </form>
                                        <form method="POST" action="reject"
                                              onsubmit="return confirm('Are you sure you want to delete this request?');">
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" type="submit">
                                                <li>
                                                    <a href="#" class="remove">
                                                        <i class="uil uil-times"></i>
                                                    </a>
                                                </li>
                                            </button>
                                        </form>


                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </div>
                </div>
            </div>
            <script>document.addEventListener("DOMContentLoaded", function () {
                    const roomInfos = document.querySelectorAll('.room-info');

                    if (roomInfos.length === 0)
                        return; // Nếu không có room-info nào, kết thúc sớm

                    const firstRoomInfo = roomInfos[0];
                    const time_start = firstRoomInfo.textContent.trim();

                    function formatDate(date) {
                        return (
                                date.getFullYear().toString().padStart(4, "0") +
                                "-" +
                                (date.getMonth() + 1).toString().padStart(2, "0") +
                                "-" +
                                date.getDate().toString().padStart(2, "0")
                                );
                    }

                    function getMonday(d) {
                        d = new Date(d);
                        var day = d.getDay(),
                                diff = d.getDate() - day + (day === 0 ? -6 : 1);
                        return new Date(d.setDate(diff));
                    }

                    function getWeekOptions(startDate) {
                        const options = [];
                        for (let week = 0; week < 4; week++) {
                            const mondayOfWeek = new Date(startDate);
                            mondayOfWeek.setDate(mondayOfWeek.getDate() + week * 7);
                            const sundayOfWeek = new Date(mondayOfWeek);
                            sundayOfWeek.setDate(sundayOfWeek.getDate() + 6);
                            const optionText = formatDate(mondayOfWeek) + " to " + formatDate(sundayOfWeek);
                            options.push({value: week + 1, text: optionText});
                        }
                        return options;
                    }

                    const startDate = new Date(time_start);
                    const weekSelect = document.createElement("select");
                    weekSelect.id = "week";

                    const weekOptions = getWeekOptions(startDate);

                    weekOptions.forEach((option) => {
                        const optionElement = document.createElement("option");
                        optionElement.value = option.value;
                        optionElement.textContent = option.text;
                        weekSelect.appendChild(optionElement);
                    });

                    // Chỉ thêm <select> vào <th> một lần
                    const thElement = document.querySelector("th[rowspan='2']");
                    if (thElement) {
                        thElement.appendChild(weekSelect);
                    }
                });
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {

                    const statusCells = document.querySelectorAll(".status-cell");

                    statusCells.forEach(cell => {
                        const status = cell.getAttribute("data-status");
                        console.log(status);
                        switch (status) {
                            case "Open Class":
                                cell.classList.add("status-open");
                                break;
                            case "Processing":
                            case  "Wait For Payment":
                                cell.classList.add("status-processing");
                                break;
                            case "Out Of Date":
                            case "Rejected":
                                cell.classList.add("status-cancel");
                                break;
                            default:
                                break;
                        }
                        if (status !== "Processing") {
                            const parentRow = cell.closest("tr");
                            if (parentRow) {
                                const forms = parentRow.querySelectorAll("form");
                                forms.forEach(form => {
                                    const icon = form.querySelector("i.uil-check, i.uil-times");
                                    if (icon) {
                                        form.style.display = "none";
                                    }
                                });
                            }
                        }
                    });
                });
            </script>


    </body>

</html>
