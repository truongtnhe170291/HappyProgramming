<%-- 
    Document   : header
    Created on : May 20, 2024, 10:31:28 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="style/linkcss.jsp" />
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .rounded-circle{
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
                        <a href="homes.jsp">
                            <span class="logo-default">POLO</span>
                            <span class="logo-dark">POLO</span>
                        </a>
                    </div>
                    <!--End: Logo-->
                    <!-- Search -->
                    <div id="search"><a id="btn-search-close" class="btn-search-close" aria-label="Close search form"><i class="icon-x"></i></a>
                        <form class="search-form" action="search-results-page.html" method="get">
                            <input class="form-control" name="q" type="text" placeholder="Type & Search..." />
                            <span class="text-muted">Start typing & press "Enter" or "ESC" to close</span>
                        </form>
                    </div>
                    <!-- end: search -->
                    <!--Header Extras-->
                    <div class="header-extras">
                        <ul>
                            <li>
                                <a id="btn-search" href="#"> <i class="icon-search"></i></a>
                            </li>
                        </ul>
                    </div>
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
                                    <li><a href="homes.jsp">Home</a></li>

                                    <li class="dropdown"><a href="#">Features</a>
                                        <ul class="dropdown-menu"> 
                                            <li><a href="skill">SKILLS</a></li>

                                        </ul>
                                    </li>
                                    <c:if test="${sessionScope.user == null}">
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="sign_up.jsp">Sign up</a></li>
                                    </c:if>
                                        
                                    <c:if test="${sessionScope.user != null}">
                                        <li class="t">
                                            <a href="javascript:;" class="nav-item-toggle">
                                                <span class="nav-item__title">${sessionScope.user.fullName}<i class="las la-angle-down nav-item__arrow"></i></span>
                                            </a>
                                            <ul class="dropdown-menu"> 
                                                <li>  <div class="nav-author__info">
                                                        <div class="author-img">
                                                            <img src="img/author-nav.jpg" alt="" class="rounded-circle">
                                                        </div>
                                                        <div>
                                                            <span>UI Designer</span>
                                                        </div>
                                                    </div></li>
                                                <li>
                                                    <a href="UpdateAccountServlet?role=mentee">
                                                        <i class="uil uil-user"></i> Profile</a>
                                                </li>           
                                                <li>
                                                    <a href="">
                                                        <i class="uil uil-setting"></i>
                                                        Settings</a>
                                                </li>
                                                <li>
                                                    <a href="changepass">
                                                        <i class="uil uil-key-skeleton"></i> Change Password
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="">
                                                        <i class="uil uil-bell"></i> Help</a>
                                                </li>
                                                <li>
                                                    <a href="login.jsp" class="nav-author__signout">
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
