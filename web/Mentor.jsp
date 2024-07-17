<!DOCTYPE html>
<html lang="en">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <head>
        <meta charset="utf-8">
        <title>Fmaster</title>
        <meta name="viewport"
              content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
              href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
              href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
              href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Raleway:400,500,600,700,800"
              rel="stylesheet">

        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/superfish.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="fontello/css/fontello.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
              crossorigin="anonymous">


<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

        <style>
         .header {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    margin-bottom: 20px !important;
}

.header h2 {
    margin: 0 !important;
}

.header button {
    background-color: #4CAF50 !important;
    color: #fff !important;
    border: none !important;
    padding: 8px 16px !important;
    border-radius: 4px !important;
    cursor: pointer !important;
    margin-left: 10px !important;
}

.custompagect {
    max-width: 200% !important;
}

.day {
    background-color: #f9f9f9 !important;
    border-radius: 4px !important;
    padding: 10px !important;
    margin-bottom: 10px !important;
}

.day-header {
    font-weight: bold !important;
    margin-bottom: 10px !important;
}

.event {
    display: flex !important;
    align-items: center !important;
    margin-bottom: 5px !important;
}

.event-dot {
    width: 12px !important;
    height: 12px !important;
    border-radius: 50% !important;
    margin-right: 10px !important;
}

.wrapper {
    display: flex !important;
    flex-direction: column !important;
    justify-content: center !important;
    align-items: center !important;
    height: 100% !important;
    background-color: #f2f2f2 !important;
}

.mentor-image {
    transform: translateX(235%) !important;
    border-radius: 50% !important;
    width: 200px !important;
    height: 200px !important;
    background-size: contain !important;
    margin-bottom: 20px !important;
}

.content-box {
    margin-top: 20px !important;
    display: flex !important;
    flex-direction: column !important;
    justify-content: center !important;
    background-color: white !important;
    padding: 20px !important;
    border-radius: 10px !important;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1) !important;
    max-width: 100% !important;
}

.btn-light.active {
    background-color: #2250fc !important;
    color: #ccc !important;
}

.btn-light {
    line-height: 50px !important;
    margin-left: 60px !important;
}

input[type="checkbox"] {
    /* display: none !important; */
}

.status {
    font-size: 15px !important;
    margin-top: 10px !important;
    color: #333 !important;
    font-weight: bold !important;
    float: left !important;
}

.btn-light.active {
    background-color: #2250fc !important;
    color: #ccc !important;
}

input[type="checkbox"] {
    /* display: none !important; */
}

#calendar {
    width: 150% !important;
    height: auto !important;
}

.content, .col-lg-8, .col-lg-4 {
    width: 100% !important;
}

.event {
    display: flex !important;
    align-items: center !important;
}

.event-dot {
    margin-right: 10px !important;
}

.event-content {
    display: flex !important;
    flex-grow: 1 !important;
    justify-content: space-between !important;
    align-items: center !important;
}

.rights {
    margin-left: auto !important;
}

.event {
    display: flex !important;
    justify-content: space-between !important;
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
    background-color: #e6f3ff !important;
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

#scheduleTable {
    max-width: 100% !important;
}

.course {
    display: flex !important;
    justify-content: space-between !important;
}

.ac {
    transform: translateY(-24px) !important;
}

            .course {
                display: flex;
                justify-content: space-between;
            }

            .ac {
                transform: translateY(-24px);
            }
.box_style_1.profile {    
    background-color: #ffffff;
    border: 2px solid #007bff; 
    border-radius: 15px; 
    padding: 25px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin: 20px auto; 
    max-width: 650px;
    width: 650px;
}

.box_style_1.profile img {
    border: 4px solid #007bff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15); 
}


.box_style_1.profile ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.box_style_1.profile ul li {
    padding: 12px 0;
    font-size: 16px;
    color: #333; 
    border-bottom: 1px solid #ddd; 
}

.box_style_1.profile ul li:last-child {
    border-bottom: none; 
}

.box_style_1.profile ul li strong {
    color: #007bff; 
}

.box_style_1.profile a.btn-success {
    background-color: #007bff; 
    border-color: #0056b3;
    color: white;
    text-align: center;
    padding: 12px 18px;
    text-transform: uppercase;
    font-weight: bold;
    display: block;
    margin-top: 15px;
    border-radius: 8px;
    transition: background-color 0.3s ease, border-color 0.3s ease; 
}

.box_style_1.profile a.btn-success:hover {
    background-color: #0056b3; 
    border-color: #00409a; 
}

#profile_teacher {
    background-color: #f8f9fa; 
    border: 1px solid #ddd;
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    margin-top: 20px;
}

#profile_teacher h3, #profile_teacher h4 {
    color: #007bff; 
    border-bottom: 2px solid #007bff;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

#profile_teacher p {
    font-size: 16px;
    line-height: 1.6;
    color: #333; 
}

#profile_teacher .list_3 {
    list-style: disc;
    padding-left: 20px;
}

#profile_teacher .list_3 li {
    margin-bottom: 10px;
}

.star-rating {
    font-size: 18px;
    color: #ffc107; 
}

.rating {
    display: flex;
    align-items: center;
    gap: 5px;
}

.comment {
    font-style: italic;
    color: #555; 
}
#courses {
    background-color: #f8f9fa;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

#courses h3 {
    color: #007bff;
    border-bottom: 2px solid #007bff;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

/* Style cho b?ng */
#courses table {
    width: 100%;
    border-collapse: collapse;
}

#courses table th, #courses table td {
    padding: 12px;
    text-align: left;
}

#courses table th {
    background-color: #007bff;
    color: white;
    font-weight: bold;
    border-bottom: 2px solid #0056b3;
}

#courses table td {
    background-color: #ffffff;
    border-bottom: 1px solid #ddd;
}

#courses table td:last-child {
    border-bottom: none;
}

#courses .user-avatar img {
    border: 2px solid #007bff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#courses .rating {
    display: flex;
    align-items: center;
}

#courses .rating .star-rating {
    font-size: 20px;
    color: #ffc107;
}

#courses .feedback-item {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 10px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

#courses .feedback-item:hover {
    background-color: #f1f1f1;
    border-color: #007bff;
}

#courses .feedback-item .feedback-avatar {
    float: left;
    margin-right: 10px;
}

#courses .feedback-item .feedback-content {
    overflow: hidden;
}

#courses .feedback-item .feedback-content .feedback-name {
    font-weight: bold;
    color: #007bff;
}

#courses .feedback-item .feedback-content .feedback-comment {
    margin-top: 5px;
    color: #333;
}
.col-md-4{
    width: 100%;
display: contents;
}
.img-circle .styled{
    width:  50px;
    height: 50px;
    background-size: contain;
}
.no-schedule {
  margin-top:20px;
  width: 100%;
  height: 60vh;
  background-color: #ccc;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 2rem;
  color: #333;
}

        </style>
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <section id="main_content">

            <div class="container">

<!--                <ol class="breadcrumb">
                    <li class="active">Active page</li>
                </ol>-->

             <div class="row">
    <aside class="col-md-4">
        <div class="box_style_1 profile">
            <p class="text-center">
                <img src="./imgcv/${mentor.avatar}" alt="Teacher" class="img-circle styled" style="width:100px;">
            </p>
            <ul>
                <li>Name <strong class="pull-right">
                        <c:out value="${mentor.fullName}" />
                    </strong> </li>
                <li>Email <strong class="pull-right">
                        <c:out value="${mentor.gmail}" />
                    </strong></li>
                <li>Telephone<strong class="pull-right">
                        <c:out value="${mentor.phone}" />
                    </strong></li>
                <li>Address<strong class="pull-right">
                        <c:out value="${mentor.address}" />
                    </strong></li>
                <li>Gender <strong class="pull-right">${mentor.sex ? "Male" : "Female"}</strong></li>

                <li>Price <strong class="pull-right">
                        <c:out value="${mentor.rate}" />
                    </strong></li>
                <li> <strong class="pull-right">
                        <a href="request?cvId=${mentor.cvID}" class="btn btn-success martes_book">Book</a>
                    </strong></li>
            </ul>
        </div>
    </aside>
    <div >
        <ul class="nav nav-tabs" id="mytabs">
            <li class="active"><a href="#profile_teacher" data-toggle="tab">Profile</a></li>
            <li><a href="#courses" data-toggle="tab">Feedback</a></li>
            <li><a href="#schedule" id="schedulesss" data-toggle="tab">Schedule</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="profile_teacher">
                <h3>About me</h3>
                <p><strong> Profession: </strong>
                    <c:out value="${mentor.profession}" />
                </p>
                <p><strong> Profession Introduction: </strong>
                    <c:out value="${mentor.professionIntro}" />
                </p>
                <h4>My Achievement </h4>
                <p>
                    <c:out value="${mentor.achievementDescription}" />
                </p>
                <h4>Service Description </h4>
                <p>
                    <c:out value="${mentor.service_description}" />
                </p>
                <h4>My Skill </h4>

                <c:forEach items="${mentor.listSkills}" var="skill">
                    <p>${skill.skillName}</p>
                </c:forEach>
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list_3">
                        </ul>
                    </div>
                </div>
            </div>

            <div class="tab-pane in" id="courses">
                <h3>Rate & Comment</h3>

                <table width="100%" style="border-collapse: collapse; width: 100%;">
                    <c:forEach items="${mentor.feedBacks}" var="feedback">
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding: 10px; width: 10%;">
                                <div class="user-avatar" style="text-align: center;">
                                    <img class="avatar" src="img/${feedback.avatar}" alt="User Avatar" style="border-radius: 50%; width: 50px; height: 50px;">
                                </div>
                            </td>
                            <td style="padding: 10px; width: 20%;">
                                <p style="margin: 0; font-weight: bold;">
                                    <c:out value="${feedback.menteeName}" />
                                </p>
                            </td>
                            <td style="justify-content: center">
                                <div id="te" class="rating">
                                    <div class="star-rating" data-rating="${feedback.star}"></div>
                                </div>
                                <div class="rating" data-rating="${feedback.star}"> </div>
                            </td>
                            <td style="padding: 10px; width: 50%; text-align: end">
                                <div class="comment">
                                    <p style="margin: 0;">${feedback.comment}</p>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
      
   


                                <div class="tab-pane in" id="schedule">
                                 <section id="page-content" class="no-sidebar">
                                      <c:forEach items="${requestScope.listSchedule}" var="schedule">
                                                <c:set var="start" value="${schedule.startTime}"/>
                                                <c:set var="end" value="${schedule.endTime}"/>
                                            </c:forEach>
                                            <input id="setStart_time" type="hidden" name="start_time" value="${start}" />
                                            <input id="setEnd_time" type="hidden" name="end_time" value="${end}"/>

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
                                                                    
                                                                </div>
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

                                                    </section>
                                                        </div>
                        </div>
                    </div>
                                
                </div>
        </section>



        <script src="jss/bootstrap.min.js"></script>
        <script src="jss/classie.js"></script>
        <script src="jss/uisearch.js"></script>
      
          <script>
                document.addEventListener('DOMContentLoaded', () => {
            
                let currentAction = "editable";
const scheduleData = [
    <c:forEach items="${requestScope.listSchedule}" var="schedule">
        <c:set var="isSelected" value="false"/>
        <c:forEach items="${requestScope.scheduleOfMentee}" var="menteeSchedule">
            <c:if test="${menteeSchedule.slotId == schedule.slotId && menteeSchedule.dayOfSlot == schedule.dayOfSlot}">
                <c:set var="isSelected" value="true"/>
            </c:if>
        </c:forEach>
        <c:set var="status" value="${isSelected ? 'selected' : 'not-selected'}"/>
    {
        week: null,
        nameday: "${schedule.nameOfDay}",
        slot: ${schedule.slotId.substring(5)},
        class: "SWR302",
        room: "BE-209",
        day: "${schedule.dayOfSlot}",
        time: "${schedule.slot_name}"
    },
        <c:set var="start" value="${schedule.startTime}"/>
        <c:set var="end" value="${schedule.endTime}"/>
    </c:forEach>
];
const s = `${noBook}`;
const scheduleContainer = document.getElementById('schedule');
function showToastMessage(message) {
                Toastify({
                text: message,
                        duration: 5000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#ff7b5a",
                }).showToast();
                }
if (s !== '') {
  scheduleContainer.innerHTML = '<div class="no-schedule">No Schedule</div>';
  
  document.querySelector('.pull-right a').addEventListener('click', (e) =>{
      e.preventDefault();
      showToastMessage('This Mentor does not have a schedule yet');
  });
}
   
    
                
let allSelectedSlots = [];
console.log("Initial scheduleData:", scheduleData);

function generateWeeks(startDate) {
    const weeks = [];
    const start = new Date(startDate);
    for (let i = 0; i < 4; i++) {
        const weekStart = new Date(start);
        weekStart.setDate(start.getDate() + i * 7);
        const weekEnd = new Date(weekStart);
        weekEnd.setDate(weekEnd.getDate() + 6);
        weeks.push({ week: i + 1, start: weekStart, end: weekEnd });
    }
    return weeks;
}

function getWeekNumber(date, startDate) {
    const weeks = generateWeeks(startDate);
    const targetDate = new Date(date);
    for (let i = 0; i < weeks.length; i++) {
        if (targetDate >= weeks[i].start && targetDate <= weeks[i].end) {
            return weeks[i].week;
        }
    }
    return null;
}

const start = '${start}'; 

console.log("Start date:", start);

scheduleData.forEach((item) => {
    console.log("Processing item:", item);
    item.week = getWeekNumber(item.day, start);
    console.log("Calculated week:", item.week);
});

console.log("Updated scheduleData:", scheduleData);

const tmp = scheduleData.filter(s => s.week ===  1);
console.log("Items in week 2:", tmp);
                function formatDate(date) {
                return (
                        date.getFullYear().toString().padStart(4, "0") +
                        "-" +
                        (date.getMonth() + 1).toString().padStart(2, "0") +
                        "-" +
                        date.getDate().toString().padStart(2, "0")
                        );
                }

                function getMonday(date) {
                date = new Date(date);
                const day = date.getDay();
                const diff = date.getDate() - day + (day === 0 ? - 6 : 1);
                return new Date(date.setDate(diff));
                }

                function getWeekOptions(start) {
                const startDate = new Date(start);
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

                function isClassCurrentlyHappening(classItem, currentDate) {
                const [startHour, startMinute] = classItem.time.split("-")[0].split(":").map(Number);
                const [endHour, endMinute] = classItem.time.split("-")[1].split(":").map(Number);
                const classStart = new Date(currentDate);
                classStart.setHours(startHour, startMinute, 0);
                const classEnd = new Date(currentDate);
                classEnd.setHours(endHour, endMinute, 0);
                return currentDate >= classStart && currentDate < classEnd;
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
                function updateSchedule() {
                const selectedWeek = parseInt(weekSelect.value);
                const startDate = new Date('${start}');
                const monday = new Date(startDate);
                monday.setDate(monday.getDate() + (selectedWeek - 1) * 7);
                // Update headers
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
                // Update slots
                const tbody = document.querySelector("#scheduleTable tbody");
                tbody.innerHTML = "";
                for (let i = 0; i < 5; i++) {
                const row = document.createElement("tr");
                row.innerHTML = `<td>Slot ` + (i + 1) + `</td>` + "<td></td>".repeat(7);
                tbody.appendChild(row);
                }

                const currentDate = new Date();
                const weekData = scheduleData.filter(item => item.week === selectedWeek);
                console.log(weekData);
                weekData.forEach((item) => {
                const dayIndex = daysOfWeek.indexOf(item.nameday.toUpperCase());
                console.log(dayIndex);
                if (dayIndex !== - 1) {
                const cell = tbody.rows[item.slot - 1].cells[dayIndex + 1];
                if (cell) {
                let onlineIndicator = item.online ? '<span class="online-indicator"></span>' : "";
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
                        '<div class="status ' + statusClass + '" data-day="' + item.day + '" data-slot="' + item.slot + '" data-week="' + item.week + '">' + statusText + '</div>' +
                        '<div class="time">' + item.time + '</div>' +
                        onlineNowIndicator +
                        '</div>';
                if (item.status === "selected") {
                cell.classList.add("selected");
                }
                }
                }
                });
                // Update event listeners
               document.querySelectorAll(".status").forEach((element) => {
        element.addEventListener("click", function () {
            const day = this.getAttribute("data-day");
            const slot = parseInt(this.getAttribute("data-slot"));
            const week = parseInt(this.getAttribute("data-week"));
            const filteredSchedule = scheduleData.find(
                (item) => item.day === day && item.slot === slot && item.week === week
            );
            if (filteredSchedule) {
                if (filteredSchedule.status === "selected") {
                    filteredSchedule.status = "selected";
                    this.textContent = getStatusText("selected");
                    this.classList.remove("not-selected");
                    this.classList.add("selected");
                    this.closest('td').classList.add("selected");
                                allSelectedSlots.push({day, slot, week});

                 
                } else if (filteredSchedule.status === "selected") {
                    filteredSchedule.status = "selected";
                    this.textContent = getStatusText("selected");
                    this.classList.remove("selected");
                    this.classList.add("selected");
                    this.closest('td').classList.remove("selected");
                     allSelectedSlots = allSelectedSlots.filter(
                item => !(item.day === day && item.slot === slot && item.week === week)
            );
                
                }
            }
        });
    });
}


    

    

                const weekSelect = document.getElementById("week");
                const weekOptions = getWeekOptions('${start}');
                weekOptions.forEach((option) => {
                const opt = document.createElement("option");
                opt.value = option.value;
                opt.textContent = option.text;
                weekSelect.appendChild(opt);
                });
               
                weekSelect.addEventListener("change", updateSchedule);
                updateSchedule();
                });
            </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const ratings = document.querySelectorAll('.rating');
                console.log(ratings);
                ratings.forEach(rating => {
                    const starValue = parseFloat(rating.getAttribute('data-rating'));
                    const fullStars = Math.floor(starValue);

                    for (let i = 0; i < fullStars; i++) {
                        rating.innerHTML += '<i class="fas fa-star"></i>';
                    }

                    const emptyStars = 5 - Math.ceil(starValue);
                    for (let i = 0; i < emptyStars; i++) {
                        rating.innerHTML += '<i class="far fa-star"></i>';
                    }
                });
            });
        </script>

    </body>

</html>