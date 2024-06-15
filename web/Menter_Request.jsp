
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
        <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
        <link href='plugins/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            .calendar {
                max-width: 600px;
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
                    max-width: 800px;
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
                    background-color: #007bff;
                    color: white;
                }

                th.equal-width {
                    width: 100%; /* hoặc một giá trị khác tùy theo bạn muốn */
                }


                .slot {
                    background-color: #f9f9f9;
                    padding: 10px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                .slot.selected {
                    background-color: #1a5218;
                    color: white;
                }

                .form-container {
                    text-align: center;
                }

                .form-container button {
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                .form-container button:hover {
                    background-color: #0056b3;
                }

                .status-box {
                    position: absolute;
                    top: 20px;
                    right: 20px;
                    padding: 10px;
                    background-color: #f8f9fa;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                }
                .highlighted {
                    background-color: #d1e7dd;
                }
            </style>
        </head>

        <body>
            <jsp:include page="header.jsp" />
            <section id="page-title">
                <div class="container">
                    <div class="page-title">
                        <h1>Mentor Request</h1>
                    </div>
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="home.jsp">Home</a> </li>
                            <li class="active"><a href="Menter_Request.jsp">Mentor Request</a> </li>
                        </ul>
                    </div>
                </div>
            </section>
            <div class="wrapper">
                <div class="content-box">
                    <div class="">
                        <section id="page-content">
                            <div class="container">
                                <div>
                                    <h5 style="color: #ffbf00">${error}</h5>
                                    </div>
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
                                    <form id="slotForm" action="MentorRequest" method="post">
                                        <div class="row">
                                            <!-- content -->
                                            <div class="content col-lg-9">
                                                <!-- form -->
                                                <div class="row">
                                                    <div class="container">
                                                        <!-- Calendar -->
                                                        <div class="row mb-5">
                                                            <div class="col-lg-6">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12">

                                                                <div class="form-container">
                                                                    <table border="1" width="100%">
                                                                        <tr>
                                                                            <th rowspan="2">
                                                                                WEEK
                                                                                <select>
                                                                                    <option>10/6 To 16/6</option>
                                                                                    <option>17/6 To 23/6</option>
                                                                                    <option>24/6 To 30/6</option>
                                                                                    <option>31/6 To 7/7</option>
                                                                                </select>
                                                                            </th>
                                                                            <c:forEach var="day" items="${listDays}">
                                                                                <th class="equal-width">${day.dateName}</th>
                                                                            </c:forEach>
                                                                        </tr>
                                                                        <tr>
                                                                            <c:forEach var="day" items="${listDays}">
                                                                                <th class="equal-width">${day.dateValue}</th>
                                                                                </c:forEach>
                                                                        </tr>
                                                                        <c:forEach var="slot" items="${listSlots}" varStatus="loop">
                                                                            <tr>
                                                                                <td>${slot.slot_id}</td>
                                                                                <c:forEach var="day" items="${listDays}">
                                                                                    <td></td>
                                                                                </c:forEach>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </table>            

                                                                    <input type="hidden" id="selectedSlots" name="selectedSlots" value="">

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- end: Calendar -->
                                                    </div>

                                                </div>
                                                <div class="row mt-5">
                                                    <div class="col" style="display: flex;
                                                    justify-content: end">

                                                        <c:if test="${status == 'Pending'}">
                                                            <button type="submit" id="notify_btn_Update" class="btn btn-primary">Update</button>
                                                        </c:if>
                                                        <c:if test="${status != 'Pending'}">
                                                            <button type="submit" id="notify_btn" class="btn btn-primary">Send Request</button>
                                                        </c:if>
                                                        <button type="reset" class="btn btn-primary">Reset</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
                <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
                <!--Plugins-->
                <script src="js/jquery.js"></script>
                <script src="js/plugins.js"></script>
                <script src="js/functions.js"></script>
                <script src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
                <script src='plugins/moment/moment.min.js'></script>
                <script src='plugins/fullcalendar/fullcalendar.min.js'></script>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const checkboxes = document.querySelectorAll('.slot-checkbox');
                        const statusText = document.getElementById('status-text');

                        checkboxes.forEach(checkbox => {
                            checkbox.addEventListener('change', function () {
                                if (checkbox.checked) {
                                    checkbox.parentElement.classList.add('highlighted');
                                } else {
                                    checkbox.parentElement.classList.remove('highlighted');
                                }

                                const selected = document.querySelectorAll('.slot-checkbox:checked');
                                statusText.textContent = `${selected.length} slots selected`;
                            });
                        });
                    });
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
                    document.querySelectorAll('.btn.btn-light').forEach(function (label) {
                        label.addEventListener('click', function () {
                            const checkbox = this.querySelector('input[type="checkbox"]');
                            this.classList.toggle('active');
                            checkbox.remove();
                        });
                    });
                </script>


            </body>

        </html>

