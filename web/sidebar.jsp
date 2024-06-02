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
      <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="assets/vendor_assets/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="assets/vendor_assets/css/daterangepicker.css">
<link rel="stylesheet" href="assets/vendor_assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/vendor_assets/css/footable.standalone.min.css">
<link rel="stylesheet" href="assets/vendor_assets/css/fullcalendar@5.2.0.css">
<link rel="stylesheet" href="assets/vendor_assets/css/jquery-jvectormap-2.0.5.css">
<link rel="stylesheet" href="assets/vendor_assets/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="assets/vendor_assets/css/leaflet.css">
<link rel="stylesheet" href="assets/vendor_assets/css/line-awesome.min.css">
<link rel="stylesheet" href="assets/vendor_assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/vendor_assets/css/MarkerCluster.css">
<link rel="stylesheet" href="assets/vendor_assets/css/MarkerCluster.Default.css">
<link rel="stylesheet" href="assets/vendor_assets/css/select2.min.css">
<link rel="stylesheet" href="assets/vendor_assets/css/slick.css">
<link rel="stylesheet" href="assets/vendor_assets/css/star-rating-svg.css">
<link rel="stylesheet" href="assets/vendor_assets/css/trumbowyg.min.css">
<link rel="stylesheet" href="assets/vendor_assets/css/wickedpicker.min.css">
<link rel="stylesheet" href="style/style.css">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">



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
                        <span class="nav-icon uil uil-bag"></span>
                        <span class="menu-text text-initial">Add ...</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="">
                           <a href="products.html">Course</a>
                        </li>
                        <li class="">
                           <a href="product-details.jsp">Course
                              Details</a>
                        </li>
                        <li class="">
                           <a href="add-product.html">Course
                              Add</a>
                        </li>
                        <li class="">
                           <a href="add-product.html">Course
                              Edit</a>
                        </li>

                     </ul>
                  </li>
     
                  <li>
                      <a href="CalendarBookingServlet?userName=${sessionScope.user.userName}" class="">
                        <span class="nav-icon uil uil-calendar-alt"></span>
                        <span class="menu-text">Calendar</span>
                     </a>
                  </li>
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-users-alt"></span>
                        <span class="menu-text">Member</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="">
                           <a href="users-card.html">Member Grid</a>
                        </li>
                        <li class="">
                           <a href="users-list.html">Member
                              List</a>
                        </li>
                        <li class="">
                           <a href="user-info.jsp">Request Member</a>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
         </div>
      </div>
    </body>

  

</html>
