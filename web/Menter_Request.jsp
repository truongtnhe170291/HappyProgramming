
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
        <title>Fmaster</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            .calendar {
                max-width: 900px;
                margin: 0 auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
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
                    transform: translateX(300%);
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
                    align-items: center;
                    background-color: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                    max-width: 1300px;
                    width: 100%;
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
                    line-height: 50px;
                    margin-left: 60px;
                    font-size: 16px;
                    margin-top: 10px;
                    color: #333;
                    font-weight: bold;
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

                body {
                    font-family: Arial, sans-serif;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    height: 100vh;
                    margin: 0;
                    background-color: #f0f0f0;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
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

                th.equal-width {
                    width: 100%;
                }


                .slot {
                    width: 125px !important;
                    background-color: transparent !important;
                    display: block;
                    text-align: center;
                    padding: 10px;
                    cursor: pointer;
                }

                .slot-checkbox {
                    display: none;
                }

                .slot-label {
                    height: 88.2px;
                    width: 100px;
                    display: inline-block;
                    padding: 5px 10px;
                    color: #333;
                    border-radius: 4px;
                    transition: background-color 0.3s ease;
                }

                .slot-checkbox:checked + .slot-label {
                    background-color: #4CAF50;
                    color: #fff;
                }

                .slot-checkbox:focus + .slot-label {
                    outline: none;
                    box-shadow: none;
                }
                .form-container {
                    text-align: center;
                }

                .form-container button {
                    padding: 10px 20px;
                    background-color: #8B0000;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                .form-container button:hover {
                    background-color: #0056b3;
                }
                .status_check{
                    display: flex;
                    justify-content: space-between;
                }

                .status-box {
                    height: 50px;
                    padding: 10px;
                    background-color: #f8f9fa;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                }
                .highlighted {
                    background-color: #d1e7dd;
                }
                .slot-checkbox:checked + label {
                    background-color: #f0f0f0;
                }

                .slot-checkbox:checked + label.highlighted {
                    background-color: #d1e7dd;
                }

                #notify_btn{
                    margin-right: 12px;
                }
                .class-block {
                    transform: translateX(-28px);
                    width: 125px;
                    background-color: #e6f3ff;
                    border-radius: 5px;
                    padding: 5px;
                    margin-bottom: 5px;
                    text-align: left !important;
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
                .note-container {
                    background-color: #ccc;
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
                    margin-left: 4px;
                    margin-right: 4px;
                    color: #4a86e8;
                    font-weight: bold;
                }
                .feedback-container {
                    margin-top: 20px;
                    padding: 15px;
                    border: 1px solid #ced4da;
                    border-radius: 5px;
                    background-color: #f1f1f1;
                }
                .feedback-container img {
                    width: 50px;
                    height: 50px;
                    border-radius: 50%;
                    margin-right: 15px;
                }
                .feedback-content {
                    flex: 1;
                }
                .feedback-content strong {
                    display: block;
                    margin-bottom: 10px;
                    font-size: 16px;
                    color: #333;
                }
                .feedback-content p {
                    margin: 0;
                    font-size: 14px;
                    color: #555;
                }
                .not_selected_classblock{
                    background-color: rgba(255, 99, 71, 0.5);
                }
                .content-box {
                    max-width: 100%;
                    overflow-x: auto;
                }

                table {
                    min-width: 100%;
                    table-layout: fixed;
                }

                th, td {
                    min-width: 300px !important;
                    word-wrap: break-word;
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
                <div class="wrapper contents">
                    <div class="content-box">
                        <section id="page-content">
                            <div class="container">
                                <div class="status_check">
                                    <h5 style="color: #ffbf00">${error}</h5>
                                        <div class="status-box">
                                            <p style="color: #cccc00">${status}</p>
                                        </div>

                                    </div>

                                    <form id="slotForm" action="MentorRequest" method="post">
                                        <div class="row">
                                            <div class="content col-lg-9">
                                                <div class="row">
                                                    <div class="container">
                                                        <div class="row mb-5">
                                                            <div class="col-lg-6">
                                                                <!-- Các phần tử khác có thể được thêm vào đây -->
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="form-container">
                                                                    <table>
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="equal-width">Time Line</th>

                                                                                <c:if test="${status == '' || status != 'Approved' || status != 'Pending'  }">
                                                                                    <c:forEach var="day" items="${listDays}">
                                                                                        <th class="equal-width" value="${day.dateName}">${day.dateName} <br/> ${day.dateValue}</th>
                                                                                        </c:forEach>
                                                                                    </c:if>

                                                                                <c:if test="${status != '' || status == 'Approved' || status == 'Pending' }">
                                                                                    <c:forEach var="d" items="${listDayByCycle}">
                                                                                        <th class="equal-width" value="${d.dateName}">${d.dateName} <br/> ${d.dateValue}</th>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach var="slot" items="${listSlots}" varStatus="loop">
                                                                                <tr>
                                                                                    <td>${slot.slot_id}</td>
                                                                                    <c:forEach var="day" items="${listDays}">
                                                                                        <td>
                                                                                            <label class="slot">
                                                                                                <span class="slot-label">  

                                                                                                    <c:forEach items="${listSchedule}" var="listS"> 
                                                                                                        <c:if test="${listS.slotId eq slot.slot_id && listS.dayOfSlot eq day.dateValue}">
                                                                                                            <div class="slot-labels" data-slot-id="${listS.slotId}" data-day-of-slot="${listS.dayOfSlot}">
                                                                                                                <div class="class-block">
                                                                                                                    <div>FER202 </div>
                                                                                                                    <div class="view-materials">View Materials</div>
                                                                                                                    <div class="edu-next">EduNext</div>
                                                                                                                </div>
                                                                                                            </div>

                                                                                                        </c:if>
                                                                                                    </c:forEach>

                                                                                                    <input class="slot-checkbox" <c:forEach items="${listSchedule}" var="listS"> 
                                                                                                               <c:if test="${listS.slotId eq slot.slot_id && listS.dayOfSlot eq day.dateValue}">
                                                                                                                   checked
                                                                                                               </c:if>
                                                                                                           </c:forEach> type="checkbox" name="schedule" value="${slot.slot_id} ${day.dateValue}">
                                                                                                    <span class="select-text">SELECT</span>
                                                                                                </span>
                                                                                            </label>
                                                                                        </td>
                                                                                    </c:forEach>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                    <input type="hidden" id="action" name="action" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="note-container">
                                                            <h2>Note:</h2>
                                                            <ul>
                                                                <li>SLOT01:<span class="highlight"> 7:00 - 9:00 </span></li>
                                                                <li>SLOT02:<span class="highlight"> 9:00 - 11:00 </span></li>
                                                                <li>SLOT03:<span class="highlight"> 13:00 - 15:00 </span></li>
                                                                <li><span class="highlight">For selected slots</span>, clicking on the <span class="highlight">slot frame</span> will deselect that slot</li>
                                                                <li>SLOT04:<span class="highlight"> 15:00 - 17:00 </span></li>
                                                                <li>Your selection of week will select for <span class="highlight"> hole month </span></li>
                                                                <li>You cannot booking a schedule on <span class="highlight"> Saturday </span> and <span class="highlight"> Sunday </span></li>
                                                                <li>You can <span class="highlight"> Update </span> your schedule when status is <span class="highlight"> Pending </span></li>
                                                                    <c:if test="${status eq 'Approved'}">
                                                                    <li>You will available to booking schedule at<span class="highlight"> ${avaiableBookingDate} </span></li>
                                                                    </c:if>
                                                            </ul>
                                                        </div>  
                                                        <div class="feedback-container">
                                                            <img src="path/to/admin-avatar.jpg" alt="Admin Avatar">
                                                            <div class="feedback-content">
                                                                <strong>Feedback From Manager:</strong>
                                                                <p>${rejectMessage}</p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row mt-5">
                                                <div class="col" style="display: flex;
                                                justify-content: end;">
                                                <button type="submit" <c:if test="${status eq 'Pending' || status eq 'Approved'}">disabled</c:if> style="margin: 0px 5px" id="sendButton" class="btn btn-primary">Send Request</button>
                                                    <button type="submit" <c:if test="${status eq 'Pending' || status eq 'Approved'}">disabled</c:if> id="saveButton" class="btn btn-primary">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    </form>
                            </div>
                            </section>
                        </div>
                    </div>
                </main>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const slots = document.querySelectorAll('.slot-label');
                        slots.forEach(slot => {
                            const classBlock = slot.querySelector('.class-block');
                            const selectText = slot.querySelector('.select-text');
                            if (classBlock) {
                                if (selectText) {
                                    selectText.style.display = 'none';
                                }

                            }
                        });
                    });
                </script>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {

                        const slots = document.querySelectorAll('.slot');
                        const class_block = document.querySelectorAll('.class-block');
                        class_block.forEach((cl_bl) => {
                            cl_bl.addEventListener("click", function () {
                                cl_bl.classList.toggle('not_selected_classblock');
                            });
                        });
                        const colors = ['#e6f3ff', '#e6f3ff', '#e6f3ff', '#e6f3ff'];

                        slots.forEach((slot, index) => {
                            const checkbox = slot.querySelector('.slot-checkbox');
                            const label = slot.querySelector('.slot-label');
                            const slotIndex = index % 4;

                            checkbox.addEventListener('change', function () {
                                if (checkbox.checked) {
                                    label.style.backgroundColor = colors[slotIndex];
                                } else {
                                    label.style.backgroundColor = '#fff';
                                }
                            });
                        });
                    });
                </script>
                <script>
                    document.addEventListener("DOMContentLoaded", function (e) {
                        e.preventDefault();
                        var action = document.getElementById("action");
                        var sendButton = document.getElementById("sendButton");
                        var saveButton = document.getElementById("saveButton");

                        sendButton.addEventListener('click', function () {
                            action.value = 'send';
                        });

                        saveButton.addEventListener('click', function () {
                            action.value = 'save';
                        })

                        console.log(action.value);
                    })
                </script>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var error = "${error}";
                        var notifyBtn = document.getElementById("notify_btn");

                        if (error && error.trim() !== "") {
                            notifyBtn.disabled = true;
                        } else {
                            notifyBtn.disabled = false;
                        }
                    });
            </script>


        </body>

    </html>

