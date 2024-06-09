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
                text-align: left;
                background-color: #fefefe;
                top:25%;
                left: 40%;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .close {
                transform: translate(95%,-5%);
                color: #aaa;
                float: right ;
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
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>NO</th>
                                                            <th>Mentor</th>
                                                            <th>Note</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.cvList}" var="cv">
                                                            <tr>
                                                                <td>${cv.cvId}</td>
                                                                <td>${cv.fullName}</td>
                                                                <td>
                                                                    <input id="note_${cv.cvId}" required name="note" value="" class="userDatatable-content--date" type="text" />
                                                                    <form id="form_${cv.cvId}">
                                                                        <input type="hidden" name="cvId" value="${cv.cvId}" />
                                                                        <input id="status_${cv.cvId}" type="hidden" name="status" value="" />
                                                                        <input id="note_Input_${cv.cvId}" type="hidden" name="note" value="" />
                                                                    </form>
                                                                </td>
                                                                <td>
                                                                    <button class="btn btn-info btn-sm">
                                                                        <i class="fas fa-eye"></i>
                                                                        <div id="requestDetailsModal" class="modal test">
                                                                            <div class="modal-content">
                                                                                <span class="close">&times;</span>
                                                                                <h2>CV Details</h2>
                                                                                <p><strong>Mentor Name:</strong> <span id="modalMentorName">${cv.userName}</span></p>
                                                                                <p><strong>Email:</strong> <span id="modalEmail">${cv.gmail}</span></p>
                                                                                <p><strong>Full name:</strong> <span id="modalFullName">${cv.fullName}</span></p>
                                                                                <p><strong>DoB:</strong> <span id="modalDoB">${cv.dob}</span></p>
                                                                                <p><strong>Gender:</strong> <span id="modalGender">${cv.sex ? "Male" : "Female"}</span></p>
                                                                                <p><strong>Address:</strong> <span id="modalDeadlineDate">${cv.address}</span></p>
                                                                                <p><strong>Profession:</strong> <span id="modalDeadlineDate">${cv.profession}</span></p>
                                                                                <p><strong>Profession Introduction:</strong> <span id="modalDeadlineDate">${cv.professionIntro}</span></p>
                                                                                <p><strong>Achievement Description:</strong> <span id="modalDeadlineDate">${cv.achievementDescription}</span></p>
                                                                                <p><strong>Service Description:</strong> <span id="modalDeadlineDate">${cv.serviceDescription}</span></p>
                                                                                <p>
                                                                                    <strong>Skills:</strong> 
                                                                                    <span id="modalDeadlineDate">
                                                                                        <c:forEach items="${cv.listSkill}" var="skill">
                                                                                            <p>${skill.skillName}</p>
                                                                                        </c:forEach>
                                                                                    </span>
                                                                                </p>

                                                                            </div>
                                                                        </div></button>

                                                                    <button id="edit_${cv.cvId}" class="edit btn btn-success btn-sm"><i class="fas fa-check"></i></button>
                                                                    <button id="edit_${cv.cvId}" class="reject btn btn-danger btn-sm"><i class="fas fa-times"></i></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        <!--                                                                            <div class="calendar">
                                                                                                                                        <div class="calendar-header">
                                                                                                                                            <span class="calendar-date">2024-06-03 - 2024-06-09</span>
                                                                                                                                        </div>
                                                                                                                                        <div class="calendar-body">
                                                                                                                                            <div class="calendar-day">
                                                                                                                                                <div class="day-label">abc</div>
                                                                                                                                                <div class="day-date">2024-06-05</div>
                                                                                                                                                <div class="time-slots">
                                                                                                                                                    <div class="time-slot">
                                                                                                                                                        <span class="slot-time">SLOT01: 7:00 - 9:00</span>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                    </div>-->
                                                        <!-- Add more rows here -->
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
         document.addEventListener('DOMContentLoaded', (e) => {
    const eyeIcons = document.querySelectorAll(".fas.fa-eye");
    eyeIcons.forEach(function (icon) {
        icon.addEventListener('click', function () {
            const modal = this.parentElement.querySelector('.modal');
            modal.style.display = 'block';
        });
    });

    const closeButtons = document.querySelectorAll('.close');
    closeButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            const modal = this.closest('.modal');
            modal.style.display = 'none';
        });
    });

    window.onclick = function (event) {
        if (event.target.classList.contains('modal')) {
            event.target.style.display = 'none';
        }
    };

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