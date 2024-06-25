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

</style>
  </head>
  <body>
      <jsp:include page="header.jsp" />
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
        </tbody>
      </table>
    </div>
    <script>
document.addEventListener("DOMContentLoaded", function () {
  const startTimeStr = '<fmt:formatDate value="${listSchedule[0].startTime}" pattern="yyyy-MM-dd" />';
  console.log("Start Time:", startTimeStr);

  const scheduleData = [
    <c:forEach var="schedule" items="${listSchedule}" varStatus="loop">
      {
        day: "${fn:substring(schedule.nameOfDay,0,3)}",
        slot: ${fn:substring(schedule.slotId, 5,6)},
        class: "SWP391",
        room: "${schedule.mentorName}",
        status: "scheduled",
        time: "${schedule.slot_name}",
      }${!loop.last ? ',' : ''}
    </c:forEach>
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
      "-" +
      (date.getMonth() + 1).toString().padStart(2, "0")
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
      
      const optionText = formatDate(mondayOfWeek) + ` to ` + formatDate(sundayOfWeek);
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
    const monday = getMonday(new Date(startTimeStr));
    monday.setDate(monday.getDate() + (selectedWeek - 1) * 7);
    console.log("Selected Week:", selectedWeek, "Monday Date:", monday);

    const dayHeaders = document.getElementById("dayHeaders");
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
    tbody.innerHTML = "";

    for (let i = 0; i < 5; i++) {
      const row = document.createElement("tr");
      row.innerHTML = `<td>Slot` + i + `</td>` + "<td></td>".repeat(7);
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

        cell.innerHTML += "<div class=\"class-block\">" +
          "<div>" + item.class + " " + onlineIndicator + "</div>" +
          "<div class=\"view-materials\">View Materials</div>" +
          "<div class=\"edu-next\">EduNext</div>" +
          "<div>Mentor: " + item.room + "</div>" +
          "<div class=\"" + item.status + "\">(" + item.status + ")</div>" +
          "<div class=\"time\">" + item.time + "</div>" +
          onlineNowIndicator +
          "</div>";
      }
    });
  }

  weekSelect.addEventListener("change", updateSchedule);
  updateSchedule();

  setInterval(updateSchedule, 60000);
});

</script>
  </body>
</html>

