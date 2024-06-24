s<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>List Request Manager</title>
        <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            .table {
                margin-bottom: 0;
            }

            .table th,
            .table td {
                vertical-align: middle;
            }

            .badge {
                margin-right: 5px;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }

            .modal-content {
                background-color: #fefefe;
                top:15%;
                left: 25%;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .calendar {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                max-width: 300px;
                margin: 0 auto;
            }

            .calendar-header {
                background-color: #f5f5f5;
                padding: 10px;
                border-bottom: 1px solid #ddd;
                text-align: center;
            }

            .calendar-date {
                font-weight: bold;
            }

            .calendar-body {
                padding: 10px;
            }

            .calendar-day {
                margin-bottom: 10px;
            }

            .day-label {
                font-weight: bold;
                font-size: 14px;
                color: #333;
            }

            .day-date {
                font-size: 12px;
                color: #666;
                margin-bottom: 5px;
            }

            .time-slots {
                display: flex;
                flex-wrap: wrap;
            }

            .time-slot {
                background-color: #f5f5f5;
                border: 1px solid #ddd;
                border-radius: 3px;
                padding: 5px 10px;
                margin-right: 5px;
                margin-bottom: 5px;
            }

            .slot-time {
                font-size: 12px;
                color: #333;
            }
            #modalMentorName, #modalStartDate, #modalEndDate {
                display: inline-block;
                margin-right: 10px;
                font-weight: bold;
                color: #333;
            }

            #modalDetails {
                max-width: 800px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                padding: 20px;
            }

            #modalMentorName, #modalStartDate, #modalEndDate {
                background: linear-gradient(135deg, #7e57c2, #ab47bc);
                color: #fff;
                padding: 10px;
                text-align: center;
                text-transform: uppercase;
                letter-spacing: 2px;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            p {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            p:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            p strong {
                font-weight: bold;
                color: #7e57c2;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .btn-sm {
                margin-left: 5px;
                padding: 5px 10px;
                font-size: 12px;
            }
            .btn-info {
                background-color: #17a2b8;
                border-color: #17a2b8;
                color: white;
            }
            .btn-info:hover {
                background-color: #138496;
                border-color: #117a8b;
            }
            .form-container {
                max-width: 100%;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            .form-container table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 5px;
                background-color: #f8f9fa;
            }

            .form-container th {
                background-color: #e9ecef;
                padding: 10px;
                text-align: center;
                font-weight: bold;
            }

            .form-container td {
                background-color: white;
                padding: 0;
                height: 80px;
                vertical-align: top;
                border: 1px solid #dee2e6;
            }

            .form-container td:first-child {
                background-color: #e9ecef;
                font-weight: bold;
                text-align: center;
                vertical-align: middle;
            }

            .form-container td > div {
                background-color: #e6f3ff;
                margin: 5px;
                padding: 5px;
                border-radius: 5px;
                height: calc(100% - 10px);
                font-size: 14px;
            }

            .form-container td > div > div:first-child {
                font-weight: bold;
                color: #0056b3;
            }

            .form-container td > div > div:nth-child(2) {
                color: #28a745;
            }

            .form-container td > div > div:nth-child(3) {
                color: #6c757d;
            }

            .form-container select {
                width: 100%;
                padding: 5px;
                margin-top: 5px;
            }
        </style>
    </head>

    <body>
        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <jsp:include page="header_Manager.jsp" />
                <!-- Main Content -->
                <div class="main-content">
                    <section class="section">
                        <ul class="breadcrumb breadcrumb-style ">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Homes</h4>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="Homes_manager.jsp">
                                    <i class="fas fa-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">Schedule</li>

                        </ul>
                        <div class="section-body">
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>List Schedule Mentor</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table mb-0 table-borderless">
                                                    <thead>
                                                        <tr class="userDatatable-header">
                                                            <th><span class="userDatatable-title">User Name</span></th>
                                                            <th><span class="userDatatable-title">Deadline</span></th>
                                                            <th><span class="userDatatable-title">Status</span></th>
                                                            <th><span class="userDatatable-title">Message</span></th>
                                                            <th><span class="userDatatable-title">Action</span></th>
                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="schedule" items="${list}">
                                                            <tr>
                                                                <td><div class="userDatatable-content">${schedule.mentorName}</div></td>
                                                                <td><div class="userDatatable-content">${schedule.deadline}</div></td>
                                                                <td><div class="userDatatable-content">${schedule.status}</div></td>
                                                                <td><div class="userDatatable-content">
                                                                        <input type="text" name="message"/>
                                                                    </div></td>
                                                                <td> 
                                                                    <div class="btn-group">
                                                                        <button class="btn btn-info btn-sm" onclick="openModal('${schedule.mentorName}')">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <form action="HandleSlotMentor" method="post">
                                                                            <input type="hidden" name="mentorName" value="${schedule.mentorName}" />
                                                                            <c:if test="${not empty schedule.list}">
                                                                                <input type="hidden" name="cycleID" value="${schedule.cycleId}" />
                                                                            </c:if>
                                                                            <button type="submit" name="action" value="2" class="btn btn-success btn-sm">
                                                                                <i class="fas fa-check"></i>
                                                                            </button>
                                                                            <button type="submit" name="action" value="3" class="btn btn-danger btn-sm">
                                                                                <i class="fas fa-times"></i>
                                                                            </button>
                                                                            <c:if test="${param.action == '3'}">
                                                                                <textarea name="rejectReason" placeholder="Enter reason for rejection" class="reject-reason-textarea"></textarea>
                                                                            </c:if>
                                                                        </form>
                                                                    </div>


                                                                    <div id="modal-${schedule.mentorName}" class="modal">
                                                                        <div class="modal-content">
                                                                            <span class="close" onclick="closeModal('${schedule.mentorName}')">&times;</span>
                                                                            <h2>Schedule Details</h2>
                                                                            <p><strong>Mentor Name:</strong> <span id="modalMentorName">${schedule.mentorName}</span></p>
                                                                            <p><strong>Start Time:</strong> <span id="modalMentorName">${schedule.startTime}</span></p>
                                                                            <p><strong>End Time:</strong> <span id="modalMentorName">${schedule.endTime}</span></p>
                                                                            <p><strong>Details Schedule</strong>
                                                                            <div class="form-container">
                                                                                <table border="1" width="100%">
                                                                                    <tr class="over">
                                                                                        <th rowspan="2">
                                                                                            <label for="week">Month</label>
                                                                                            <select id="week"></select>
                                                                                        </th>
                                                                                        <th>Monday</th>
                                                                                        <th>Tuesday</th>
                                                                                        <th>Wednesday</th>
                                                                                        <th>Thursday</th>
                                                                                        <th>Friday</th>
                                                                                        <th>Saturday</th>
                                                                                        <th>Sunday</th>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <c:forEach items="${listDays}" var="day">
                                                                                            <c:if test="${day.cycle == 1}">
                                                                                                <td>${day.dateValue}</td>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </tr>
                                                                                    <c:forEach items="${listSlot}" var="slot">
                                                                                        <tr>
                                                                                            <td>${slot.slot_id}</td>
                                                                                            <c:forEach items="${listDay}" var="day">
                                                                                                <c:set var="found" value="false"/>

                                                                                                <c:forEach items="${schedule.list}" var="listS">

                                                                                                    <c:if test="${listS.slotId == slot.slot_id && listS.weekName == day}">
                                                                                                        <td class="Book">Booked</td>
                                                                                                        <c:set var="found" value="true"/>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                                <c:if test="${not found}">
                                                                                                    <td></td>
                                                                                                </c:if>
                                                                                            </c:forEach>

                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </table>           

                                                                                <input type="hidden" id="selectedSlots" name="selectedSlots" value="">

                                                                            </div>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Dialog -->

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
        <script src="assetss/js/app.min.js"></script>
        <script src="assetss/bundles/jquery-validation/dist/jquery.validate.min.js"></script>
        <!-- JS Libraies -->
        <script src="assetss/bundles/jquery-steps/jquery.steps.min.js"></script>
        <!-- Page Specific JS File -->
        <script src="assetss/js/page/form-wizard.js"></script>
        <!-- Template JS File -->
        <script src="assetss/js/scripts.js"></script>
        <!-- Custom JS File -->
        <script src="assetss/js/custom.js"></script>
        <script>
                                                                                function getMonday(d) {
                                                                                    d = new Date('2024-06-24');
                                                                                    var day = d.getDay(),
                                                                                            diff = d.getDate() - day + (day == 0 ? -6 : 1);
                                                                                    return new Date(d.setDate(diff));
                                                                                }

                                                                                function formatDate(date) {
                                                                                    return (
                                                                                            date.getDate().toString().padStart(2, "0")

                                                                                            +
                                                                                            "-" +
                                                                                            (date.getMonth() + 1).toString().padStart(2, "0") +
                                                                                            "-" +
                                                                                            date.getFullYear().toString().padStart(4, "0")
                                                                                            );
                                                                                }

                                                                                function getWeekOptions() {
                                                                                    const startDate = new Date('2024-06-24');
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

                                                                                const weekSelect = document.getElementById("week");
                                                                                const weekOptions = getWeekOptions();
                                                                                weekOptions.forEach((option) => {
                                                                                    const optionElement = document.createElement("option");
                                                                                    optionElement.value = option.value;
                                                                                    optionElement.textContent = option.text;
                                                                                    weekSelect.appendChild(optionElement);
                                                                                });
                                                                                function openModal(userName) {
                                                                                    document.getElementById('modal-' + userName).style.display = 'block';
                                                                                    const bookedSlots = Array.from(document.querySelectorAll('td.Book'));
                                                                                    bookedSlots.forEach(slot => {
                                                                                        const newDiv = document.createElement('div');
                                                                                        newDiv.innerHTML = `
                                                                                                <div>SWR302</div>
                                                                                                <div>View Materials</div>
                                                                                                <div>at BE-209</div>
                                                                                            `;
                                                                                        slot.innerHTML = '';
                                                                                        slot.appendChild(newDiv);
                                                                                        slot.classList.remove('Book');
                                                                                    });
                                                                                }

                                                                                function closeModal(userName) {
                                                                                    document.getElementById('modal-' + userName).style.display = 'none';
                                                                                }
                                                                                document.addEventListener('DOMContentLoaded', (e) => {

                                                                                    const editButtons = document.querySelectorAll('.edit');
                                                                                    editButtons.forEach(button => {
                                                                                        button.addEventListener('click', function (event) {
                                                                                            event.preventDefault();
                                                                                            const cvId = this.id.split('_')[1];
                                                                                            const note = document.getElementById('note_' + cvId);
                                                                                            const noteInput = document.getElementById('note_Input_' + cvId);
                                                                                            const status = document.getElementById('status_' + cvId);
                                                                                            status.value = 2;
                                                                                            noteInput.value = note.value;
                                                                                            const form = document.getElementById('form_' + cvId);
                                                                                            form.action = 'changeStatus?cvId=' + cvId + '&status=2&note=' + note;
                                                                                            form.method = 'get';
                                                                                            form.submit();
                                                                                        });
                                                                                    });
                                                                                    const rejectButtons = document.querySelectorAll('.reject');
                                                                                    rejectButtons.forEach(button => {
                                                                                        button.addEventListener('click', function (event) {
                                                                                            event.preventDefault();
                                                                                            const cvId = this.id.split('_')[1];
                                                                                            const note = document.getElementById('note_' + cvId);
                                                                                            const noteInput = document.getElementById('note_Input_' + cvId);
                                                                                            const status = document.getElementById('status_' + cvId);
                                                                                            status.value = 3;
                                                                                            noteInput.value = note.value;
                                                                                            const form = document.getElementById('form_' + cvId);
                                                                                            form.action = 'changeStatus?cvId=' + cvId + '&status=3&note=' + note;
                                                                                            form.method = 'get';
                                                                                            form.submit();
                                                                                        });
                                                                                    });
                                                                                });

        </script>
    </body>

</html>