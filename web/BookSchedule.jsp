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
    <body>
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
                                        <select id="week" name="week"></select>
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
                                <a href="bookSchedule" id="saveSelectedSlots">Save Selected Slots</a>      </div>
                        </form>
<!--                        <form action="bookSchedule" method="post">
                            <button type="submit">Saving</button>
                        </form>-->

                    </div>
                </div>
            </div>

        </main>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const daysOfWeek = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

                const scheduleData = [
            <c:forEach items="${listSS}">
                    {
                        day: "${listSS.dayOfSlotName}",
                        slot: ${listSS.slotId},
                        class: "SWR302",
                        room: "BE-209",
                        status: "attended",
                        time: "${listSS.slotName}",
                        selected: true
                    },
            </c:forEach>
                ];

                function getMonday(d) {
                    var day = d.getDay(),
                            diff = d.getDate() - day + (day == 0 ? -6 : 1);
                    return new Date(d.setDate(diff));
                }

                function formatDate(date) {
                    return (
                            date.getDate().toString().padStart(2, "0") +
                            "-" +
                            (date.getMonth() + 1).toString().padStart(2, "0")
                            );
                }

                function createSlotListener(cell, item) {
                    const updateSlotStatus = function () {
                        if (cell.classList.contains("selected")) {
                            cell.innerHTML =
                                    '<div class="class-block selected">' +
                                    "<div>" +
                                    item.class +
                                    "</div>" +
                                    '<div class="view-materials">View Materials</div>' +
                                    '<div class="edu-next">EduNext</div>' +
                                    "<div>at " +
                                    item.room +
                                    "</div>" +
                                    '<div class="selected-text">(selected)</div>' +
                                    '<div class="time">' +
                                    item.time +
                                    "</div>" +
                                    "</div>" +
                                    '<div class="slot_active">Selected</div>';
                        } else {
                            cell.innerHTML = '<div class="slot-label">Not Selected</div>';
                        }
                    };

                    const toggleSlot = function () {
                        cell.classList.toggle("selected");
                        updateSlotStatus();
                    };

                    updateSlotStatus();

                    cell.addEventListener("click", toggleSlot);
                }

                function updateSchedule() {
                    const monday = getMonday(new Date());

                    const dayHeaders = document.getElementById("dayHeaders");
                    dayHeaders.innerHTML = "<th>WEEK</th>";

                    daysOfWeek.forEach((day, index) => {
                        const date = new Date(monday);
                        date.setDate(date.getDate() + index);
                        const th = document.createElement("th");
                        th.innerHTML = day + `<br>` + formatDate(date);
                        dayHeaders.appendChild(th);
                    });

                    const tbody = document.querySelector("#scheduleTable tbody");
                    tbody.innerHTML = "";

                    for (let i = 1; i <= 4; i++) {
                        const row = document.createElement("tr");
                        row.innerHTML =
                                `<td>Slot ` + i + `</td>` + daysOfWeek.map(() => "<td></td>").join("");
                        tbody.appendChild(row);
                    }

                    scheduleData.forEach((item) => {
                        const dayIndex = daysOfWeek.indexOf(item.day);
                        if (dayIndex !== -1) {
                            const cell = tbody.rows[item.slot - 1].cells[dayIndex + 1];
                            if (item.selected) {
                                cell.classList.add("selected");
                            }
                            createSlotListener(cell, item);
                        }
                    });

                    for (let row = 0; row < tbody.rows.length; row++) {
                        for (let col = 1; col < tbody.rows[row].cells.length; col++) {
                            const cell = tbody.rows[row].cells[col];
                            if (!cell.innerHTML) {
                                cell.innerHTML = '<div class="slot-label">Not Selected</div>';
                                cell.addEventListener("click", function () {
                                    cell.classList.toggle("selected");
                                    if (cell.classList.contains("selected")) {
                                        cell.innerHTML =
                                                '<div class="class-block selected">' +
                                                "<div>Class</div>" +
                                                '<div class="view-materials">View Materials</div>' +
                                                '<div class="edu-next">EduNext</div>' +
                                                "<div>at Room</div>" +
                                                '<div class="selected-text">(selected)</div>' +
                                                '<div class="time">Time</div>' +
                                                "</div>" +
                                                '<div class="slot_active">Selected</div>';
                                    } else {
                                        cell.innerHTML = '<div class="slot-label">Not Selected</div>';
                                    }
                                });
                            }
                        }
                    }
                }

                updateSchedule();

                function saveSelectedSlots(event) {

                    const selectedSlots = [];
                    const tbody = document.querySelector("#scheduleTable tbody");
                    const monday = getMonday(new Date());

                    for (let row = 0; row < tbody.rows.length; row++) {
                        for (let col = 1; col < tbody.rows[row].cells.length; col++) {
                            const cell = tbody.rows[row].cells[col];
                            if (cell.classList.contains("selected")) {
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

                    console.log("Selected Slots:", selectedSlots);

                    fetch("testajax", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify(selectedSlots),
                    })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error("Network response was not ok");
                                }
                                return response.text();
                            })
                            .then(data => {
                                console.log("Response from server:", data);
                                alert("Selected slots saved successfully!");
                            })
                            .catch(error => {
                                console.error("Failed to save selected slots:", error);
                                // Handle error cases if needed
                            });

                    return false;
                }

                const saveButton = document.getElementById("saveSelectedSlots");
                saveButton.addEventListener("click", saveSelectedSlots);
            });

        </script>

    </body>
</html>