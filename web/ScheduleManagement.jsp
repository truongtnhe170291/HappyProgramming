<!DOCTYPE html>
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
                top:25%;
                left: 40%;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
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

        </style>
    </head>

    <body>
        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <div class="navbar-bg"></div>
                <nav class="navbar navbar-expand-lg main-navbar sticky">
                    <div class="form-inline mr-auto">
                        <ul class="navbar-nav mr-3">
                            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
                                   collapse-btn"> <i data-feather="align-justify"></i></a></li>
                            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                                    <i data-feather="maximize"></i>
                                </a></li>
                            <li>
                                <form class="form-inline mr-auto">
                                    <div class="search-element">
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                                        <button class="btn" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <ul class="navbar-nav navbar-right">

                        <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                                                                     class="nav-link notification-toggle nav-link-lg"><i data-feather="bell" class="bell"></i>
                            </a>
                            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                                <div class="dropdown-header">
                                    Notifications
                                    <div class="float-right">
                                        <a href="#">Mark All As Read</a>
                                    </div>
                                </div>
                                <div class="dropdown-footer text-center">
                                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown"><a href="#" data-toggle="dropdown"
                                                class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="assetss/img/user.png"
                                                                                             class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
                            <div class="dropdown-menu dropdown-menu-right pullDown">
                                <div class="dropdown-title">Hello Sarah Smith</div>
                                <div class="dropdown-divider"></div>
                                <a href="auth-login.html" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">

                        <ul class="sidebar-menu">
                            <li class="menu-header">Main</li>
                            <li class="dropdown active">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                        data-feather="monitor"></i><span>Dashboard</span></a>
                                <ul class="dropdown-menu">
                                    <li class="active"><a class="nav-link" href="Homes_manager.jsp">Dashboard 1</a></li>
                                </ul>
                            </li>
                            <li class="menu-header">Request</li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>CV Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="listCV">List CV</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Schedule Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>
                                </ul>
                            </li>

                        </ul>
                    </aside>
                </div>
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
                                                            <th><span class="userDatatable-title">Action</span></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="schedule" items="${list}">
                                                            <tr>
                                                                <td><div class="userDatatable-content">${schedule.mentorName}</div></td>
                                                                <td><div class="userDatatable-content">${schedule.deadline}</div></td>
                                                                <td><div class="userDatatable-content">${schedule.status}</div></td>
                                                                <td> 
                                                                    <div class="btn-group">
                                                                        <button class="btn btn-info btn-sm" onclick="openModal('${schedule.mentorName}')">
                                                                            <i class="fas fa-eye"></i>
                                                                        </button>
                                                                        <form action="HandleSlotMentor" method="post">
                                                                            <input type="hidden" name="mentorName" value="${schedule.mentorName}" />
                                                                            <c:if test="${not empty schedule.list}">
                                                                                <input type="hidden" name="cycleID" value="${schedule.list[0].cycleID}" />
                                                                            </c:if>
                                                                            <button type="submit" name="action" value="2" class="btn btn-success btn-sm">
                                                                                <i class="fas fa-check"></i>
                                                                            </button>
                                                                            <button type="submit" name="action" value="3" class="btn btn-danger btn-sm">
                                                                                <i class="fas fa-times"></i>
                                                                            </button>
                                                                        </form>
                                                                    </div>

                                                                    <div id="modal-${schedule.mentorName}" class="modal">
                                                                        <div class="modal-content">
                                                                            <span class="close" onclick="closeModal('${schedule.mentorName}')">&times;</span>
                                                                            <h2>Schedule Details</h2>
                                                                            <p><strong>Mentor Name:</strong> <span id="modalMentorName">${schedule.mentorName}</span></p>
                                                                            <p><strong>Details Schedule</strong>
                                                                            <div class="form-container">
                                                                                <table border="1" width="100%">
                                                                                    <tr>
                                                                                        <th rowspan="2">
                                                                                            WEEK</br>
                                                                                            <select>
                                                                                                <option>10/6 To 16/6</option>
                                                                                                <option>17/6 To 23/6</option>
                                                                                                <option>24/6 To 30/6</option>
                                                                                                <option>31/6 To 7/7</option>
                                                                                            </select>
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
                                                                                                <c:set var="check" value="0"/>
                                                                                                <c:forEach items="${schedule.list}" var="listS">
                                                                                                    <c:if test="${listS.slotId == slot.slot_id && listS.weekName == day.dateValue}">
                                                                                                        <td>Booked</td>
                                                                                                        <c:set var="check" value="1"/>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                                <c:if test="${check == 0}">
                                                                                                    <td></td>
                                                                                                </c:if>  
                                                                                                <c:set var="check" value="1"/>

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

                                                                                function openModal(userName) {
                                                                                    document.getElementById('modal-' + userName).style.display = 'block';
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