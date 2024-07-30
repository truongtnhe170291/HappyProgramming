<%-- 
    Document   : header_Manager
    Created on : Jun 24, 2024, 10:55:37 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #setst{
                transform: translateX(-5px);
                padding-right: 5px;
                width: 15.85px;
height: 15.85px;
font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar sticky">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
	collapse-btn"> <i data-feather="align-justify"></i></a></li>
           
        
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
                        <div class="dropdown-title">Hello Manager</div>

          <li class="dropdown"><a href="#" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img style="font-size:70px;" id="img_v" alt="image" src="img/manager_vua.jpg"
                class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
            <div class="dropdown-menu dropdown-menu-right pullDown">
              <div class="dropdown-divider"></div>
               <a href="WalletManager" class="dropdown-item has-icon text">  <i class="fas fa-wallet"></i>
                My Wallet
              </a>
              <a href="logoutManager" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
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
                <li class="active"><a class="nav-link" href="ManagerHomePage">Dashboard 1</a></li>
              </ul>
            </li>
            <li class="menu-header">Request</li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Management</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="listCV">List CV</a></li>
                
                <li><a class="nav-link" href="skills">List Skills</a></li>
                <li><a class="nav-link" href="requestmentee">List Request</a></li>
                                <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>

              </ul>
            </li>
            
          <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i id="setst" class="fas fa-user-circle "></i><span>Account</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="accountstatus">active</a></li>
                <li><a class="nav-link" href="ManagerBlog">Blog</a></li>
              </ul>
            </li>
            
          </ul>
        </aside>
      </div>
    </body>
</html>
