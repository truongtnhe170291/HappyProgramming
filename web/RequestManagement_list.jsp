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
                background-color: #fefefe;
                top: 15%;
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

            #modalMentorName,
            #modalStartDate,
            #modalEndDate {
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

            #modalMentorName,
            #modalStartDate,
            #modalEndDate {
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

            .form-container td>div {
                background-color: #e6f3ff;
                margin: 5px;
                padding: 5px;
                border-radius: 5px;
                height: calc(100% - 10px);
                font-size: 14px;
            }

            .form-container td>div>div:first-child {
                font-weight: bold;
                color: #0056b3;
            }

            .form-container td>div>div:nth-child(2) {
                color: #28a745;
            }
            .modal {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 9999;
            }

            .modal-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .modal-footer {
                display: flex;
                justify-content: flex-end;
            }

            .btn-secondary, .btn-primary {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .btn-secondary {
                background-color: #6c757d;
                color: #fff;
                margin-right: 10px;
            }

            .btn-primary {
                background-color: #007bff;
                color: #fff;
            }

            .form-container td>div>div:nth-child(3) {
                color: #6c757d;
            }

            .form-container select {
                width: 100%;
                padding: 5px;
                margin-top: 5px;
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
            #rejectReasonModal{
                z-index: 9999 !important;
            }
            #rejectReason{
                display: none;
            }
            .action-btn {
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .btn-group {
                display: flex;
                gap: 8px;
            }
            .btn-info, .btn-danger{
                display: flex;
                justify-content: center;
                align-items: center;
                width: 30px !important;
                max-width: 30px;
                height: 30px !important;
                max-height: 30px;
                border-radius: 5px !important;
            }
            .V_o{
                margin-right: 4px;
            }
            .pagination {
                float:right;
                display: flex;
                justify-content: right;
                margin-top: 20px;
            }
            .pagination a, .pagination span {
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                background-color: #fff;
                border: 1px solid #ddd;
                margin: 0 4px;
            }
            .pagination span {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
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
                                            <!-- Form Search v� Filter -->
                                            <form method="get" action="HandleSlotMentor" class="mb-3">
                                                <div class="form-row">
                                                    </tr>
                                                    <div class="col-md-4">
                                                        <label for="statusFilter">Filter by Status:</label>
                                                        <select class="form-control" id="statusFilter" name="statusFilter">
                                                            <option value="" ${empty param.statusFilter ? 'selected' : '' }>
                                                                All</option>
                                                                <c:forEach items="${statusList}" var="status">
                                                                <option value="${status.statusId}"
                                                                        ${param.statusFilter==status.statusId ? 'selected' : ''
                                                                        }>
                                                                    ${status.statusName}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="mentorName">Search by Mentor Name:</label>
                                                        <input type="text" class="form-control" id="mentorName"
                                                               name="mentorName" value="${param.mentorName}">
                                                    </div>
                                                    <div class="col-md-2 mt-4">
                                                        <button type="submit" class="btn btn-primary">Search/Filter</button>
                                                    </div>
                                                </div>
                                            </form>

                                            <!-- Table to display schedule -->
                                            <div class="table-responsive">
                                                <table class="table mb-0 table-borderless">
                                                    <thead>
                                                        <tr class="userDatatable-header">
                                                            <th>
                                                                <span class="userDatatable-title">Title</span>
                                                            </th>
                                                            <th>
                                                                <span class="userDatatable-title">Mentor Name</span>
                                                            </th>
                                                            <th>
                                                                <span class="userDatatable-title">Deadline</span>
                                                            </th>
                                                            <th>
                                                                <span class="userDatatable-title">Status</span>
                                                            </th>
                                                            <th>
                                                                <span class="userDatatable-title">Actions</span>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="requestTableBody">
                                                        <c:forEach var="request" items="${requests}">
                                                            <tr class="request-row" data-status="${request.status.statusName}">
                                                                <td>${request.title}</td>
                                                                <td>${request.mentorName}</td>
                                                                <td>${request.deadlineHour} ${request.deadlineDate}</td>
                                                                <td>${request.status.statusName}</td>
                                                                
                                                                <td class="d-flex" style="margin-top:12px;">
                                                                    
                                                                    <c:if test="${request.isEnoughPay eq true}">
                                                                        <a href="PayForMentor?requestId=${request.requestId}">Money for mentor</a>
                                                                    </c:if>
                                                                        
                                                                    <a href="">View</a>   
                                                                            
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                    </div>

                                    <div>
                                        <c:if test="${totalPages > 1}">
                                            <ul class="pagination">
                                                <c:if test="${currentPage > 1}">
                                                    <li>
                                                        <a href="HandleSlotMentor?page=${currentPage - 1}&mentorName=${mentorName}&statusFilter=${statusFilter}&pageSize=${pageSize}">Previous</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                    <c:choose>
                                                        <c:when test="${i == currentPage}">
                                                            <li><span>${i}</span></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                            <li>
                                                                <a href="HandleSlotMentor?page=${i}&mentorName=${mentorName}&statusFilter=${statusFilter}&pageSize=${pageSize}">${i}</a>
                                                            </li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${currentPage < totalPages}">
                                                    <li>
                                                        <a href="HandleSlotMentor?page=${currentPage + 1}&mentorName=${mentorName}&statusFilter=${statusFilter}&pageSize=${pageSize}">Next</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </c:if>
                                    </div>









                                </div>
                            </div>

                            <div class="modal" id="rejectReasonModal${schedule.mentorName}${schedule.cycleId}" style="display: none;">
                                <div class="modal-content" style="width: 50%; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
                                    <div class="modal-header" style="display: flex; justify-content: space-between; align-items: center;">
                                        <h5 class="modal-title">Enter reason why reject</h5>
                                        <button type="button" onclick="closeRejectModal('${schedule.mentorName}${schedule.cycleId}')" style="background: none; border: none; font-size: 1.5rem;">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="modalRejectForm${schedule.mentorName}${schedule.cycleId}">
                                            <textarea id="modalRejectReason${schedule.mentorName}${schedule.cycleId}" name="notes" class="form-control" placeholder="Enter reason why reject..." required></textarea>
                                        </form>
                                    </div>
                                    <div class="modal-footer" style="display: flex; justify-content: flex-end;">
                                        <button type="button" onclick="closeRejectModal('${schedule.mentorName}${schedule.cycleId}')" class="btn-secondary">Close</button>
                                        <button type="button" onclick="submitRejectForm('${schedule.mentorName}${schedule.cycleId}')" class="btn-primary">Reject</button>
                                    </div>
                                </div>
                            </div>
                            <div class="settingSidebar">
                                <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                                </a>
                                <div class="settingSidebar-body ps-container ps-theme-default">
                                    <div class=" fade show active">
                                        <div class="setting-panel-header">Setting Panel
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
                                            function openRejectModal(mentorCycleId) {
                                                document.getElementById(`rejectReasonModal${mentorCycleId}`).style.display = 'block';
                                            }

                                            function closeRejectModal(mentorCycleId) {
                                                document.getElementById(`rejectReasonModal${mentorCycleId}`).style.display = 'none';
                                            }

                                            function submitRejectForm(mentorCycleId) {
                                                const reasonInput = document.getElementById(`modalRejectReason${mentorCycleId}`);
                                                const reason = reasonInput.value.trim();
                                                if (reason.length === 0) {
                                                    alert('Please enter reason.');
                                                    return;
                                                }

                                                document.getElementById(`rejectReason${mentorCycleId}`).value = reason;
                                                document.getElementById(`rejectForm${mentorCycleId}`).submit();
                                                closeRejectModal(mentorCycleId);
                                            }

            </script>






    </body>

</html>