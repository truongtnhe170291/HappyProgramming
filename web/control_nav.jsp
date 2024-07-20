<%-- 
    Document   : control_nav
    Created on : May 18, 2024, 8:56:02 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FMASTER</title>
                <jsp:include page="style/linkcss.jsp" />
                <style>
  input#dark {
                background-color: #333;
                color: #fff;
                border: 2px solid #555;
                border-radius: 5px;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            input#dark:hover {
                background-color: #444;
                border-color: #777;
            }

            input#dark:active {
                background-color: #555;
                border-color: #999;
                transform: scale(0.98);
            }

            input#dark:focus {
                outline: none;
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            }
            </style>
    </head>
    <body>
        <header class="header-top">
            <nav class="navbar navbar-light">
                <div class="navbar-left">
                    <div class="logo-area">
                              <a class="navbar-brand" href="home">
                            <input id="dark" class="dark" type="submit" value="F_Master"/>
                            <input id="dark" class="light" type="submit" value="F_Master"/>
                        </a>
                        <a href="#" class="sidebar-toggle">
                            <img class="svg" src="img/svg/align-center-alt.svg" alt="img"></a>
                    </div>

                </div>
                <!-- ends: navbar-left -->
                <div class="navbar-right">
                    <ul class="navbar-right__menu">
                       <li class="nav-author">
                            <div class="dropdown-custom">
                                <a href="javascript:;" class="nav-item-toggle">
                                    <span class="nav-item__title">${sessionScope.user.userName}<i class="las la-angle-down nav-item__arrow"></i></span>
                                </a>
                                <div class="dropdown-parent-wrapper">
                                    <div class="dropdown-wrapper">
                                        <div class="nav-author__info">
                                            <div class="author-img">
                                                <img src="./img/${sessionScope.user.avatar}" alt="" class="rounded-circle">
                                            </div>
                                            <div>
                                                <h6>${sessionScope.user.fullName}</h6>
                                            </div>
                                        </div>
                                        <div class="nav-author__options">
                                            <ul>
                                                <li>
                                                    <a href="UpdateAccountServlet">
                                                        <i class="uil uil-user"></i> Profile</a>
                                                </li>
                                                <li>
                                                    <a href="changepass">
                                                        <i class="uil uil-key-skeleton"></i> Change Password</a>
                                                </li>
                                                <li>
                                                    <a href="WalletMentor">
                                                        <i class="fas fa-wallet"></i> My Wallet</a>
                                                </li>
                                                
                                            </ul>
                                            <a href="Signout_Servlet" class="nav-author__signout">
                                                <i class="uil uil-sign-out-alt"></i> Sign Out</a>
                                        </div>
                                    </div>
                                    <!-- ends: .dropdown-wrapper -->
                                </div>
                            </div>
                        </li>
                        <!-- ends: .nav-author -->
                    </ul>
                    <!-- ends: .navbar-right__menu -->
                    <div class="navbar-right__mobileAction d-md-none">
                        <a href="#" class="btn-search">
                            <img src="img/svg/search.svg" alt="search" class="svg feather-search">
                            <img src="img/svg/x.svg" alt="x" class="svg feather-x"></a>
                        <a href="#" class="btn-author-action">
                            <img class="svg" src="img/svg/more-vertical.svg" alt="more-vertical"></a>
                    </div>
                </div>
            </nav>
        </header>
    </body>
          

</html>
