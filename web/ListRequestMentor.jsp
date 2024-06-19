<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
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

      .status-cancel, .status-closed {
           width: 100px !important;
           height: 50px !important;
          color: red !important;
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
                    <table class="table mb-0 table-borderless">

                        <thead>
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
                                    <td class="status-cell" data-status="${request.status.statusName}">${request.status.statusName}</td>

                                <td class="d-flex" style="margin-top:12px;">
                                    <form method="POST" action="ListRequest">
                                        <input type="hidden" name="requestId" value="${request.requestId}" />
                                        <div class="action-btn">
                                            <a href="#" class="btn btn-primary align-center centaxs"
                                               data-bs-toggle="modal" data-bs-target="#${request.menteeName}${request.requestId}"
                                               style="background-color: #fff; border: none;">

                                                <i class="uil uil-eye  align-center" style="color: blue;"></i> </a>

                                            <div class="modal fade ticket_modal" id="${request.menteeName}${request.requestId}" role="dialog"
                                                 tabindex="-1" aria-hidden="true">

                                                <div
                                                    class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
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
                                                                <div>Deadline: ${request.deadlineHour}
                                                                    ${request.deadlineDate}</div><br>

                                                                <div class="form-container">
                                                                    <table border="1" width="100%">
                                                                        <thead>
                                                                            <tr>
                                                                                <th rowspan="2">WEEK
                                                                                    <select>
                                                                                        <option>10/6 To 16/6</option>
                                                                                        <option>17/6 To 23/6</option>
                                                                                        <option>24/6 To 30/6</option>
                                                                                        <option>31/6 To 7/7</option>
                                                                                    </select>
                                                                                </th>
                                                                                <c:forEach var="day"
                                                                                    items="${listDays}">
                                                                                    <th class="equal-width">
                                                                                        ${day.dateName}</th>
                                                                                </c:forEach>
                                                                            </tr>
                                                                            <tr>
                                                                                <c:forEach var="day"
                                                                                    items="${listDays}">
                                                                                    <th class="equal-width">
                                                                                        ${day.dateValue}</th>
                                                                                </c:forEach>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach var="slot" items="${listSlots}"
                                                                                varStatus="loop">
                                                                                <tr>
                                                                                    <td>Slot ${slot.slot_name}</td>
                                                                                    <c:forEach var="day"
                                                                                        items="${listDays}">
                                                                                        <c:set var="found"
                                                                                            value="false" />
                                                                                        <td>
                                                                                            <c:forEach
                                                                                                var="scheduleItem"
                                                                                                items="${request.listSchedule}">
                                                                                                <c:if
                                                                                                    test="${scheduleItem.dayOfSlot == day.date1 && scheduleItem.slotId == slot.slot_id}">
                                                                                                    <div
                                                                                                        class="slot-info">
                                                                                                        day:
                                                                                                        ${scheduleItem.nameOfDay},<br>
                                                                                                        slot:
                                                                                                        ${scheduleItem.slotId.substring(5)},<br>
                                                                                                        class:
                                                                                                        SWR302,<br>
                                                                                                        room:
                                                                                                        BE-209,<br>
                                                                                                        status:
                                                                                                        not-selected,<br>
                                                                                                        time:
                                                                                                        ${scheduleItem.slot_name},<br>
                                                                                                        startTime:
                                                                                                        ${scheduleItem.startTime},<br>
                                                                                                        endTime:
                                                                                                        ${scheduleItem.endTime}<br>
                                                                                                        day Of slot:
                                                                                                        ${scheduleItem.dayOfSlot}<br>
                                                                                                    </div>
                                                                                                    <c:set var="found"
                                                                                                        value="true" />
                                                                                                </c:if>
                                                                                            </c:forEach>
                                                                                            <c:if test="${not found}">
                                                                                                <!-- If no schedule is found for this day and slot, display an empty cell -->
                                                                                                <div class="empty-cell">
                                                                                                </div>
                                                                                            </c:if>
                                                                                        </td>
                                                                                    </c:forEach>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                    <input type="hidden" id="selectedSlots"
                                                                        name="selectedSlots" value="">
                                                                </div>

                                                                <!-- Displaying Skills -->
                                                                <div class="skills-container">
                                                                    <h3>Skills</h3>
                                                                    <c:forEach var="skill"
                                                                        items="${request.listSkills}">
                                                                        <div>Skill: ${skill.skillName}</div>
                                                                    </c:forEach>
                                                                </div>
                                                                <br />
                                                            </div>
                                            </div>
                                        </div>

                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                                                    <form method="POST" action="success">
                                   <input type="hidden" name="requestId" value="${request.requestId}" />
                                   <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" type="submit">
                                       <li>
                                           <a href="#" class="edit">
                                               <i class="uil uil-check"></i>
                                           </a>
                                       </li>
                                   </button>
                               </form>
                               <form method="POST" action="reject"
                                     onsubmit="return confirm('Are you sure you want to delete this request?');">
                                   <input type="hidden" name="requestId" value="${request.requestId}" />
                                   <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" type="submit">
                                       <li>
                                           <a href="#" class="remove">
                                               <i class="uil uil-times"></i>
                                           </a>
                                       </li>
                                   </button>
                               </form>


                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
     
            <script>
            document.addEventListener("DOMContentLoaded", function() {
                const statusCells = document.querySelectorAll(".status-cell");
                  
                statusCells.forEach(cell => {
                    const status = cell.getAttribute("data-status");
                    console.log(status);
                    switch(status) {
                        case "Open Class":
                            cell.classList.add("status-open");
                            break;
                        case "Processing":
                          case  "Wait For Payment":
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
