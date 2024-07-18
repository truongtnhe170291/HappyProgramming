<%-- 
    Document   : Mentor_Mentee_calendar
    Created on : May 31, 2024, 7:02:25 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fmaster</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            .draggable-events{
                display:flex;
                justify-content: center;
            }
  

.select-wrapper {
    position: relative;
    display: inline-block;
    margin: 20px 0;
}

.select-wrapper::after {
    content: "\25BC";
    position: absolute;
    top: 50%;
    right: 15px;
    transform: translateY(-50%);
    pointer-events: none;
}

#menteeFilter {

    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-color: #f8f9fa;
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 10px 35px 10px 15px;
    font-size: 16px;
    font-weight: 500;
    color: #495057;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    max-width: 100%;
}

#menteeFilter:hover {
    background-color: #e9ecef;
    border-color: #adb5bd;
}

#menteeFilter:focus {
    outline: none;
    box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
    border-color: #80bdff;
}

#menteeFilter option {
  
    background-color: #fff;
    color: #495057;
}

@media (max-width: 768px) {
    #menteeFilter {
        width: 100%;
    }
}
.draggable-events{
    text-align: center;
    display: inline;
}
#tttt{
    display: flex;
    justify-content: center;
    width: 100%;
}
.green-event { background-color: #33FF57; }  
.red-event { background-color: #cc0033; }    
.purple-event { background-color: #8A33FF; } 

.color-1 { background-color: #FFA500; } 
.color-2 { background-color: #4B0082; } 
.color-3 { background-color: #00CED1; } 
.color-4 { background-color: #FF1493; } 
.color-5 { background-color: #FFD700; }

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
              

                <div class="dm-page-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="breadcrumb-main">
                                    <h4 class="text-capitalize breadcrumb-title">calendar</h4>
                                    <div class="breadcrumb-action justify-content-center flex-wrap">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="mentor_info.jsp"><i class="uil uil-estate"></i>Home</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">calendar</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row calendar-grid justify-content-center">
                            <div class="col-xxl-3 col-xl-5 col-md-6 col-sm-8">
                                <div class="dm-calendar-left">
                                    
                                    <div class="card card-md mb-4">
                                        <div class="card-body">
                                            <div class="draggable-events" id="draggable-events">
                                                <div  class="draggable-events__top d-flex justify-content-between">
                                                    <h6 id="tttt">My Calendars</h6>
                                              
                                                  
                                                </div>
                                                  
                  
                                                  <div>You can select By menteeName</div>
                                               <select class="draggable-event-list" id="menteeFilter" onchange="filterByMentee(this.value)">
                                                   
                                                                <option value="All Mentees">All Mentees</option>
                                                                <c:forEach items="${uniqueMenteeNames}" var="menteeName">
                                                                    <option value="${menteeName}">${menteeName}</option>
                                                                </c:forEach>
                                                            </select>

                                             
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ends: .card -->
                                </div>
                            </div>
                            <!-- ends: .col-lg-3 -->
                            <div class="col-xxl-9">
                                <div class="card card-default card-md mb-4">
                                    <div class="card-body">
                                        <div id='full-calendar'></div>
                                    </div>
                                </div>
                                <!-- ends: .card -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ends: .dm-page-content -->

                <div class="c-event-modal modal fade" id="c-event-modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-md c-event-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title">Create Event</h6>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <img src="img/svg/x.svg" alt="x" class="svg">
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="c-event-form">
                                    <form action="#">
                                        <div class="e-form-row d-flex">
                                            <div class="e-form-row__left">
                                                <label>Title</label>
                                            </div>
                                            <div class="e-form-row__right">
                                                <input type="text" name="e-title" placeholder="Weekly report meeting" class="form-control form-control-md">
                                            </div>
                                        </div>
                                        <!-- ends: .e-form-row -->
                                        <div class="e-form-row d-flex">
                                            <div class="e-form-row__left">
                                                <label>Event type</label>
                                            </div>
                                            <div class="e-form-row__right">
                                                <div class="radio-horizontal-list d-flex flex-wrap">
                                                    <div class="radio-theme-default custom-radio ">
                                                        <input class="radio" type="radio" name="radio-e-type" value="01" id="radio-1">
                                                        <label for="radio-1">
                                                            <span class="radio-text">Event</span>
                                                        </label>
                                                    </div>
                                                    <div class="radio-theme-default custom-radio ">
                                                        <input class="radio" type="radio" name="radio-e-type" value="02" id="radio-2">
                                                        <label for="radio-2">
                                                            <span class="radio-text">Remainder</span>
                                                        </label>
                                                    </div>
                                                    <div class="radio-theme-default custom-radio ">
                                                        <input class="radio" type="radio" name="radio-e-type" value="03" id="radio-3">
                                                        <label for="radio-3">
                                                            <span class="radio-text">Task</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- ends: .e-form-row -->
                                        <div class="e-form-row d-flex">
                                            <div class="e-form-row__left">
                                                <label>Start</label>
                                            </div>
                                            <div class="e-form-row__right d-flex">
                                                <div class="input-container icon-left position-relative me-2">
                                                    <span class="input-icon icon-left">
                                                        <img class="svg" src="img/svg/chevron-right.svg" alt="chevron-right.svg">
                                                    </span>
                                                    <input type="text" class="form-control form-control-md" name="s-date" placeholder="Select Date">
                                                </div>
                                                <div class="input-container icon-left position-relative">
                                                    <span class="input-icon icon-left">
                                                        <img class="svg" src="img/svg/clock.svg" alt="clock">
                                                    </span>
                                                    <input type="text" class="form-control form-control-md" name="s-time" placeholder="Select Time">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- ends: .e-form-row -->
                                        <div class="e-form-row d-flex">
                                            <div class="e-form-row__left">
                                                <label>End</label>
                                            </div>
                                            <div class="e-form-row__right d-flex">
                                                <div class="input-container icon-left position-relative me-2">
                                                    <span class="input-icon icon-left">
                                                        <img class="svg" src="img/svg/chevron-right.svg" alt="chevron-right.svg">
                                                    </span>
                                                    <input type="text" class="form-control form-control-md" name="e-date" placeholder="Select Date">
                                                </div>
                                                <div class="input-container icon-left position-relative">
                                                    <span class="input-icon icon-left">
                                                        <img class="svg" src="img/svg/clock.svg" alt="clock">
                                                    </span>
                                                    <input type="text" class="form-control form-control-md" name="e-time" placeholder="Select Time">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- ends: .e-form-row -->
                                        <div class="e-form-row d-flex">
                                            <div class="e-form-row__left">
                                                <label>Description</label>
                                            </div>
                                            <div class="e-form-row__right">
                                                <textarea name="e-description" class="form-control form-control-md" placeholder="Add Description"></textarea>
                                            </div>
                                        </div>
                                        <!-- ends: .e-form-row -->
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white btn-sm" data-bs-dismiss="modal">Cancel</button>
                                <button type="button" class="btn btn-primary btn-sm">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ends: .c-event-modal -->

                <div class="e-info-modal modal fade" id="e-info-modal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm e-info-dialog modal-dialog-centered" id="c-event" role="document">
                        <div class="modal-content">
                            <div class="modal-header e-info-header bg-primary">
                                <h6 class="modal-title e-info-title">Project Update</h6>
                                <div class="e-info-action">
                                    <button class="btn-icon">
                                        <img class="svg" src="img/svg/edit.svg" alt="edit">
                                    </button>
                                    <button class="btn-icon">
                                        <img class="svg" src="img/svg/mail.svg" alt="mail">
                                    </button>
                                    <button class="btn-icon">
                                        <img class="svg" src="img/svg/trash-2.svg" alt="trash">
                                    </button>
                                    <button type="button" class="btn-icon btn-closed" data-bs-dismiss="modal" aria-label="Close">
                                        <i class="uil uil-times"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="modal-body">
                                
                              
                            </div>
                           
                        </div>
                    </div>
                </div>
                <!-- ends: .e-info-modal -->
            </div>
 
        </main>
        <div id="overlayer">
            <div class="loader-overlay">
                <div class="dm-spin-dots spin-lg">
                    <span class="spin-dot badge-dot dot-primary"></span>
                    <span class="spin-dot badge-dot dot-primary"></span>
                    <span class="spin-dot badge-dot dot-primary"></span>
                    <span class="spin-dot badge-dot dot-primary"></span>
                </div>
            </div>
        </div>
         
        <div class="overlay-dark-sidebar"></div>
        <div class="customizer-overlay"></div>
       
     <script>
(function ($) {
    $("#external-events .fc-event").each(function () {
        $(this).data("event", {
            title: $.trim($(this).text()),
            stick: true
        });
        $(this).draggable({
            zIndex: 999,
            revert: true,
            revertDuration: 0
        });
    });

    let date = new Date();

    let projectUpdate = {
        id: 4,
        events: []
    };

    function getEventClassName(status) {
        switch (status) {
            case 'Attended': return 'event-attended';
            case 'Absent': return 'event-absent';
            default: return 'event-default';
        }
    }

    function getColorClass(index) {
    const colors = ['color-1', 'color-2', 'color-3', 'color-4', 'color-5'];
    return colors[index % colors.length];
}

    const menteeColors = {};
    let menteeIndex = 0;

    var count = 1;
    <c:forEach items="${listSchedule}" var="schedule">
        var dates = "${schedule.dayOfSlot}";
        var timeRange = "${schedule.slotName}".split(" - ");
        var startTime = timeRange[0];
        var endTime = timeRange[1];
        var start = moment(dates + " " + startTime, 'YYYY-MM-DD HH:mm').format('YYYY-MM-DDTHH:mm:ss');
        var end = moment(dates + " " + endTime, 'YYYY-MM-DD HH:mm').format('YYYY-MM-DDTHH:mm:ss');

       var menteeName = "${schedule.menteeName}";
    if (!menteeColors[menteeName]) {
        menteeColors[menteeName] = getColorClass(menteeIndex++);
    }

        projectUpdate.events.push({
            id: count,
            start: start,
            end: end,
            title: "${schedule.skillName} - ${schedule.fullName}",
            className: getEventClassName("${schedule.attendanceStatus}") + ' ' + menteeColors[menteeName],
            extendedProps: {
                selected_id: "${schedule.selected_id}",
                menteeName: "${schedule.menteeName}",
                slotID: "${schedule.slotId}",
                request_id: "${schedule.request_id}",
                fullName: "${schedule.fullName}",
                skillName: "${schedule.skillName}",
                dayOfSlot: "${schedule.dayOfSlot}",
                slotName: "${schedule.slotName}",
                attendanceStatus: "${schedule.attendanceStatus}"
            }
        });

        count++;
    </c:forEach>

    var calendar;

    document.addEventListener("DOMContentLoaded", function () {
        var fullCalendar = document.getElementById("full-calendar");
        if (fullCalendar) {
            calendar = new FullCalendar.Calendar(fullCalendar, {
                headerToolbar: {
                    left: "today,prev,title,next",
                    right: "timeGridDay,timeGridWeek,dayGridMonth,listMonth",
                },
                views: {
                    listMonth: {
                        buttonText: "Schedule",
                        titleFormat: { month: "short", weekday: "short" },
                    }
                },
                listDayFormat: true,
                listDayAltFormat: true,
                allDaySlot: false,
                editable: true,
                eventSources: [projectUpdate],
                contentHeight: 800,
                initialView: "timeGridDay",
                eventDidMount: function (view) {
                    $(".fc-list-day").each(function () { });
                },
                eventClick: function (infoEvent) {
                    const en = infoEvent.event.extendedProps;
                    let infoModal = $("#e-info-modal");
                    infoModal.find('.modal-content').empty();

                    const infoContent = '<div class="modal-body">' +
                        '<ul class="e-info-list">' +
                        '<li>' +
                        '<img class="svg" src="img/svg/align-left.svg" alt="align-left">' +
                        '<span class="list-line">' +
                        '<span class="list-text">' + en.fullName + '</span>' +
                        '</span>' +
                        '</li>' +
                        '<li>' +
                        '<img class="svg" src="img/svg/align-left.svg" alt="align-left">' +
                        '<span class="list-line">' +
                        '<span class="list-text">' + en.skillName + '</span>' +
                        '</span>' +
                        '</li>' +
                        '<li>' +
                        '<img class="svg" src="img/svg/chevron-right.svg" alt="chevron-right.svg">' +
                        '<span class="list-line">' +
                        '<span class="list-label">Date :</span>' +
                        '<span class="list-meta">' + en.dayOfSlot + '</span>' +
                        '</span>' +
                        '</li>' +
                        '<li>' +
                        '<img class="svg" src="img/svg/clock.svg" alt="">' +
                        '<span class="list-line">' +
                        '<span class="list-label">Time :</span>' +
                        '<span class="list-meta">' + en.slotName + '</span>' +
                        '</span>' +
                        '</li>' +
                        '<li>' +
                        '<span class="list-line">' +
                        '<span class="list-label">Attendance:</span>' +
                        '<input type="radio" id="attended" name="attendance" value="Attended"' + (en.attendanceStatus === 'Attended' ? ' checked' : '') + '>' +
                        '<label for="attended">Attended</label>' +
                        '<input type="radio" id="absent" name="attendance" value="Absent"' + (en.attendanceStatus === 'Absent' ? ' checked' : '') + '>' +
                        '<label for="absent">Absent</label>' +
                        '</span>' +
                        '</li>' +
                        '</ul>' +
                        '<button id="updateAttendance" class="btn btn-primary">Update Attendance</button>' +
                        '</div>';

                    infoModal.find('.modal-content').html(infoContent);
                    infoModal.modal("show");

                    $("#updateAttendance").on("click", function () {
                        const attendanceStatus = $("input[name='attendance']:checked").val();
                        if (!attendanceStatus) {
                            alert("Please select an attendance status.");
                            return;
                        }
                        updateAttendance(infoEvent.event.id, en.selected_id, en.slotID, en.menteeName, en.request_id, en.fullName, en.skillName, en.dayOfSlot, en.slotName, attendanceStatus);
                    });
                },
            });

            let eventElement = document.getElementById("draggable-events");
            let draggable = new FullCalendar.Draggable(eventElement, {
                itemSelector: ".draggable-event-list__single",
                eventData: function (eEl) {
                    return {
                        title: eEl.innerText,
                        className: $(eEl).data("class"),
                    };
                }
            });
            calendar.render();
            $('.fc-button-group .fc-listMonth-button').prepend('<i class="las la-list"></i>');
                filterByMentee("All Mentees");

        }
    });

window.filterByMentee = function (menteeName) {
    const statusColors = {
        'Attended': 'green-event',
        'Absent': 'red-event',
        'default': 'purple-event'
    };

    calendar.getEvents().forEach((event) => {
        const eventMenteeName = event.extendedProps.menteeName;
        const attendanceStatus = event.extendedProps.attendanceStatus;

        if (menteeName === "" || menteeName === "All Mentees") {
            event.setProp('display', 'auto');
            event.setProp('classNames', menteeColors[eventMenteeName]);
        } else if (eventMenteeName === menteeName) {
            event.setProp('display', 'auto');
            event.setProp('classNames', statusColors[attendanceStatus] || statusColors['default']);
        } else {
            event.setProp('display', 'none');
        }
    });
}

    function updateAttendance(eventId, selected_id, slotID, menteeName, request_id, fullName, skillName, date, slot, status) {
        const data = {
            selected_id: selected_id,
            menteeName: menteeName,
            request_id: request_id,
            slotID: slotID,
            fullName: fullName,
            skillName: skillName,
            date: date,
            slot: slot,
            status: status
        };

        console.log('Sending data:', data); // Debug line

        $.ajax({
            url: 'UpdateAttendanceServlet',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                alert('Attendance updated successfully');
                var event = calendar.getEventById(eventId);
                if (event) {
                    event.setExtendedProp('attendanceStatus', status);
                    event.setProp('className', getEventClassName(status));
                }
            },
            error: function (xhr, status, error) {
                alert('Error updating attendance: ' + error);
            }
        });
    }
})(jQuery);
</script>



        </body>
    </html>
