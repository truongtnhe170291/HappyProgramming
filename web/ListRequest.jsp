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
                    background-color: #f0f0f0;
                }

                h1 {
                    text-align: center;
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

                .filter-container > form {
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

.custom_modal .modal-content {
    width: 100%;
}
.scheduleTable{
    width: 80% !important;
    max-width: 50% !important;
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
                                <option value="all" ${statusId == -1 ? 'selected' : ''}>All</option>
                                <c:forEach var="status" items="${statuses}">
                                    <option value="${status.statusId}" ${statusId == status.statusId ? 'selected' : ''}>
                                        ${status.statusName}
                                    </option>
                                </c:forEach>
                            </select>

                            <label for="mentorNameFilter">Filter by Mentor Name: </label>
                            <select id="mentorNameFilter" name="mentorNameFilter">
                                <option value="all" ${mentorName == '' ? 'selected' : ''}>All</option>
                                <c:forEach var="mentor" items="${mentors1}">
                                    <option value="${mentor.userName}" ${mentorName == mentor.userName ? 'selected' : ''}>
                                        ${mentor.userName}
                                    </option>
                                </c:forEach>
                            </select>

                            <label for="startTimeFilter">Filter by Start Time: </label>
                            <input type="date" id="startTimeFilter" name="startTimeFilter" value="${startTime == null ? '' : startTime}">

                            <label for="endTimeFilter">Filter by End Time: </label>
                            <input type="date" id="endTimeFilter" name="endTimeFilter" value="${endTime == null ? '' : endTime}">

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
                                        <form method="POST" action="ListRequest">
                                            <input type="hidden" name="requestId" value="${request.requestId}" />
                                            <div class="action-btn">
                                                <a href="#" class="btn btn-primary align-center centaxs" data-bs-toggle="modal" data-bs-target="#${request.menteeName}${request.requestId}" style="background-color: #fff; border: none;">
                                                    <i class="uil uil-eye align-center" style="color: blue;"></i>
                                                </a>
                                                <div class="modal fade ticket_modal custom_modal" id="${request.menteeName}${request.requestId}" role="dialog" tabindex="-1" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable custom_modal">
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
                                                                    
                                                                        <div class="schedule-container">
                                                                                <div class="header">
                                                                                    <div class="select-container">
                                                                                        <label for="year">YEAR</label>
                                                                                        <select id="year">
                                                                                            <option value="2024">2024</option>
                                                                                        </select>
                                                                                    </div>
                                                                                    <div class="select-container">
                                                                                        <label for="week">WEEK</label>
                                                                                        <select id="week"></select>
                                                                                    </div>
                                                                                </div>
                                                                                <table id="scheduleTable">
                                                                                    <thead>
                                                                                    <tr id="dayHeaders"></tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                    <!-- Table rows will be dynamically added here -->
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                   

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

                                        <!-- Payment button for 'Wait For Payment' status -->
                                        <c:if test="${request.status.statusName == 'Wait For Payment'}">
                                            <form method="POST" action="ProcessPayment">
                                                <input type="hidden" name="requestId" value="${request.requestId}" />
                                                <button style="margin-bottom: 10px; border-radius: 0.42rem;" type="submit">
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
                        </tbody>
                    </table>
                </div>
            </div>

                            <script>
    document.addEventListener("DOMContentLoaded", function () {
    <c:forEach var="request" items="${requests}"></c:forEach>
  const scheduleData = [
    {
      day: "MON",
      slot: 1,
      class: "SWR302",
      room: "BE-209",
      status: "attended",
      time: "7:30-9:50"
    },
    {
      day: "MON",
      slot: 2,
      class: "SWT301",
      room: "BE-209",
      status: "attended",
      time: "10:00-12:20"
    },
    {
      day: "MON",
      slot: 4,
      class: "SWP391",
      room: "BE-113",
      status: "absent",
      time: "15:20-17:40",
    },
    {
      day: "TUE",
      slot: 2,
      class: "FER202",
      room: "BE-209",
      status: "attended",
      time: "10:00-12:20",
    },
    {
      day: "WED",
      slot: 3,
      class: "SWP391",
      room: "BE-115",
      status: "attended",
      time: "12:50-15:10",
    },
    {
      day: "THU",
      slot: 1,
      class: "SWT301",
      room: "BE-209",
      status: "attended",
      time: "7:30-9:50"
    },
    {
      day: "THU",
      slot: 2,
      class: "SWR302",
      room: "BE-209",
      status: "absent",
      time: "10:00-12:20"
    },
    {
      day: "FRI",
      slot: 1,
      class: "FER202",
      room: "BE-209",
      status: "attended",
      time: "7:30-9:50"
    },
    {
      day: "SAT",
      slot: 4,
      class: "ITE302c",
      room: "AL-L204",
      status: "absent",
      time: "17:50-20:40",
      online: true
    }
  ];

  function getMonday(d) {
    d = new Date(d);
    var day = d.getDay(),
      diff = d.getDate() - day + (day == 0 ? -6 : 1);
    return new Date(d.setDate(diff));
  }

  function formatDate(date) {
    return (
      date.getDate().toString().padStart(2, "0") +
      "/" +
      (date.getMonth() + 1).toString().padStart(2, "0")
    );
  }

  function getWeekOptions() {
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const options = [];
    for (let week = 1; week <= 52; week++) {
      const mondayOfWeek = getMonday(
        new Date(currentYear, 0, 1 + (week - 1) * 7)
      );
      const sundayOfWeek = new Date(mondayOfWeek);
      sundayOfWeek.setDate(sundayOfWeek.getDate() + 6);

      const optionText = formatDate(mondayOfWeek)+ ` to ` +formatDate(sundayOfWeek);
      options.push({ value: week, text: optionText });
    }

    return options;
  }

  const weekSelect = document.getElementById("week");
  const weekOptions = getWeekOptions();
  weekOptions.forEach((option) => {
    const optionElement = document.createElement("option");
    optionElement.value = option.value;
    optionElement.textContent = option.text;
    weekSelect.appendChild(optionElement);
  });

  function isClassCurrentlyHappening(classItem, currentDate) {
    const [startHour, startMinute] = classItem.time
      .split("-")[0]
      .split(":")
      .map(Number);
    const [endHour, endMinute] = classItem.time
      .split("-")[1]
      .split(":")
      .map(Number);

    const classStart = new Date(currentDate);
    classStart.setHours(startHour, startMinute, 0);

    const classEnd = new Date(currentDate);
    classEnd.setHours(endHour, endMinute, 0);

    return currentDate >= classStart && currentDate < classEnd;
  }

  function updateSchedule() {
    const selectedWeek = weekSelect.value;
    const monday = getMonday(new Date(2024, 0, 1 + (selectedWeek - 1) * 7));

    const dayHeaders = document.getElementById("dayHeaders");
    dayHeaders.innerHTML = "<th>WEEK</th>";
    const daysOfWeek = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

    daysOfWeek.forEach((day, index) => {
      const date = new Date(monday);
      date.setDate(date.getDate() + index);
      const th = document.createElement("th");
      th.innerHTML = day+`<br>`+formatDate(date);
      dayHeaders.appendChild(th);
    });

    const tbody = document.querySelector("#scheduleTable tbody");
    tbody.innerHTML = "";

    for (let i = 0; i < 5; i++) {
      const row = document.createElement("tr");
      row.innerHTML = `<td>Slot` + i+`</td>` + "<td></td>".repeat(7);
      tbody.appendChild(row);
    }

    const currentDate = new Date();

    scheduleData.forEach((item) => {
      const dayIndex = daysOfWeek.indexOf(item.day);
      if (dayIndex !== -1) {
        const cell = tbody.rows[item.slot - 1].cells[dayIndex + 1];

        let onlineIndicator = item.online
          ? '<span class="online-indicator"></span>'
          : "";

        const classDate = new Date(monday);
        classDate.setDate(classDate.getDate() + dayIndex);

        let onlineNowIndicator = "";
        if (
          classDate.toDateString() === currentDate.toDateString() &&
          isClassCurrentlyHappening(item, currentDate)
        ) {
          onlineNowIndicator = '<div class="online-now">Online</div>';
        }

       cell.innerHTML += '<div class="class-block">' +
    '<div>' + item.class + ' ' + onlineIndicator + '</div>' +
    '<div class="view-materials">View Materials</div>' +
    '<div class="edu-next">EduNext</div>' +
    '<div>at ' + item.room + '</div>' +
    '<div class="' + item.status + '">(' + item.status + ')</div>' +
    '<div class="time">' + item.time + '</div>' +
    onlineNowIndicator +
    '</div>';

      }
    });
  }

  weekSelect.addEventListener("change", updateSchedule);
  updateSchedule(); // Initial call to set up the schedule

  setInterval(updateSchedule, 60000);
});

                            </script>

        </div>
    </body>

</html>