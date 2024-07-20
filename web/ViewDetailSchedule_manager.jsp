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
            ul {
                list-style-type: none;
                padding-left: 0;
                margin: 0;
            }
            li {
                margin-bottom: 10px;
                color: #666;
                display: flex;
                align-items: flex-start;
                list-style: none !important;
            }
            li::before {
                color: #666;
                display: inline-block;
                width: 1em;
                margin-right: 0.5em;
            }
            .highlight {
                margin: 0 4px;
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
                display: none;
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
            #newButton{
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

            .span{
                margin: 0px 5px;
            }

        </style>
        <link rel="stylesheet" href="assetss/css/app.min.css">
        <!-- Template CSS -->
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="assetss/css/custom.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    </head>

    <body>
        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <jsp:include page="header_Manager.jsp" />
                <div class="mobile-author-actions"></div>
                <div class="main-content">
                    <div class="contents">
                        <div style="display: flex; justify-content: space-between; margin-top: 20px">
                            <a href="HandleSlotMentor" id="newButton">Back</a>
                        </div>  
                        <div style="display: flex; justify-content: space-between">
                            <h1 style="margin-top: 30px">Schedule Detail</h1>
                            <h1 style="margin-top: 30px">Mentor: ${mentorName}</h1>
                        </div>
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
                                            </div>
                                            <div class="items">
                                                <div class="select-container class-set-render">
                                                    <div id="renderButton" >Render</div>
                                                </div>

                                                <div class="select-container cusstom_h">

                                                    <c:if test="${status != ''}">
                                                        <label for="year" class="d-flex">Status: <div class="st">${status}</div></label>
                                                        </c:if>
                                                        <c:if test="${status eq ''}">
                                                        <label for="year">Status: Booking Schedule</label>
                                                    </c:if>


                                                </div>
                                            </div>
                                        </div>
                                        <table id="scheduleTable" style="
                                               pointer-events: none;
                                               ">
                                            <thead>
                                                <tr id="dayHeaders"></tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <div class="note-container">
                                            <h2>Note:</h2>
                                            <ul>
                                              <li><span class="highlight">Back button</span> to back to schedule list request </li>
                                                    <c:forEach items="${requestScope.listSlot}" var="slot">
                                                    <li><span class="highlight">${slot.slot_id}: </span> ${slot.slot_name}</li>
                                                    </c:forEach>
                                            </ul>
                                        </div>  
                                        <a href="bookSchedule" hidden  id="saveSelectedSlots">Save Selected Slots</a></div>
                                    <a href="bookSchedule" hidden id="sendSelectedSlots">Send Schedule</a></div>

                        </div>
                        </form>
                    </div>
                    <div class="settingSidebar">
                        <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                        </a>
                        <div class="settingSidebar-body ps-container ps-theme-default">
                            <div class=" fade show active">
                                <div class="setting-panel-header">Setting Panel
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Select Layout</h6>
                                    <div class="selectgroup layout-color w-50">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                                            <span class="selectgroup-button">Light</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                                            <span class="selectgroup-button">Dark</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                    <div class="selectgroup selectgroup-pills sidebar-color">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                  data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
                                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                  data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Color Theme</h6>
                                    <div class="theme-setting-options">
                                        <ul class="choose-theme list-unstyled mb-0">
                                            <li title="white" class="active">
                                                <div class="white"></div>
                                            </li>
                                            <li title="cyan">
                                                <div class="cyan"></div>
                                            </li>
                                            <li title="black">
                                                <div class="black"></div>
                                            </li>
                                            <li title="purple">
                                                <div class="purple"></div>
                                            </li>
                                            <li title="orange">
                                                <div class="orange"></div>
                                            </li>
                                            <li title="green">
                                                <div class="green"></div>
                                            </li>
                                            <li title="red">
                                                <div class="red"></div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <div class="theme-setting-options">
                                        <label class="m-b-0">
                                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                                   id="mini_sidebar_setting">
                                            <span class="custom-switch-indicator"></span>
                                            <span class="control-label p-l-10">Mini Sidebar</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <div class="theme-setting-options">
                                        <label class="m-b-0">
                                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                                   id="sticky_header_setting">
                                            <span class="custom-switch-indicator"></span>
                                            <span class="control-label p-l-10">Sticky Header</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                                    <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                                        <i class="fas fa-undo"></i> Restore Default
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- General JS Scripts -->
        <script src="assetss/js/app.min.js"></script>
        <!-- JS Libraies -->
        <script src="assetss/bundles/apexcharts/apexcharts.min.js"></script>
        <script src="assetss/bundles/amcharts4/core.js"></script>
        <script src="assetss/bundles/amcharts4/charts.js"></script>
        <script src="assetss/bundles/amcharts4/animated.js"></script>
        <script src="assetss/bundles/jquery.sparkline.min.js"></script>
        <!-- Page Specific JS File -->
        <script src="assetss/js/page/index.js"></script>
        <!-- Template JS File -->
        <script src="assetss/js/scripts.js"></script>
        <!-- Custom JS File -->
        <script src="assetss/js/custom.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const startTimeStr = '${requestScope.mon}';
                const weeksData = {1: {}, 2: {}, 3: {}, 4: {}};
                const saveButton = document.getElementById("saveSelectedSlots");
                const sendButton = document.getElementById("sendSelectedSlots");
                const tatussss = '${status}';
                if (tatussss === 'Pending' || tatussss === 'Approved') {
                    saveButton.classList.add('poiter');
                    sendButton.classList.add('poiter');
                } else {
                    saveButton.classList.remove('poiter');
                    sendButton.classList.remove('poiter');
                }
                saveButton.addEventListener("click", function () {
                    document.querySelector('.st').textContent = 'Saved';
                });
                sendButton.addEventListener("click", function () {
                    document.querySelector('.st').textContent = 'Pending';
                    saveButton.style.display = 'none';
                    sendButton.classList.add('poiter');
                });
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
                    // Chuyển đổi cả hai ngày về cùng định dạng Date
                    let slotDate, startDate;

                    // Xử lý dayOfSlot (có thể là yyyy-MM-dd hoặc dd-MM-yyyy)
                    if (dayOfSlot.includes('-')) {
                        const [part1, part2, part3] = dayOfSlot.split('-');
                        slotDate = part1.length === 4
                                ? new Date(part1, part2 - 1, part3)
                                : new Date(part3, part2 - 1, part1);
                    } else {
                        console.error("Invalid dayOfSlot format");
                        return 0;
                    }

                    // Xử lý startTimeStr (giả sử luôn là dd-MM-yyyy)
                    const [startDayStr, startMonthStr, startYearStr] = startTimeStr.split('-');
                    startDate = new Date(startDayStr, startMonthStr - 1, startYearStr);

                    // Đặt cả hai ngày về đầu tuần (Thứ Hai)
                    const slotDayOfWeek = slotDate.getDay();
                    const startDayOfWeek = startDate.getDay();
                    slotDate.setDate(slotDate.getDate() - (slotDayOfWeek === 0 ? 6 : slotDayOfWeek - 1));
                    startDate.setDate(startDate.getDate() - (startDayOfWeek === 0 ? 6 : startDayOfWeek - 1));

                    // Tính số tuần chênh lệch
                    const weekDiff = Math.round((slotDate - startDate) / (7 * 24 * 60 * 60 * 1000));

                    return weekDiff + 1; // +1 vì tuần đầu tiên là tuần 1
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

                // Đảm bảo rằng weeksData[weekId] tồn tại
                if (!weeksData[weekId]) {
                    weeksData[weekId] = {};
                }
                var key = weekId + '-' + nameOfDay.substring(0, 3) + '-' + slotId.substring(4) + '-' + formattedDayOfSlot;
                console.log(dayOfSlot, nameOfDay.substring(0, 2), slotId.substring(4));

                // Thêm dữ liệu mới vào object của tuần đó
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
                                    "</div>" +
                                    '<div class="slot_active">Selected</div>';
                            weeksData[week][slotKey] = item;
                        } else {
                            cell.innerHTML = '<div class="slot-label"></div>';
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
                            })
                            .catch(error => {
                                console.error("Failed to " + status + " selected slots:", error);
                            });

                    return false;
                }

                document.getElementById("renderButton").addEventListener("click", renderWeeks);

                updateSchedule();
                weekSelect.addEventListener("change", updateSchedule);

                saveButton.addEventListener("click", (event) => sendSelectedSlots(event, 'save'));
                sendButton.addEventListener("click", (event) =>
                    sendSelectedSlots(event, 'send')

                );
            });

        </script>

    </body>
</html>