<%-- Document : header Created on : May 20, 2024, 10:31:28 PM Author : 84979 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="style/linkcss.jsp" />
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <style>
            .rounded-circle {
                width: 200px;
                height: 200px;
            }
        </style>
    </head>

    <body>
        <header id="header" data-fullwidth="true">
            <div class="header-inner">
                <div class="container">
                    <!--Logo-->
                    <div id="logo">
                        <a href="homeMentee">
                            <span class="logo-default">FMASTER</span>
                            <span class="logo-dark">FMASTER</span>
                        </a>
                    </div>
                    <!--End: Logo-->

                    <!--Header Extras-->

                    <!--end: Header Extras-->
                    <!--Navigation Resposnive Trigger-->
                    <div id="mainMenu-trigger">
                        <a class="lines-button x"><span class="lines"></span></a>
                    </div>
                    <!--end: Navigation Resposnive Trigger-->
                    <!--Navigation-->
                    <div id="mainMenu">
                        <div class="container">
                            <nav>
                                <ul>


                                    <li class="dropdown"><a href="#">Features</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="skill">SKILLS</a></li>
                                                <c:if
                                                    test="${sessionScope.user != null && sessionScope.user.roleId == 1}">
                                                <li><a href="StaticRequest">STATISTICS REQUEST</a></li>
                                                <li><a href="ListRequest">HISTORY REQUEST</a></li>
                                                <li><a href="Schedule_General_Mentee">GENERAL SCHEDULE</a></li>
                                                </c:if>
                                        </ul>
                                    </li>
                                    <c:if test="${sessionScope.user == null}">
                                        <li><a href="login">Login</a></li>
                                        <li><a href="signup">Sign up</a></li>
                                        </c:if>

                                    <c:if test="${sessionScope.user != null}">
                                        <li class="t">
                                            <a href="javascript:;" class="nav-item-toggle">
                                                <span class="nav-item__title">${sessionScope.user.fullName}<i
                                                        class="las la-angle-down nav-item__arrow"></i></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="nav-author__info">
                                                        <div class="author-img">
                                                            <img src="./img/${user.avatar}" alt=""
                                                                 class="rounded-circle">
                                                        </div>
                                                    </div>
                                                </li>
                                                <c:if
                                                    test="${sessionScope.user != null && sessionScope.user.roleId == 1}">
                                                    <li>
                                                        <a href="UpdateAccountServlet">
                                                            <i class="uil uil-user"></i> Profile</a>
                                                    </li>

                                                    <li>
                                                        <a href="wallet">
                                                            <i class="fas fa-wallet"></i> Your Wallet
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="changepass">
                                                            <i class="uil uil-key-skeleton"></i> Change Password
                                                        </a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <a href="Signout_Servlet" class="nav-author__signout">
                                                        <i class="uil uil-sign-out-alt"></i> Sign Out</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!--END: NAVIGATION-->
                </div>
            </div>
        </header>
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/functions.js"></script>
        <jsp:include page="style/linkJS.jsp" />

    </body>

</html>