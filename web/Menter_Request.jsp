
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
                    max-width: 1000px;
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
                    border-collapse: collapse;
                    width: 80%;
                    margin: 20px 0;
                }

                th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: center;
                }

                th {
                    background-color: #8B0000;
                    color: white;
                }

                th.equal-width {
                    width: 100%; /* hoặc một giá trị khác tùy theo bạn muốn */
                }


                .slot {
                    display: block;
                    text-align: center;
                    padding: 10px;
                    cursor: pointer;
                }

                .slot-checkbox {
                    display: none;
                }

                .slot-label {
                    display: inline-block;
                    padding: 5px 10px;
                    background-color: #f0f0f0;
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
                table {
                    width: 100%;
                    table-layout: fixed;
                }

                th, td {
                    width: 20%;
                    padding: 8px;
                    text-align: center;
                }
                #notify_btn{
                    margin-right: 12px;
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
                                        <c:if test="${status != ''}">
                                            <div class="status-box">
                                                <p style="color: #cccc00">${status}</p>
                                            </div>
                                        </c:if>
                                        <c:if test="${status == ''}">
                                            <div class="status-box">
                                                <p style="color: #cccc00">Selected</p>
                                            </div>
                                        </c:if>
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
                                                                                    <c:forEach var="day" items="${listDays}">
                                                                                    <th class="equal-width" value="${day.dateName}">${day.dateName} <br/> ${day.dateValue}</th>
                                                                                    </c:forEach>
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
                                                                                                            <divclass="slot-label" data-slot-id="${listS.slotId}" data-day-of-slot="${listS.dayOfSlot}">oke</div>

                                                                                                        </c:if>
                                                                                                    </c:forEach>

                                                                                                    <input class="slot-checkbox" <c:forEach items="${listSchedule}" var="listS"> 
                                                                                                               <c:if test="${listS.slotId eq slot.slot_id && listS.dayOfSlot eq day.dateValue}">
                                                                                                                   checked
                                                                                                               </c:if>
                                                                                                           </c:forEach> type="checkbox" name="schedule" value="${slot.slot_id} ${day.dateValue}">
                                                                                                    SELECT
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
                                                    </div>
                                                </div>
                                                <div class="row mt-5">
                                                    <div class="col" style="display: flex;
                                                    justify-content: end;">
                                                    <button type="submit" <c:if test="${isSend eq '1'}">disabled</c:if> style="margin: 0px 5px" id="sendButton" class="btn btn-primary">Send Request</button>
                                                        <button type="submit" <c:if test="${isSend eq '1'}">disabled</c:if> id="saveButton" class="btn btn-primary">Save</button>
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
                            const slots = document.querySelectorAll('.slot');
                            const colors = ['#8BC34A', '#64B5F6', '#FFB74D', '#EC407A'];

                            slots.forEach((slot, index) => {
                                const checkbox = slot.querySelector('.slot-checkbox');
                                const label = slot.querySelector('.slot-label');
                                const slotIndex = index % 4;

                                checkbox.addEventListener('change', function () {
                                    if (checkbox.checked) {
                                        label.style.backgroundColor = colors[slotIndex];
                                    } else {
                                        label.style.backgroundColor = '#f0f0f0';
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
                            })

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
                                notifyBtn.disabled = false;
                            } else {
                                notifyBtn.disabled = false;
                            }
                        });
                </script>
                <script>
const slotLabels = document.querySelectorAll('.slot-label');

const okeSlots = Array.from(slotLabels).filter(slot => 
    slot.textContent.includes('oke')
);

okeSlots.forEach(slot => {
    const newDiv = document.createElement('div');
    newDiv.style.backgroundColor = '#e6f3ff';
    newDiv.style.padding = '5px';
    newDiv.style.marginRight = '-10px';
    newDiv.style.borderRadius = '5px';
    newDiv.style.fontSize = '15px';
    newDiv.style.textAlign = 'left';

    newDiv.innerHTML = `
        <div style="font-weight: bold; color: #FF9900;">SWR302</div>
        <div style="color: #006600;">View Materials</div>
        <div>at BE-209</div>
    `;

    slot.innerHTML = '';
    slot.appendChild(newDiv);
    
    slot.style = '';
});
                </script>

            </body>

        </html>

