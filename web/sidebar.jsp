<%-- 
   Document   : sidebar
   Created on : May 18, 2024, 9:18:33 AM
   Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FMASTER</title>

        <jsp:include page="style/linkcss.jsp" />



    </head>
    <body>
        <div class="sidebar-wrapper">
            <div class="sidebar sidebar-collapse" id="sidebar">
                <div class="sidebar__menu-group">
                    <ul class="sidebar_nav">
                        <li class="has-child">
                            <a href="#" class="ch">
                                <span class="nav-icon uil uil-window-section"></span>
                                <span class="menu-text">Layouts</span>
                                <span class="toggle-icon"></span>
                            </a>
                            <ul class="toggle">
                                <li class="l_sidebar">
                                    <a href="#" data-layout="light">Light Mode</a>
                                </li>
                                <li class="l_sidebar">
                                    <a href="#" data-layout="dark">Dark Mode</a>
                                </li>
                            </ul>
                        </li>

                        <li class="has-child">
                            <a href="#" class="ch">
                                <span class="nav-icon uil uil-calendar-alt"></span>
                                <span class="menu-text">Calendar</span>
                                <span class="toggle-icon"></span>
                            </a>
                            <ul class="toggle">
                                <li class="l_sidebar">
                                    <a href="bookSchedule">Booking Calendar</a>
                                </li>
                                <li class="l_sidebar">
                                    <a href="scheduleCommonMentor">My Schedule</a>
                                </li>
                            </ul>
                        </li>

                        <li class="has-child">
                            <a href="#" class="ch">
                                <span class="nav-icon uil uil-users-alt"></span>
                                <span class="menu-text">Mentee</span>
                                <span class="toggle-icon"></span>
                            </a>
                            <ul class="toggle">
                                <li class="">
                                    <a href="ListRequestMentor">List Request</a>
                                </li>
                                 <li class="">
                                    <a href="StatisticRequestMentor">Statistic Request</a>
                                </li>
                                 <li class="">
                                    <a href="MyMentee">My Mentee</a>
                                </li>
                            </ul>
                            
                               
                         
                        </li>
                        <li class="has-child">
                            <a href="#" class="ch">
                                <span class="nav-icon uil uil-users-alt"></span>
                                <span class="menu-text">CV</span>
                                <span class="toggle-icon"></span>
                            </a>
                            <ul class="toggle">
                                <li class="">
                                    <a href="cv">Apply CV</a>
                                </li>
                            </ul>
                        </li>
                        

                    </ul>

                </div>
            </div>
        </div>
        <jsp:include page="style/linkJS.jsp" />

    </body>
</html>
