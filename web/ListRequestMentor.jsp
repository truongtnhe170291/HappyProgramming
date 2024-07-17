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

            td+td {
                border-left: 1px solid #e0e0e0;
            }

            tr+tr td {
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

            .status-cancel,
            .status-closed {
                width: 100px !important;
                height: 50px !important;
                color: red !important;
            }

            .custom_modal {
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

            .view-materials,
            .edu-next {
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

            .hd {
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
            .filter-container {
                display: flex;
                align-items: center;
                gap: 20px;
                background-color: #f5f5f5;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .filter-group {
                display: flex;
                flex-direction: column;
                flex: 1;
            }

            .filter-group label {
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            .filter-group select,
            .filter-group input {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            .filter-group select {
                appearance: none;
                background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
                background-repeat: no-repeat;
                background-position: right 12px top 50%;
                background-size: 12px auto;
            }

            .filter-button {
                width: 120px !important;
                margin-top: 30px;
                background-color: #4CAF50 !important;
                color: #000;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .filter-button:hover {
                background-color: #ccc !important;
            }
            .d-flex {
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
            }

            .btn-primary {
                padding: 0 !important;
                width: 40px !important;
                height: 40px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                background-color: #fff !important;
                border: none !important;
                margin: 0 5px !important;
            }

            .fas, .uil {
                font-size: 18px !important;
                color: #000 !important;
                width: auto !important;
                height: auto !important;
                line-height: normal !important;
            }

            form {
                margin: 0 !important;
            }

            button[type="submit"] {
                padding: 0 !important;
                width: 40px !important;
                height: 40px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                border: none !important;
                border-radius: 0.42rem !important;
            }

            .action-btn {
                margin: 0 !important;
                display: flex !important;
                align-items: center !important;
            }
            .custome{
                background-color: #80e27e !important;
            }
            .pagination {
                display: flex;
                justify-content: right;
                margin-top: 20px;
                margin-right: 20px;
                margin-bottom: 20px;
            }

            .prev {
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
            }

            .next {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
            }

            .pagination a, .pagination span {
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                background-color: #fff;
                border: 1px solid #ddd;
            }

            .pagination span {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }




        </style>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    </head>

    <body class="layout-light side-menu">
        <div class="mobile-search">
            <form action="/" class="search-form">
                <img src="img/svg/search.svg" alt="search" class="svg">
                <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..."
                       aria-label="Search">
            </form>
        </div>
        <div class="mobile-author-actions"></div>
        <jsp:include page="control_nav.jsp" />

        <main class="main-content">

            <jsp:include page="sidebar.jsp" />
            <div class="contents">
                <h1>List of Requests</h1>
                <form method="get" action="ListRequestMentor" class="filter-search-form">
                    <div class="filter-container">
                        <div class="filter-group">
                            <label for="statusFilter">Filter by Status:</label>
                            <select name="statusFilter" id="statusFilter">
                                <option value="" ${empty param.statusFilter ? 'selected' : ''}>All</option>
                                <c:forEach items="${listStatus}" var="status">
                                    <option value="${status.statusId}" ${param.statusFilter == status.statusId ? 'selected' : ''}>
                                        ${status.statusName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="filter-group">
                            <label for="menteeNameFilter">Search by Mentee Name:</label>
                            <input type="text" name="menteeNameFilter" id="menteeNameFilter" value="${param.menteeNameFilter}" placeholder="Enter mentee name"/>
                        </div>
                        <button type="submit" class="filter-button">Apply</button>
                    </div>
                </form>
                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">
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
                                    <td class="status-cell" data-status="${request.status.statusName}">
                                        ${request.status.statusName}</td>

                                    <td class="d-flex">                   
                                        <!--                                    <a href="#" class="btn btn-primary align-center centaxs"
                                                                               style="background-color: #fff; border: none;">
                                        
                                                                                <i class="fas fa-eye align-center" style="color: #000; width:10px;height:25px;line-height: 25px" ></i>
                                                                            </a>-->

                                        <a href="DetailSchedule_mentor?requestId=${request.requestId}" class="btn btn-primary align-center centaxs"
                                           style="background-color: #fff; border: none;">

                                            <i class="fas fa-eye align-center" style="color: #000; width:10px;height:25px;line-height: 25px" ></i>
                                        </a>

                                        <c:if test="${request.status.statusId == 2}">
                                            <form method="POST" action="success">
                                                <input type="hidden" name="requestId" value="${request.requestId}" />
                                                <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;"
                                                        type="submit">
                                                    <li>
                                                        <a href="#" class="edit">
                                                            <i class="uil uil-check"></i>
                                                        </a>
                                                    </li>
                                                </button>
                                            </form>

                                            <div class="action-btn" style="margin-top:24px;margin-left: 7px;margin-right: 7px; ">
                                                <a href="#" class="btn btn-primary align-center centaxs"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#${request.menteeName}${request.requestId}"
                                                   style="background-color: #fff; border: none;">

                                                    <i class="fas fa-times align-center" style="color: #000; width:10px;height:25px;line-height: 25px" ></i>
                                                </a>
                                                <form method="POST" action="reject">

                                                    <div class="modal fade ticket_modal"
                                                         id="${request.menteeName}${request.requestId}" role="dialog"
                                                         tabindex="-1" aria-hidden="true">
                                                        <div
                                                            class="modal-dialog modal-dialog-centered modal-dialog-scrollable custom_modal">
                                                            <div class="modal-content radius-xl custom_modal">
                                                                <div class="modal-body pb-sm-50 pb-30">

                                                                    <div class="modal-body">
                                                                        <h2>Enter reason reject</h2>
                                                                        <br/>
                                                                        <input type="hidden" id="requestId" name="requestId" value="${request.requestId}" />
                                                                        <textarea id="rejectReason" name="notes" class="form-control" placeholder="Enter reason why reject..." required></textarea>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-primary custome" onclick="submitRejectForm()">Reject</button>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>


                                                    </div>
                                                </form>

                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="modal fade" id="rejectReasonModal" tabindex="-1" aria-labelledby="rejectReasonModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="rejectReasonModalLabel">Enter reason why reject...</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                </div>
                            </div>
                        </div>



                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="ListRequestMentor?page=${currentPage - 1}&statusFilter=${statusFilter}&menteeNameFilter=${menteeNameFilter}" class="prev">Previous</a>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <span class="active">${i}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="ListRequestMentor?page=${i}&statusFilter=${statusFilter}&menteeNameFilter=${menteeNameFilter}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <a href="ListRequestMentor?page=${currentPage + 1}&statusFilter=${statusFilter}&menteeNameFilter=${menteeNameFilter}" class="next">Next</a>
                            </c:if>
                        </div>







                    </div>
                </div>
            </div>
        </main>
        <script>
            function openRejectModal(requestId) {
                document.getElementById('requestId').value = requestId;

                const rejectModal = new bootstrap.Modal(document.getElementById('rejectReasonModal'), {
                    keyboard: false
                });
                rejectModal.show();
            }

            function submitRejectForm() {
                const reasonInput = document.getElementById('rejectReason');
                const reason = reasonInput.value.trim();
                if (reason.length === 0) {
                    alert('Please enter reason.');
                    return;
                }
                const rejectModal = bootstrap.Modal.getInstance(document.getElementById('rejectReasonModal'));
                rejectModal.hide();
            }
        </script>



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
                        case "Wait For Payment":
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