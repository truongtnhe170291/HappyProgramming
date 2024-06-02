<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="INSPIRO" />
        <meta name="description" content="Themeforest Template Polo, html template">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Document title -->
        <title>POLO | The Multi-Purpose HTML5 Template</title>
        <!-- Full Calendar files -->
        <link href='plugins/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
        <!-- Stylesheets & Fonts -->
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            .btn-light.active {

                background-color: #2250fc;
                color: #ccc;
            }
            .btn-light{
                line-height: 50px;
                margin-left: 60px;
            }
            input[type="checkbox"] {
                display: none;
            }
            .status {
                line-height: 50px;
                margin-left: 60px;
                font-size: 16px;
                margin-top: 10px;
                color: #333;
                font-weight: bold;
            }


        </style>
    </head>

    <body>
        <c:set var="listschedule" value="${requestScope.listSchedule}"/>
        <!-- Body Inner -->
        <div class="body-inner">
            <!-- Header -->
            <jsp:include page="header.jsp" />
            <!-- end: Header -->
            <!-- Page title -->
            <section id="page-title">
                <div class="container">
                    <div class="page-title">
                        <h1>Calendar</h1>
                        <span>Inspiration comes of working every day.</span>
                    </div>
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="homes.jsp">Home</a> </li>
                            <li class="active"><a href="Mentor_calendar.jsp">Calendar</a> </li>
                        </ul>
                    </div>
                </div>
            </section>

            <section id="page-content" class="no-sidebar">
                <div class="container">
                    <!-- Calendar -->
                    <div class="row mb-5">
                        <div class="col-lg-6">
                            <h4>List Views</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="calendar"></div>
                        </div>
                    </div>
                    <!-- end: Calendar -->
                </div>
            </section>

        </div>
        <!-- end: Body Inner -->
        <!-- Scroll top -->
        <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
        <!--Plugins-->
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <!--Template functions-->
        <script src="js/functions.js"></script>
        <script src='plugins/moment/moment.min.js'></script>
        <script src='plugins/fullcalendar/fullcalendar.min.js'></script>
        <script>
            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'listDay,listWeek,month'
                    },
                    views: {
                        listDay: {
                            buttonText: 'list day'
                        },
                        listWeek: {
                            buttonText: 'list week'
                        }
                    },
                    defaultView: 'listWeek',
                    defaultDate: '${listschedule.get(0).getStartTime()}',
                    navLinks: true,
                    editable: true,
                    eventLimit: true,
                    events: [
            <c:forEach items="${listschedule}" var="schedule">
                        {
                            title: '${schedule.slotId}',
                            start: '${schedule.dayOfSlot}T${schedule.start_slot}',
                            end: '${schedule.dayOfSlot}T${schedule.end_slot}',
                            status: 'Available'
                        },
            </c:forEach>
                    ],
                    eventRender: function (event, element) {
                        if (event.status !== 'Full' && event.status == 'Available') {
                            event.status === '';
                            element.append("<label class='btn btn-light'>Regis" + "<input type='checkbox' name='position' " + "</label>");

                            element.find('input[type="checkbox"]').on('click', function () {
                                $(this).closest('.btn').toggleClass('active');
                            });
                        } else {
                            element.append("<div class='status'>" + event.status + "</div>");
                        }
                    }
                });
            });
        </script>
    </body>

</html>