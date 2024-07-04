<%-- 
    Document   : test_Lich
    Created on : Jun 16, 2024, 10:41:01 AM
    Author     : 84979
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <title>Schedule</title>
        <style>

            .schedule-container {
                background-color: white;
                border-radius: 5px;
                padding: 20px;

                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .items{
                display: flex;
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
            }

            th,
            td {
                border: 1px solid #ddd !important;
                padding: 10px !important;
                text-align: center !important;
                vertical-align: top !important;
            }

            th {
                background-color: #4a86e8 !important;
                color: white !important;
                font-weight: normal !important;
            }

            .class-block {
                background-color: #e6f3ff !important;
                border-radius: 5px !important;
                padding: 5px !important;
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
            .online-now {
                background-color: #4caf50;
                color: white;
                padding: 2px 5px;
                border-radius: 3px;
                margin-top: 5px;
                display: inline-block;
            }

            .slot-checkbox {
                margin-right: 5px;
            }

            .selected {
                color: green;
            }

            .class-block {
                background-color: #e6f3ff;
                border-radius: 5px;
                padding: 5px;
                margin-bottom: 5px;
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
            .slot-label {
                margin: 0 auto;
                width: 80px;
                background-color: #fa8072;
                border-radius: 12px;
                height: auto;
                text-align: center;
            }
            .slot_active {
                margin: 0 auto;
                color: #fff;
                width: 80px;
                background-color: #98fb98;
                border-radius: 12px;
                height: auto;
                text-align: center;
            }

            #saveSelectedSlots {
                margin-top: 30px;
                float: right;
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                transition-duration: 0.4s;
            }

            #saveSelectedSlots:hover {
                background-color: #45a049;
            }
            .note-container {
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-top: 40px;
                width: 100%;
            }
            h2 {
                color: #ff0000;
                margin-top: 0;
                margin-bottom: 15px;
            }
           
          
            .highlight {
                color: #4a86e8;
                font-weight: bold;
            }
            .sendSelectedSlots{
                transform: translate(30%,30%);
            }
            #renderButton {
                background-color: #ADD8E6;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            #renderButton:hover {
                background-color: #87CEEB;
                color: #ffffff;
            }
            .poiter{
                pointer-events: none;
            }
            #sendSelectedSlots{
                margin-top: 10px;
                margin-right: 10px;
                float: right;
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                transition-duration: 0.4s;
            }
            .add-icon, .delete-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background-color: #d0f0c0;
                color: green;
                font-size: 16px;
                margin-top: 8px;
            }

            .delete-icon {
                background-color: #f8d7da;
                color: red;
            }

            .add-icon:hover, .delete-icon:hover {
                background-color: #c8e6c9;
            }

            .delete-icon:hover {
                background-color: #f5c6cb;
            }


.select-container.custom_popup {
    margin-top: 10px;
    cursor: pointer;
    width: auto;
    height: 40px;
    background-color: #f0f0f0;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    display: inline-block;
}

        </style>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
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
                <h1 style="padding: 30px 0px">List of Requests</h1>
                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">
                        <form id="scheduleForm">
                            <div class="schedule-container">
                                <div class="header">
                                    <div class="items">
                                        <div class="select-container">
                                            <label for="year">YEAR</label>
                                            <select id="year" >
                                                <option>2024</option>
                                            </select>
                                            
                                        </div>
                                         
                                        <div class="select-container">
                                            <label for="week">WEEK</label>
                                            <select id="week" ></select>
                                        </div>
                                        <div class="select-container custom_popup" id="rejmodal" data-bs-toggle="modal" data-bs-target="#myModal">
                                    <label >Reason for rejection</label>
                                </div>

                                    </div>
                                    <div class="items">
                                        <div class="select-container class-set-render">
                                            <div id="renderButton" >Render</div>
                                        </div>

                                        <div class="select-container cusstom_h">

                                            <c:if test="${status != ''}">
                                                <label for="year" class="d-flex">Status: <div>${status}</div></label>
                                            </c:if>
                                            <c:if test="${status eq ''}">
                                                <label class="st">Status: Booking Schedule</label>
                                            </c:if>


                                        </div>
                                    </div>
                                </div>
                                <table id="scheduleTable">
                                    <thead>
                                        <tr id="dayHeaders"></tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="note-container">
                                    <h2>Note:</h2>
                                    <ul>
                                        <li>Your selection of week will select for <span class="highlight" style="margin: 0px 5px;">hole month</span></li>
                                        <li>You cannot booking a schedule on <span class="highlight" style=" margin: 0px 5px; ">Saturday</span> and <span class="highlight" style=" margin: 0px 5px; ">Sunday</span></li>
                                        <li>You can <span class="highlight" style="margin: 0px 5px; "> Update </span> your schedule when status is <span class="highlight" style=" margin: 0px 5px;">Pending</span></li>
                                        <li class="highlights"><span class="highlight" style=" margin: 0px 5px;">Render</span> button will automatically insert the weeks of the month same as the <span class="highlight" style="margin: 0px 5px;"> first week</span></li>
                                            <c:forEach items="${requestScope.listSlot}" var="slot">
                                            <li><span class="highlight" style="margin: 0px 5px;">${slot.slot_id}: </span> ${slot.slot_name}</li>
                                            </c:forEach>
                                    </ul>
                                </div>  


                                <c:if test="${status eq 'Saved' || status eq ''}">
                                    <a href="bookSchedule" id="saveSelectedSlots">Save Selected Slots</a>
                                </c:if>
                                <a href="bookSchedule" hidden  id="saveSelectedSlots">Save Selected Slots</a></div>
                            <a href="bookSchedule" id="sendSelectedSlots">Submit Schedule</a></div>
                </div>



                </form>




            </div>
        </div>

    </div>

</main>
                               <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Reason for Rejection</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <h3 style="padding: 30px 0px">${sessionScope.reject}</h3>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    document.addEventListener("DOMContentLoaded", function () {
        const startTimeStr = '${requestScope.mon}';
        const weeksData = {1: {}, 2: {}, 3: {}, 4: {}};
        const saveButton = document.getElementById("saveSelectedSlots");
        const sendButton = document.getElementById("sendSelectedSlots");
        const tatussss = '${status}';
if( tatussss !== 'Reject' ){
    document.getElementById('rejmodal').style.display = 'none';
}else{
     document.getElementById('rejmodal').style.display = 'block';
}
let disableButtonStatusUpdate = false;

        function formatDate(date) {
            return (
                    date.getDate().toString().padStart(2, "0") +
                    "-" +
                    (date.getMonth() + 1).toString().padStart(2, "0") +
                    "-" +
                    date.getFullYear().toString()
                    );
        }
        function parseDate(dateStr) {
            const date = new Date(dateStr);
            const year = date.getFullYear().toString().padStart(4, '0');
            ;
            const month = (date.getMonth() + 1).toString().padStart(2, '0');
            const day = date.getDate().toString().padStart(2, '0');
            return day + '-' + month + '-' + year;
        }
        function selectWeekID(dayOfSlot, startTimeStr) {
            const startDate = parseDate(startTimeStr);
            const currentDate = parseDate(dayOfSlot);

            const diffTime = Math.abs(currentDate - startDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
            return Math.floor(diffDays / 7) + 1;
        }
        function getWeekOptions() {
            const currentDate = new Date(startTimeStr);
            const options = [];
            for (let week = 0; week < 4; week++) {
                const mondayOfWeek = new Date(currentDate);
                mondayOfWeek.setDate(mondayOfWeek.getDate() + week * 7);
                mondayOfWeek.setDate(mondayOfWeek.getDate() - mondayOfWeek.getDay() + 1);

                const sundayOfWeek = new Date(mondayOfWeek);
                sundayOfWeek.setDate(sundayOfWeek.getDate() + 6);

                const optionText =
                        formatDate(mondayOfWeek) + ` to ` + formatDate(sundayOfWeek);
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

        function showToastMessage(message) {
            Toastify({
                text: message,
                duration: 5000,
                gravity: "top",
                position: "right",
                backgroundColor: "#ff7b5a",
            }).showToast();
        }

        function selectWeekID(dayOfSlot, startTimeStr) {
            let slotDate, startDate;

            if (dayOfSlot.includes('-')) {
                const [part1, part2, part3] = dayOfSlot.split('-');
                slotDate = part1.length === 4
                        ? new Date(part1, part2 - 1, part3)
                        : new Date(part3, part2 - 1, part1);
            } else {
                console.error("Invalid dayOfSlot format");
                return 0;
            }

            const [startDayStr, startMonthStr, startYearStr] = startTimeStr.split('-');
            startDate = new Date(startDayStr, startMonthStr - 1, startYearStr);

            const slotDayOfWeek = slotDate.getDay();
            const startDayOfWeek = startDate.getDay();
            slotDate.setDate(slotDate.getDate() - (slotDayOfWeek === 0 ? 6 : slotDayOfWeek - 1));
            startDate.setDate(startDate.getDate() - (startDayOfWeek === 0 ? 6 : startDayOfWeek - 1));

            const weekDiff = Math.round((slotDate - startDate) / (7 * 24 * 60 * 60 * 1000));

            return weekDiff + 1;
        }
        console.log(selectWeekID('2024-07-15', '15-07-2024'));
        const weekIds = selectWeekID('2024-07-15', startTimeStr);
        console.log(weekIds);
    <c:forEach items="${requestScope.listScheduleSave}" var="schedule">
        var dayOfSlot = '${schedule.dayOfSlot}';
        var formattedDayOfSlot = parseDate(dayOfSlot);
        var nameOfDay = '${schedule.nameOfDay}';
        var slotId = '${schedule.slotId}';
        var weekId = selectWeekID(dayOfSlot, startTimeStr);

        if (!weeksData[weekId]) {
            weeksData[weekId] = {};
        }
        var key = weekId + '-' + nameOfDay.substring(0, 3) + '-' + slotId.substring(4) + '-' + formattedDayOfSlot;
        console.log(dayOfSlot, nameOfDay.substring(0, 2), slotId.substring(4));

        weeksData[weekId][key] = {class: "Class", room: "Room", time: "Time"};
    </c:forEach>

        console.log("weeksData after initialization:", JSON.stringify(weeksData, null, 2));
        console.log(weeksData);
        console.log("weeksData after initialization:", JSON.stringify(weeksData, null, 2));
        console.log(weeksData);



        function createWeekData(sourceWeek, targetWeekNumber) {
            const targetWeek = {};
            const daysToAdd = (targetWeekNumber - 1) * 7;

            Object.entries(sourceWeek).forEach(([key, value]) => {
                const [week, day, slot, dateStr] = key.split("-");

                const sourceDate = new Date(startTimeStr);
                sourceDate.setDate(sourceDate.getDate() + (targetWeekNumber - 1) * 7 + ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"].indexOf(day));

                const newDateStr = formatDate(sourceDate);

                const newKey = targetWeekNumber + `-` + day + `-` + slot + `-` + newDateStr;
                targetWeek[newKey] = {...value, date: newDateStr};
            });

            return targetWeek;
        }

        function renderWeeks() {
            const startDate = new Date(startTimeStr);
            for (let week = 2; week <= 4; week++) {
                weeksData[week] = createWeekData(weeksData[1], week);
            }
            updateSchedule();
            console.log("weeksData after rendering:", JSON.stringify(weeksData, null, 2));
        }

        function updateButtonStatus() {
            if (disableButtonStatusUpdate) return;
            const nonEmptyWeeks = Object.values(weeksData).filter(week => Object.keys(week).length > 0).length;
            const isDisabled = nonEmptyWeeks < 2;
            saveButton.disabled = isDisabled;
            sendButton.disabled = isDisabled;

            if (isDisabled) {
                showToast("Please select at least 2 weeks of schedule.");
            }
        }

        function showToast(message) {
            showToastMessage(message);
        }

        function getLastDateOfNonEmptyWeek() {
            for (let week = 4; week >= 1; week--) {
                if (weeksData[week] && Object.keys(weeksData[week]).length > 0) {
                    const mondayDate = new Date(startTimeStr);
                    mondayDate.setDate(mondayDate.getDate() + (week - 1) * 7);
                    const sundayDate = new Date(mondayDate);
                    sundayDate.setDate(sundayDate.getDate() + 6);

                    return formatDate(sundayDate);
                }
            }
            return null;
        }



        function updateSchedule() {
            const selectedWeek = parseInt(weekSelect.value);
            const monday = new Date(startTimeStr);
            monday.setDate(monday.getDate() + (selectedWeek - 1) * 7);

            const dayHeaders = document.getElementById("dayHeaders");
            if (!dayHeaders) {
                console.error("dayHeaders element not found.");
                return;
            }

            dayHeaders.innerHTML = "<th>WEEK</th>";
            const daysOfWeek = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

            daysOfWeek.forEach((day, index) => {
                const date = new Date(monday);
                date.setDate(date.getDate() + index);
                const th = document.createElement("th");
                th.innerHTML = day + `<br>` + formatDate(date);
                dayHeaders.appendChild(th);
            });

            const tbody = document.querySelector("#scheduleTable tbody");
            if (!tbody) {
                console.error("tbody element not found.");
                return;
            }

            tbody.innerHTML = "";

            for (let i = 0; i < ${requestScope.listSlot.size()}; i++) {
                const row = document.createElement("tr");
                row.innerHTML = `<td>Slot` + (i + 1) + `</td>` + "<td></td>".repeat(7);
                tbody.appendChild(row);
            }

            if (!weeksData[selectedWeek]) {
                weeksData[selectedWeek] = {};
            }

            const weekData = weeksData[selectedWeek];

            Object.keys(weekData).forEach((slotKey) => {
                const [week, day, slot, date] = slotKey.split("-");
                const dayIndex = daysOfWeek.indexOf(day);
                if (dayIndex === -1) {
                    console.error("Invalid dayIndex:", dayIndex);
                    return;
                }
                const row = tbody.rows[slot - 1];
                if (!row) {
                    console.error("Row not found for slot:", slot);
                    return;
                }
                const cell = row.cells[dayIndex + 1];
                if (!cell) {
                    console.error("Cell not found for dayIndex:", dayIndex);
                    return;
                }
                const item = weekData[slotKey];
                cell.classList.add("selected");
                createSlotListener(cell, item, parseInt(week), slotKey);
            });

            for (let row = 0; row < tbody.rows.length; row++) {
                for (let col = 1; col < tbody.rows[row].cells.length; col++) {
                    const cell = tbody.rows[row].cells[col];
                    if (!cell.innerHTML) {
                        const day = daysOfWeek[col - 1];
                        const slot = row + 1;
                        const date = new Date(monday);
                        date.setDate(date.getDate() + (col - 1));
                        const dateStr = formatDate(date);
                        const slotKey =
                                selectedWeek + "-" + day + "-" + slot + "-" + dateStr;
                        const item =
                                weeksData[selectedWeek][slotKey] || {
                            class: "Class",
                            room: "Room",
                            time: "Time"
                        };
                        createSlotListener(cell, item, selectedWeek, slotKey);
                    }
                }
            }

            updateButtonStatus();
        }

        function createSlotListener(cell, item, week, slotKey) {
            function updateSlotStatus() {
                if (cell.classList.contains("selected")) {
                    cell.innerHTML =
                            '<div class="class-block selected">' +
                            "<div>" + item.class + "</div>" +
                            '<div class="view-materials">View Materials</div>' +
                            '<div class="edu-next">EduNext</div>' +
                            "<div>at " + item.room + "</div>" +
                            '<div class="selected-text">(selected)</div>' +
                            '<div class="time">' + item.time + "</div>" +
                            '<div class="slot_active">Selected</div>' +
                            "</div>" +
                            '<div class="delete-icon"><i class="fas fa-trash-alt"></i></div>';
                    weeksData[week][slotKey] = item;
                } else {
                    cell.innerHTML =
                            '<div class="slot-label">Not Selected</div>' +
                            '<div class="add-icon" style="color: green;"><i class="fas fa-plus"></i></div>';
                    delete weeksData[week][slotKey];
                }

            }
            function toggleSlot() {
                cell.classList.toggle("selected");
                updateSlotStatus(cell, item, week, slotKey);
                console.log("weeksData after toggle:", weeksData);
                updateButtonStatus();
            }

            updateSlotStatus();
            cell.addEventListener("click", toggleSlot);
        }

        function sendSelectedSlots(event, status) {
            event.preventDefault();
            const selectedSlotsArray = Object.values(weeksData);
            const lastDate = getLastDateOfNonEmptyWeek();

            if (!lastDate) {
                showToast("No valid schedule selected.");
                return false;
            }

            const dataToSend = {
                slots: selectedSlotsArray,
                status: status,
                startDate: startTimeStr,
                endDate: lastDate
            };

            console.log("Data being sent to server:", JSON.stringify(dataToSend, null, 2));

            fetch("bookSchedule", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(dataToSend),

            })
                    .then(response => {
                        if (!response.ok)
                            throw new Error("Network response was not ok");
                        return response.text();
                    })
                    .then(data => {
                        console.log("Response from server:", data);
                        showToast("Selected slots " + (status === 'save' ? 'saved' : 'sent') + " successfully!");
                         if(status === 'send'){
                              window.location.href = 'bookSchedule';}
                         
                    })
                    .catch(error => {
                        console.error("Failed to " + status + " selected slots:", error);
                    });

            return false;
        }

        document.getElementById("renderButton").addEventListener("click", renderWeeks);

        updateSchedule();
        weekSelect.addEventListener("change", updateSchedule);
if (tatussss === 'Pending' || tatussss === 'Approved') {
    function hideIcons() {
        document.querySelectorAll('.delete-icon, .add-icon').forEach((element) => {
            element.style.display = 'none';
        });
    }

    hideIcons();

    weekSelect.addEventListener("change", hideIcons);

    document.getElementById("renderButton").addEventListener("click", () => {
        setTimeout(hideIcons, 0);
    });

 document.querySelectorAll('#scheduleTable').forEach(ele =>ele.classList.add('poiter'));    document.getElementById("renderButton").classList.add('poiter');
    saveButton.classList.add('poiter');
    sendButton.classList.add('poiter');
} else {
    document.getElementById("renderButton").classList.remove('poiter');
 document.querySelectorAll('#scheduleTable').forEach(ele =>ele.classList.remove('poiter'));   
 saveButton.classList.remove('poiter');
    sendButton.classList.remove('poiter');
}
var noBook = "${noBook}";
    if (noBook && noBook !== "null" && noBook !== "") {
        disableButtonStatusUpdate = true;
            document.getElementById("renderButton").style.display = 'none';
    document.querySelectorAll('#scheduleTable').forEach(ele =>ele.classList.add('poiter'));

        function hideIcons() {
        document.querySelectorAll('.delete-icon, .add-icon').forEach((element) => {
            element.style.display = 'none';
        });
    }

    hideIcons();

    weekSelect.addEventListener("change", hideIcons);

    document.getElementById("renderButton").addEventListener("click", () => {
        setTimeout(hideIcons, 0);
    });
        saveButton.style.display = 'none';
    sendButton.style.display = 'none';
        document.querySelector('.st').textContent = 'Status: No Book';
        showToast(noBook);
    }
        saveButton.addEventListener("click", (event) => {sendSelectedSlots(event, 'save');
        
   document.querySelector('.st').textContent = 'Status: Saved';
    });
       sendButton.addEventListener("click", async (event) => {
         sendSelectedSlots(event, 'send');
    
            document.querySelector('.st').textContent = 'Status: Pending';
      
});
 console.log('test' + disableButtonStatusUpdate);
});
    
</script>

</body>
</html>