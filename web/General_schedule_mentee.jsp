<%-- 
    Document   : General_schedule_mentee
    Created on : Jun 24, 2024, 10:05:14 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>General Schedule</title>
    <style>
        body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 20px;
  background-color: #f0f0f0;
}

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
.poiter{
    pointer-events: none;
}
.schedule-containers {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
    }

    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        background-color: white;
        font-size: 16px;
    }

    #attendanceStatus {
        background-color: white;
        padding: 15px;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    #attendanceStatus h3 {
        color: #333;
        margin-top: 0;
        margin-bottom: 10px;
        font-size: 18px;
    }

    #attendanceStatus p {
        margin: 5px 0;
        font-size: 14px;
        color: #666;
    }
    .lime-green {
  color: #32CD32  !important;
}

.error-red {
  color: #FF0000 !important;
}
</style>
  </head>
  <body>
      <jsp:include page="header.jsp" />
    <div class="schedule-container">
            <h1>General Schedule Mentee</h1>

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
        </tbody>
      </table>
          </div>
          <a href="bookSchedule" hidden  id="saveSelectedSlots">Save Selected Slots</a></div>
                                <a href="bookSchedule" hidden id="sendSelectedSlots">Send Schedule</a>
    <div hidden class="select-container class-set-render">
                                                <div hidden id="renderButton" >Render</div>
                                            </div>
<div class="schedule-containers">
    <h2 class="text-center">
Class attendance statistics</h2>
    <select id="skillSelect">
        <option value="">Select a skill</option>
        <c:forEach var="skill" items="${listSkill}">
            <option value="${skill.skillName}">${skill.skillName}</option>
        </c:forEach>
    </select>

    <select id="timeRangeSelect" style="display: none;">
        <option value="">Select a time range</option>
    </select>

    <div id="attendanceStatus" style="display: none;"></div>
</div>

  <script>
    $(document).ready(function() {
        var skillData = ${skillDataJson};

        $('#skillSelect').change(function() {
            var selectedSkill = $(this).val();
            var timeRangeSelect = $('#timeRangeSelect');
            timeRangeSelect.empty().append('<option value="">Select a time range</option>');

            if (selectedSkill && skillData[selectedSkill]) {
                $.each(skillData[selectedSkill], function(timeRange, status) {
                    timeRangeSelect.append($('<option>', {
                        value: timeRange,
                        text: timeRange
                    }));
                });
                timeRangeSelect.show();
            } else {
                timeRangeSelect.hide();
                $('#attendanceStatus').hide();
            }
        });

        $('#timeRangeSelect').change(function() {
            var selectedSkill = $('#skillSelect').val();
            var selectedTimeRange = $(this).val();
            var attendanceStatus = $('#attendanceStatus');

            if (selectedSkill && selectedTimeRange && skillData[selectedSkill][selectedTimeRange]) {
                var status = skillData[selectedSkill][selectedTimeRange];
                var statusHtml = '<h3>Attendance Status:</h3>';
                statusHtml += '<p class="error-red">Absent: ' + (status['Absent'] || 0) + '</p>';
                statusHtml += '<p class="lime-green">Attended: ' + (status['Attended'] || 0) + '</p>';
                statusHtml += '<p class="error-red">Not Yet: ' + (status['Not Yet'] || 0) + '</p>';
                attendanceStatus.html(statusHtml).show();
            } else {
                attendanceStatus.hide();
            }
        });
    });
</script>
                               
     <script>
            document.addEventListener("DOMContentLoaded", function () {
                const startTimeStr = '${startTime}';
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
                document.getElementById('scheduleTable').classList.add('poiter');
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

                    // Xử lý startTimeStr (giả sử luôn là dd-MM-yyyy)
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
          <c:forEach items="${requestScope.listSchedule_gereral}" var="schedule">
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

                        var status = "${schedule.attendanceStatus}";
                        var displayStatus = status;
                        var statusColor = "black";

                        if (status === null || status.trim() === "") {
                            displayStatus = "Not Yet";
                            statusColor = "red";
                        } else if (status === "Absent") {
                            statusColor = "red";
                        } else if (status === "Attended") {
                            statusColor = "green";
                        }

                        weeksData[weekId][key] = {
                            class: "${schedule.mentorName.toUpperCase()}",
                            room: "${schedule.skillName}",
                            time: "<span style='color:" + statusColor + ";'>" + displayStatus + "</span>",
                            slotName: "${schedule.slot_name}"
                        };
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

                    for (let i = 0; i < ${listSlot.size()}; i++) {
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
                                    time: "Time",
                                    slotName: "SlotName"
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
                                    "<div> Mentor: " + item.class + "</div>" +
                                    '<div class="view-materials">View Materials</div>' +
                                    '<div class="edu-next">EduNext</div>' +
                                    "<div> Subject: " + item.room + "</div>" +
                                    '<div class="selected-text"></div>' +
                                    '<div class="time">Study time: ' +item.slotName + "</div>" +
                                    "</div>" +
                                    '<div class="slot_active">'+item.time +'</div>';
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

