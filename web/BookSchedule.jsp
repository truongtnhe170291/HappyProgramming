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
            }
            li::before {
                content: "•";
                color: #666;
                display: inline-block;
                width: 1em;
                margin-right: 0.5em;
            }
            .highlight {
                color: #4a86e8;
                font-weight: bold;
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
                        <form id="scheduleForm">
                            <div class="schedule-container">
                                <div class="header">
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
                                <div>${sessionScope.status}</div>
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
                                        <li>Your selection of week will select for <span class="highlight">hole month</span></li>
                                        <li>You cannot booking a schedule on <span class="highlight">Saturday</span> and <span class="highlight">Sunday</span></li>
                                        <li>You can <span class="highlight">Update</span> your schedule when status is <span class="highlight">Pending</span></li>
                                    </ul>
                                </div>  
                                <a href="bookSchedule" id="saveSelectedSlots">Save Selected Slots</a></div>
                                <a href="bookSchedule" id="saveSelectedSlots">Send Schedule</a></div>
                        </form>
                      
                            <button id="renderButton" type="submit">Render</button>
                       

                    </div>
                </div>
            </div>

        </main>
        <script>
 document.addEventListener("DOMContentLoaded", function () {
    const startTimeStr = '2024-06-24';
    const weeksData = {};

    function formatDate(date) {
        return (
            date.getDate().toString().padStart(2, "0") +
            "-" +
            (date.getMonth() + 1).toString().padStart(2, "0") +
            "-" +
            date.getFullYear().toString().padStart(4, "0")
        );
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
            options.push({ value: week + 1, text: optionText });
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

    function renderWeeks() {
        for (let week = 2; week <= 4; week++) {
            weeksData[week] = JSON.parse(JSON.stringify(weeksData[1]));
        }
        updateSchedule();
    }

    function updateSchedule() {
        const selectedWeek = parseInt(weekSelect.value);
        const startDate = new Date(startTimeStr);
        const monday = new Date(
            startDate.getTime() + (selectedWeek - 1) * 7 * 24 * 60 * 60 * 1000
        );

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

        for (let i = 0; i < 5; i++) {
            const row = document.createElement("tr");
            row.innerHTML = `<td>Slot`+(i + 1)+`</td>` + "<td></td>".repeat(7);
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
                cell.innerHTML = '<div class="slot-label">Not Selected</div>';
                delete weeksData[week][slotKey];
            }
        }

        function toggleSlot() {
            cell.classList.toggle("selected");
            updateSlotStatus(cell, item, week, slotKey);
            console.log("weeksData after toggle:", weeksData);
        }

        updateSlotStatus();
        cell.addEventListener("click", toggleSlot);
    }

    document.getElementById("renderButton").addEventListener("click", renderWeeks);

    updateSchedule();
    weekSelect.addEventListener("change", updateSchedule);

function saveSelectedSlots(event) {
        event.preventDefault();
        const selectedWeek = parseInt(weekSelect.value);
        const selectedSlotsArray = Object.values(weeksData);

        fetch("bookSchedule", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({slots: selectedSlotsArray }),
        })
        .then(response => {
            if (!response.ok) throw new Error("Network response was not ok");
            return response.text();
        })
        .then(data => {
            console.log("Response from server:", data);
            alert("Selected slots saved successfully!");
        })
        .catch(error => {
            console.error("Failed to save selected slots:", error);
        });

        return false;
    }
    
    const saveButton = document.getElementById("saveSelectedSlots");
    saveButton.addEventListener("click", saveSelectedSlots);
});




        </script>

    </body>
</html>