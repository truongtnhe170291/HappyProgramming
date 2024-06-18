<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="INSPIRO" />
        <link rel="icon" type="image/png" href="images/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Document title -->
        <title>Create request</title>
        <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
        <link href='plugins/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>


            .header {
                display: flex !important;
                justify-content: space-between !important;
                align-items: center !important;
                margin-bottom: 20px !important;
            }

            .header h2 {
                margin: 0;
            }

            .header button {
                background-color: #4CAF50;
                color: #fff;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 10px;
            }
            .custompagect{
                max-width: 200% !important;
            }
            .day {
                background-color: #f9f9f9;
                border-radius: 4px;
                padding: 10px;
                margin-bottom: 10px;
            }

            .day-header {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .event {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .event-dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin-right: 10px;
            }


            .wrapper {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
                background-color: #f2f2f2;

                .mentor-image {
                    transform: translateX(250%);
                    border-radius: 50%;
                    width: 200px;
                    height: 200px;
                    background-size: contain;
                    margin-bottom: 20px;
                }

                .content-box {
                    margin-top: 20px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    background-color: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                    max-width:100%;
                }

                .btn-light.active {

                    background-color: #2250fc;
                    color: #ccc;
                }
                .btn-light{
                    line-height: 50px;
                    margin-left: 60px;
                }
                input[type="checkbox"] {
                    /*                    display: none;*/
                }
                .status {
                    font-size: 15px;
                    margin-top: 10px;
                    color: #333;
                    font-weight: bold;
                    float: left !important;
                }

                .btn-light.active {
                    background-color: #2250fc;
                    color: #ccc;
                }

                input[type="checkbox"] {
                    /*                    display: none;*/
                }
                #calendar{
                    width: 150%;
                    height: auto;

                }
                .content, .col-lg-8, .col-lg-4{
                    width:100%;
                }
                .event {
                    display: flex;
                    align-items: center;
                }

                .event-dot {
                    margin-right: 10px;
                }

                .event-content {
                    display: flex;
                    flex-grow: 1;
                    justify-content: space-between;
                    align-items: center;
                }

                .rights {
                    margin-left: auto;
                }
                .event{
                    display: flex;
                    justify-content: space-between;

                }
                .schedule-container {
                    background-color: white !important;
                    border-radius: 5px !important;
                    padding: 20px !important;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) !important;
                }

                .header {
                    display: flex !important;
                    margin-bottom: 20px !important;
                }

                .select-container {
                    display: flex !important;
                    align-items: center !important;
                    margin-right: 0 !important;
                }

                label {
                    margin-right: 5px !important;
                    font-weight: bold !important;
                    color: #666 !important;
                }

                select {
                    padding: 5px !important;
                    border: 1px solid #ccc !important;
                    border-radius: 3px !important;
                    background-color: #f8f8f8 !important;
                }

                table {
                    max-width: 90% !important;
                    border-collapse: collapse !important;
                }

                th,
                td {
                    border: 1px solid #ddd !important;
                    padding: 10px !important;
                    text-align: center !important;
                    vertical-align: middle !important;
                }
                #scheduleTable {
                    width: 100% !important;
                    max-width: 100% !important;
                }
                th {
                    background-color: #4a86e8 !important;
                    color: white !important;
                    font-weight: normal !important;
                }

                .class-block {
                    background-color: #e6f3ff;
                    display: flex !important;
                    flex-direction: column !important;
                    align-items: center !important;
                    justify-content: center !important;
                    text-align: center !important;
                }

                .selected {
                    color: #4caf50 !important;
                }

                .absent {
                    color: red !important;
                }

                .view-materials,
                .edu-next {
                    display: inline-block !important;
                    padding: 2px 5px !important;
                    margin: 5px 0 !important;
                    border-radius: 3px !important;
                    font-size: 0.8em !important;
                    cursor: pointer !important;
                }

                .view-materials {
                    background-color: #ffa500 !important;
                    color: white !important;
                }

                .edu-next {
                    background-color: #4682b4 !important;
                    color: white !important;
                }

                .time {
                    font-size: 0.9em !important;
                    color: #666 !important;
                }

                .online-indicator {
                    display: inline-block !important;
                    width: 10px !important;
                    height: 10px !important;
                    background-color: #4caf50 !important;
                    border-radius: 50% !important;
                    margin-left: 5px !important;
                    vertical-align: middle !important;
                }

                .online-now {
                    background-color: #4caf50 !important;
                    color: white !important;
                    padding: 2px 5px !important;
                    border-radius: 3px !important;
                    margin-top: 5px !important;
                    display: inline-block !important;
                }

                .chosen {
                    color: #ffd700 !important;
                }

                .not-selected {
                    color: #ff6347 !important;
                }


                #scheduleTable{
                    max-width: 100% !important;
                }
                #totalPriceContainer {
                    display: inline-block;
                    margin-top: 20px;
                    padding: 15px 20px;
                    background-color: #f0f0f0;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    text-align: center;
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                }

                #totalPrice {
                    font-size: 20px;
                    font-weight: bold;
                    color: #333;
                    transition: color 0.3s ease;
                }

                #totalPriceContainer:hover {
                    background-color: #e0e0e0;
                    transform: translateY(-5px);
                    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                }

                #totalPrice:hover {
                    color: #555;
                }


            </style>
            <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        </head>

        <body>

            <jsp:include page="header.jsp" />
            <section id="page-title">
                <div class="container">
                    <div class="page-title">
                        <h1>Mentee Request</h1>
                    </div>
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="homes.jsp">Home</a> </li>
                            <li class="active"><a href="Mentee_Request.jsp">Mentee Request</a> </li>
                        </ul>
                    </div>
                </div>
            </section>
            <div class="wrapper">
                <c:set value="${requestScope.cv}" var="cv" />
                <div class="content-box">
                    <div class="">
                        <img src="./img/${cv.imgcv}" alt="Mentor Image" class="mentor-image">
                        <h5>${cv.fullName}</h5>
                        <section class="custompagect" id="page-content">
                            <div class="container">
                                <div class="row">
                                    <!-- content -->
                                    <div class="content col-lg-9">
                                        <!-- form -->
                                        <c:set value="${requestScope.listSchedule}" var="listSchedule" />
                                        <form action="request" method="post">
                                            <c:forEach items="${requestScope.listSchedule}" var="schedule">
                                             <c:set var="start" value="${schedule.startTime}"/>
                                                <c:set var="end" value="${schedule.endTime}"/>
                                            </c:forEach>
                                            <input id="setStart_time" type="hidden" name="start_time" value="${start}" />
                                            <input id="setEnd_time" type="hidden" name="end_time" value="${end}"/>

                                            <input id="mentornameInput" type="hidden" name="mentorname" value="${cv.userName}" />
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="form-group">
                                                        <label>Title</label>
                                                        <input name="title" type="text" id="notify_title" value="" class="form-control notification-message" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <textarea id="description" name="description" class="form-control notification-message" placeholder="Type your message here..." required="" rows="5"></textarea>
                                                    </div>
                                                  
                                                    <div class="form-group">
                                                        <label>Deadline Date</label>
                                                        <input  name="deadlineDate" id="notify_messages" type="date" class="form-control notification-message" placeholder="" required="" rows="5" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Deadline Hour</label>
                                                        <input id="deadlineHour" name="deadlineHour" type="time" class="form-control notification-message" placeholder="" required="" rows="5" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Price/Slot: &nbsp; ${rate}</label>
                                                    </div>
                                                </div>
                                                <section id="page-content" class="no-sidebar">
                                            <div class="schedule-container">
                                                <div class="header">
                                                    <div class="select-container">
                                                        <label for="year">YEAR</label>
                                                        <select id="year">
                                                            <option value="2024">2024</option>
                                                        </select>
                                                    </div>
                                                    <div class="select-container">
                                                        <div id="statusIndicator" class="status-indicator">
                                                            Editable
                                                        </div>
                                                    </div>
                                                    <div class="select-container">
                                                        <label for="week">Month</label>
                                                        <select id="week"></select>
                                                    </div>
                                                </div>
                                                <table id="scheduleTable">
                                                    <thead>
                                                        <tr id="dayHeaders"></tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
                                            </div>
                                            <div id="totalPriceContainer">
                                                <input type="hidden" id="totalPriceInput" name="totalPrice" value="" />
                                                <span id="totalPrice">Total Price: 0</span>
                                            </div>
                                        </section>
                                         <div class="col-lg-4">

                                                    <div class="form-group mb-25 status-radio ">
                                                        <label for="hiringDateCheckbox">Skill</label>
                                                        <div class="d-flex">
                                                            <c:forEach items="${requestScope.skills}" var="skill">
                                                                <div class="form-check text-center m-3">
                                                                    <label class="form-check-label" for="hiringDateCheckbox">${skill.skillName}</label>

                                                                    <input type="radio" name="skill" value="${skill.skillID}" autocomplete="off" style="transform: translate(80px, -28px);">
                                                                </div>

                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                          

                                    </div>
                                    <div class="row mt-5">
                                        <div class="col-lg-9">
                                            <button id="notify_btn" class="btn btn-primary">Send Request</button>
                                            <button id="Save_status" class="btn btn-primary">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                    </div>
                </div>
            </div>
            <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
            <!--Plugins-->
            <script src="js/jquery.js"></script>
            <script src="js/plugins.js"></script>
            <script src="js/functions.js"></script>
            <script src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
            <script src='plugins/moment/moment.min.js'></script>
            <script src='plugins/fullcalendar/fullcalendar.min.js'></script>
            <script>
                document.addEventListener('DOMContentLoaded', (et) => {
    let currentAction = "editable";

    const scheduleData = [
        <c:forEach items="${requestScope.listSchedule}" var="schedule">
        {
            day: "${schedule.nameOfDay}",
            slot: ${schedule.slotId.substring(5)},
            class: "SWR302",
            room: "BE-209",
            status: "not-selected",
            time: "${schedule.slot_name}",
        },,<c:set var="start" value="${schedule.startTime}"/>
                    <c:set var="end" value="${schedule.endTime}"/>

        </c:forEach>
    ];

  function getMonday(d) {
        d = new Date('${start}');
        var day = d.getDay(),
            diff = d.getDate() - day + (day == 0 ? -6 : 1);
        return new Date(d.setDate(diff));
    }

    function formatDate(date) {
        return (
            date.getFullYear().toString().padStart(4, "0") +
            "-" +
            (date.getMonth() + 1).toString().padStart(2, "0") +
            "-" +
            date.getDate().toString().padStart(2, "0")
        );
    }

    function updateTotalPrice() {
        let total = 0;
        let selectedCount = 0;
        scheduleData.forEach((item) => {
            if (item.status === "selected") {
                selectedCount++;
            }
        });

        total = ${rate} * selectedCount * 4;

        const totalPriceInput = document.getElementById("totalPriceInput");
        const totalPriceDisplay = document.getElementById("totalPrice");

        totalPriceInput.value = total;
        totalPriceDisplay.innerHTML = `Total Price: ` + total;
    }

    function getWeekOptions() {
        const startDate = new Date('${start}');
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
        const monday = getMonday(
            new Date(2024, 0, 1 + (selectedWeek - 1) * 7)
        );

        const dayHeaders = document.getElementById("dayHeaders");
        dayHeaders.innerHTML = "<th>WEEK</th>";
        const daysOfWeek = ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"];

        daysOfWeek.forEach((day, index) => {
            const date = new Date(monday);
            date.setDate(date.getDate() + index);
            const th = document.createElement("th");
            th.innerHTML = day + `<br>` + formatDate(date);
            dayHeaders.appendChild(th);
        });

        const tbody = document.querySelector("#scheduleTable tbody");
        tbody.innerHTML = "";

        for (let i = 0; i < 5; i++) {
            const row = document.createElement("tr");
            row.innerHTML = `<td>Slot ` + (i + 1) + `</td>` + "<td></td>".repeat(7);
            tbody.appendChild(row);
        }

        const currentDate = new Date();

        scheduleData.forEach((item) => {
            const dayIndex = daysOfWeek.indexOf(item.day);
            if (dayIndex !== -1) {
                const cell = tbody.rows[item.slot - 1].cells[dayIndex + 1];
                if (cell) {
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

                    const statusClass = getStatusClass(item.status);
                    const statusText = getStatusText(item.status);

                    cell.innerHTML +=
                        '<div class="class-block">' +
                        '<div>' + item.class + ' ' + onlineIndicator + '</div>' +
                        '<div class="view-materials">View Materials</div>' +
                        '<div class="edu-next">EduNext</div>' +
                        '<div>at ' + item.room + '</div>' +
                        '<div class="status ' + statusClass + '" data-day="' + item.day + '" data-slot="' + item.slot + '">' + statusText + '</div>' +
                        '<div class="time">' + item.time + '</div>' +
                        onlineNowIndicator +
                        '</div>';

                    if (item.status === "selected") {
                        cell.classList.add("selected");
                    }
                }
            }
        });

        document.querySelectorAll(".status").forEach((element) => {
            element.addEventListener("click", function () {
                let day = this.getAttribute("data-day");
                const slot = parseInt(this.getAttribute("data-slot"));
       console.log(day);
                            const filteredSchedule = scheduleData.filter(
                (item) => item.day === day && item.slot === slot
            );
const index = scheduleData.indexOf(filteredSchedule[0]);
         console.log(index);
                if (index !== -1) {
                    if (scheduleData[index].status === "not-selected") {
                        scheduleData[index].status = "selected";
                        this.textContent = "(selected)";
                        this.classList.remove("not-selected");
                        this.classList.add("selected");
                    } else if (scheduleData[index].status === "selected") {
                        scheduleData[index].status = "not-selected";
                        this.textContent = "(not selected)";
                        this.classList.remove("selected");
                        this.classList.add("not-selected");
                    }
                }
                updateTotalPrice();
            });
        });
        updateTotalPrice();
    }

    function getStatusClass(status) {
        switch (status) {
            case "chosen":
                return "chosen";
            case "selected":
                return "selected";
            case "not-selected":
                return "not-selected";
            default:
                return "";
        }
    }

    function getStatusText(status) {
        switch (status) {
            case "chosen":
                return "(chosen)";
            case "selected":
                return "(selected)";
            case "not-selected":
                return "(not selected)";
            default:
                return "";
        }
    }

    function getFormValues() {
        const action = document.getElementById("statusIndicator").textContent;
        const start_time = document.getElementById("setStart_time").value;
        const end_time = document.getElementById("setEnd_time").value;
        const mentorname = document.getElementById('mentornameInput').value;
        const title = document.getElementById("notify_title").value;
        const description = document.getElementById("description").value;
        const deadlineDate = document.getElementById("notify_messages").value;
        const deadlineHour = document.getElementById("deadlineHour").value;
        const totalPrice = document.getElementById("totalPriceInput").value;

        let skill;
        const skillInputs = document.getElementsByName("skill");
        for (let i = 0; i < skillInputs.length; i++) {
            if (skillInputs[i].checked) {
                skill = skillInputs[i].value;
                break;
            }
        }

        return {
            startime: start_time,
            endtime: end_time,
            mentorname: mentorname,
            title: title,
            description: description,
            deadlineDate: deadlineDate,
            deadlineHour: deadlineHour,
            totalPrice: totalPrice,
            skill: skill,
            action: action
        };
    }

    function updateStatusIndicator(status) {
        const statusIndicator = document.getElementById('statusIndicator');
        statusIndicator.textContent = status;
        
        if (status === 'Editable') {
            statusIndicator.style.backgroundColor = '#4CAF50';
            statusIndicator.style.color = 'white';
        } else if (status === 'Rescheduled') {
            statusIndicator.style.backgroundColor = '#FFA500';
            statusIndicator.style.color = 'white';
        }
    }

    function saveSelectedSlots(event) {
        event.preventDefault();
        const formData = getFormValues();
        formData.action = "editable";
        currentAction = "editable";

        const selectedSlots = [];
        const tbody = document.querySelector("#scheduleTable tbody");
        const monday = getMonday(new Date());

        for (let row = 0; row < tbody.rows.length; row++) {
            for (let col = 1; col < tbody.rows[row].cells.length; col++) {
                const cell = tbody.rows[row].cells[col];
                const statusElement = cell.querySelector(".status");
                if (statusElement && statusElement.classList.contains("selected")) {
                    const slotDate = new Date(monday);
                    slotDate.setDate(slotDate.getDate() + col - 1);

                    const slotData = {
                        slot: row + 1,
                        day: formatDate(slotDate)
                    };
                    selectedSlots.push(slotData);
                }
            }
        }

        const requestData = {
            ...formData,
            selectedSlots: selectedSlots
        };

        fetch("request", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(requestData)
        })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.text();
        })
        .then((data) => {
            console.log("Response from server:", data);
            updateStatusIndicator('Editable');
            Toastify({
                text: "Lưu thành công!",
                duration: 3000,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "#4CAF50",
                stopOnFocus: true,
            }).showToast();
        })
        .catch((error) => {
            console.error("Failed to save:", error);
            Toastify({
                text: "Đã xảy ra lỗi khi lưu. Vui lòng thử lại.",
                duration: 3000,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "#FF6347",
                stopOnFocus: true,
            }).showToast();
        });
    }

    document.getElementById("notify_btn").addEventListener("click", function(event) {
        event.preventDefault();
        const formData = getFormValues();
        formData.action = "rescheduled";
        currentAction = "rescheduled";

        const selectedSlots = [];
        const tbody = document.querySelector("#scheduleTable tbody");
        const monday = getMonday(new Date());

        for (let row = 0; row < tbody.rows.length; row++) {
            for (let col = 1; col < tbody.rows[row].cells.length; col++) {
                const cell = tbody.rows[row].cells[col];
                const statusElement = cell.querySelector(".status");
                if (statusElement && statusElement.classList.contains("selected")) {
                    const slotDate = new Date(monday);
                    slotDate.setDate(slotDate.getDate() + col - 1);

                    const slotData = {
                        slot: row + 1,
                        day: formatDate(slotDate)
                    };
                    selectedSlots.push(slotData);
                }
            }
        }

        const requestData = {
            ...formData,
            selectedSlots: selectedSlots
        };

        fetch("request", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(requestData)
        })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.text();
        })
        .then((data) => {
            console.log("Response from server:", data);
            updateStatusIndicator('Rescheduled');
            Toastify({
                text: "Gửi yêu cầu thành công! Bạn sẽ được chuyển hướng về home",
                duration: 3000,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "#4CAF50",
                stopOnFocus: true,
                callback: function () {
                    window.location.href = "homes.jsp";
                }
            }).showToast();
        })
        .catch((error) => {
            console.error("Failed to send request:", error);
            Toastify({
                text: "Đã xảy ra lỗi khi gửi yêu cầu. Vui lòng thử lại.",
                duration: 3000,
                close: true,
                gravity: "top",
                position: "right",
                backgroundColor: "#FF6347",
                stopOnFocus: true,
            }).showToast();
        });
    });

    const saveButton = document.getElementById("Save_status");
    saveButton.addEventListener("click", saveSelectedSlots);

    weekSelect.addEventListener("change", updateSchedule);
    updateSchedule();
    updateTotalPrice();
    setInterval(updateSchedule, 60000);
    updateStatusIndicator('Editable'); 
});
            </script>
            <script>
                document.addEventListener('DOMContentLoaded', (et) => {

                    const deadlineInput = document.getElementById('notify_messages');
                    const notifyBtn = document.getElementById("notify_btn");
                    const skillRadios = document.querySelectorAll('input[name="skill"]');
                    const scheduleCheckboxes = document.querySelectorAll('input[type="checkbox"][name="schedule"]');
                    const totalPriceInput = document.getElementById("totalPriceInput");
                    const totalPrice = document.getElementById("totalPrice");
                    const rate = ${rate}; // Predefined rate from JSP

                    function getSundayOfWeek() {
                        const currentDate = new Date();
                        const dayOfWeek = currentDate.getDay();
                        const daysUntilSunday = (7 - dayOfWeek) % 7;
                        const sundayDate = new Date(currentDate);
                        sundayDate.setDate(currentDate.getDate() + daysUntilSunday);
                        return sundayDate.toISOString().split('T')[0];
                    }

                    function getFormattedCurrentDate() {
                        const currentDate = new Date();
                        return currentDate.toISOString().split('T')[0];
                    }

                    function showToastMessage(message) {
                        Toastify({
                            text: message,
                            duration: 5000,
                            gravity: "top",
                            position: "right",
                            backgroundColor: "#ff7b5a",
                        }).showToast();
                    }

                    function countCheckedSchedules() {
                        return [...scheduleCheckboxes].filter(checkbox => checkbox.checked).length;
                    }

                    function countSelectedSkills() {
                        return [...skillRadios].filter(radio => radio.checked).length;
                    }

                    function updateTotalPrice() {
                    const checkedCount = countCheckedSchedules();
                    const total = checkedCount * ${rate};
                    totalPriceInput.value = total;
                    totalPrice.innerHTML = `Total Price: ` + total;
                }


                    function validateForm() {
                        const deadlineDate = deadlineInput.value;
                        const currentDate = getFormattedCurrentDate();
                        const sundayOfWeek = getSundayOfWeek();
                        const checkedSchedules = countCheckedSchedules();
                        const selectedSkills = countSelectedSkills();

                        if (deadlineDate < currentDate || deadlineDate > sundayOfWeek) {
                            notifyBtn.disabled = true;
                            showToastMessage("Please select a valid deadline date.");
                            return false;
                        }else if (selectedSkills === 0) {
                            notifyBtn.disabled = true;
                            showToastMessage("Please select at least one skill.");
                            return false;
                        } else {
                            notifyBtn.disabled = false;
                            return true;
                        }
                    }

                    deadlineInput.addEventListener('change', validateForm);

                    skillRadios.forEach(radio => {
                        radio.addEventListener('change', validateForm);
                    });

                    scheduleCheckboxes.forEach(checkbox => {
                        checkbox.addEventListener('change', () => {
                            updateTotalPrice();
                            validateForm();
                        });
                    });

                    validateForm();
                    updateTotalPrice();
                });

            </script>
        </body>

    </html>
