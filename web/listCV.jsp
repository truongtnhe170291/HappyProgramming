
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
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                top: 25%;
                left: 40%;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .close {
                transform: translate(95%, -5%);
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

            /* Style for the popup container */
            .popup {
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

            /* Style for the popup content */
            .popup-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-height: 80%;
                overflow-y: auto;
                /* Enable vertical scrolling */
            }

            /* Close button style */
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

            .note-section {
                border: 2px solid #007bff;
                background-color: #e9f7fd;
                padding: 10px;
                margin-top: 10px;
            }

            .note-section strong {
                color: #007bff;
            }
        </style>
</head>

<body>
    <div class="loader"></div>
    <div id="app">
        <div class="main-wrapper main-wrapper-1">

            <jsp:include page="header_Manager.jsp" />

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
                                    <input class="form-control" type="search" placeholder="Search" aria-label="Search"
                                        data-width="200">
                                    <button class="btn" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
                <ul class="navbar-nav navbar-right">

                        </ul>
                      
                    </li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"
                            class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image"
                                src="assetss/img/user.png" class="user-img-radious-style"> <span
                                class="d-sm-none d-lg-inline-block"></span></a>
                        <div class="dropdown-menu dropdown-menu-right pullDown">
                            <div class="dropdown-title">Hello Manager</div>
                            <a href="logoutManager" class="dropdown-item has-icon text-danger"> <i
                                    class="fas fa-sign-out-alt"></i>
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
                            <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                    data-feather="layout"></i><span>Management</span></a>
                            <ul class="dropdown-menu">
                                <li><a class="nav-link" href="listCV">List CV</a></li>

                                <li><a class="nav-link" href="skills">List Skills</a></li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                    data-feather="layout"></i><span>Schedule Management</span></a>
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
                                    <form method="get" action="listCV">
                                        <label for="statusFilter">Filter by Status:</label>
                                        <select name="statusFilter" id="statusFilter">
                                            <option value="" ${empty param.statusFilter ? 'selected' : '' }>All</option>
                                            <c:forEach items="${statusList}" var="status">
                                                <option value="${status.statusId}" ${param.statusFilter==status.statusId
                                                    ? 'selected' : '' }>
                                                    ${status.statusName}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <button type="submit">Filter</button>
                                    </form>
                                    <div class="card-header">
                                        <h4>List CV Mentor</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>NO</th>
                                                        <th>Mentor</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cvList}" var="cv">
                                                        <tr>
                                                            <td>${cv.cvId}</td>
                                                            <td>${cv.fullName}</td>

                                                           
                                                            <td>${cv.status.statusName}</td>
                                                            <td>
                                                                <button class="btn btn-info btn-sm">
                                                                    <i class="fas fa-eye"></i>
                                                                    <div id="requestDetailsPopup_${cv.cvId}"
                                                                        class="popup">
                                                                        <div class="popup-content">
                                                                            <span class="close">&times;</span>
                                                                            <h2>CV Details</h2>
                                                                            <p><strong>Mentor Name:</strong> <span
                                                                                    id="popupMentorName_${cv.cvId}">${cv.userName}</span>
                                                                            </p>
                                                                            <p><strong>Email:</strong> <span
                                                                                    id="popupEmail_${cv.cvId}">${cv.gmail}</span>
                                                                            </p>
                                                                            <p><strong>Full name:</strong> <span
                                                                                    id="popupFullName_${cv.cvId}">${cv.fullName}</span>
                                                                            </p>
                                                                            <p><strong>DoB:</strong> <span
                                                                                    id="popupDoB_${cv.cvId}">${cv.dob}</span>
                                                                            </p>
                                                                            <p><strong>Gender:</strong> <span
                                                                                    id="popupGender_${cv.cvId}">${cv.sex
                                                                                    ? "Male" : "Female"}</span></p>
                                                                            <p><strong>Address:</strong> <span
                                                                                    id="popupAddress_${cv.cvId}">${cv.address}</span>
                                                                            </p>
                                                                            <p><strong>Profession:</strong> <span
                                                                                    id="popupProfession_${cv.cvId}">${cv.profession}</span>
                                                                            </p>
                                                                            <p><strong>Profession Introduction:</strong>
                                                                                <span
                                                                                    id="popupProfessionIntro_${cv.cvId}">${cv.professionIntro}</span>
                                                                            </p>
                                                                            <p><strong>Achievement Description:</strong>
                                                                                <span
                                                                                    id="popupAchievementDescription_${cv.cvId}">${cv.achievementDescription}</span>
                                                                            </p>
                                                                            <p><strong>Service Description:</strong>
                                                                                <span
                                                                                    id="popupServiceDescription_${cv.cvId}">${cv.serviceDescription}</span>
                                                                            </p>
                                                                            <p><strong>Skills:</strong>
                                                                                <span id="popupSkills_${cv.cvId}">
                                                                                    <c:forEach items="${cv.listSkill}"
                                                                                        var="skill">
                                                                                        <p>${skill.skillName}</p>
                                                                                    </c:forEach>
                                                                                </span>
                                                                            </p>

                                                                            <c:if test="${not empty cv.note}">
                                                                                <div class="note-section">
                                                                                    <strong>Note:</strong>
                                                                                    <p>${cv.note}</p>
                                                                                </div>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                                <c:if test="${cv.status.statusId == 1}">
                                                                    <button id="edit_${cv.cvId}"
                                                                        class="edit btn btn-success btn-sm"><i
                                                                            class="fas fa-check"></i></button>
                                                                    <button id="reject_${cv.cvId}"
                                                                        class="reject btn btn-danger btn-sm"
                                                                        data-cv-id="${cv.cvId}">
                                                                        <i class="fas fa-times"></i></button>
                                                                </c:if>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Popup for note input -->
                                    <div id="notePopup" class="popup">
                                        <div class="popup-content">
                                            <span class="close">&times;</span>
                                            <h2>Reject CV</h2>
                                            <form id="noteForm" method="get" action="changeStatus">
                                                <input type="hidden" name="cvId" id="popupCvId" value="" />
                                                <input type="hidden" name="status" value="3" />
                                                <label for="popupNote">Note:</label>
                                                <input type="text" name="note" id="popupNote" required />
                                                <button type="submit" class="btn btn-danger">Submit</button>
                                            </form>
                                        </div>
                                    </div>



                                    <div>
                                        <c:if test="${currentPage > 1}">
                                            <a
                                                href="listCV?page=${currentPage - 1}&statusFilter=${statusFilter}">Previous</a>
                                        </c:if>
                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                            <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <span>${i}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="listCV?page=${i}&statusFilter=${statusFilter}">${i}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <a
                                                href="listCV?page=${currentPage + 1}&statusFilter=${statusFilter}">Next</a>
                                        </c:if>
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
                                        <input type="radio" name="value" value="1"
                                            class="selectgroup-input-radio select-layout" checked>
                                        <span class="selectgroup-button">Light</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="value" value="2"
                                            class="selectgroup-input-radio select-layout">
                                        <span class="selectgroup-button">Dark</span>
                                    </label>
                                </div>
                            </div>
                            <div class="p-15 border-bottom">
                                <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                <div class="selectgroup selectgroup-pills sidebar-color">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="icon-input" value="1"
                                            class="selectgroup-input select-sidebar">
                                        <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                            data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="icon-input" value="2"
                                            class="selectgroup-input select-sidebar" checked>
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
                    const popup = this.parentElement.querySelector('.popup');
                    popup.style.display = 'block';
                });
            });

            const closeButtons = document.querySelectorAll('.close');
            closeButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    const popup = this.closest('.popup');
                    popup.style.display = 'none';
                });
            });

            window.onclick = function (event) {
                if (event.target.classList.contains('popup')) {
                    event.target.style.display = 'none';
                }
            };

            const editButtons = document.querySelectorAll('.edit');
            editButtons.forEach(button => {
                button.addEventListener('click', function (event) {
                    event.preventDefault();
                    const cvId = this.id.split('_')[1];
                    const form = document.createElement('form');
                    form.method = 'get';
                    form.action = 'changeStatus';
                    const cvIdInput = document.createElement('input');
                    cvIdInput.type = 'hidden';
                    cvIdInput.name = 'cvId';
                    cvIdInput.value = cvId;
                    form.appendChild(cvIdInput);
                    const statusInput = document.createElement('input');
                    statusInput.type = 'hidden';
                    statusInput.name = 'status';
                    statusInput.value = '2';
                    form.appendChild(statusInput);
                    document.body.appendChild(form);
                    form.submit();
                });
            });

            const rejectButtons = document.querySelectorAll('.reject');
            rejectButtons.forEach(button => {
                button.addEventListener('click', function (event) {
                    event.preventDefault();
                    const cvId = this.getAttribute('data-cv-id');
                    const popup = document.getElementById('notePopup');
                    const popupCvId = document.getElementById('popupCvId');
                    popupCvId.value = cvId;
                    popup.style.display = 'block';
                });
            });

            // Validate and submit the form
            const noteForm = document.getElementById('noteForm');
            noteForm.addEventListener('submit', function (event) {
                const popupNote = document.getElementById('popupNote');
                if (popupNote.value.trim() === "") {
                    event.preventDefault();
                    alert("Please enter a note.");
                }
            });
        });



    </script>
</body>

</html>