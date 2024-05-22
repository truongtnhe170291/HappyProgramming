<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  	<meta charset="utf-8">
    <title>Fmaster</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
    
    <!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Raleway:400,500,600,700,800" rel="stylesheet">
    
    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/superfish.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="fontello/css/fontello.css" rel="stylesheet">
    
    
<style>
      .rounded-circle{
                width: 200px;
                height: 200px;
            }
    li {
    list-style-type: none;
}
#header{
    position: fixed;
}
</style>
  </head>
  <body>

     <header id="header" data-fullwidth="true">
            <div class="header-inner">
                <div class="container">
                    <!--Logo-->
                    <div id="logo">
                        <a href="index.html">
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
                                                    <li><a href="blog_skill.jsp">Mentor detail</a></li>
                                                    <li><a href="user_info.jsp">CV</a></li>                            
                                        </ul>
                                    </li>
                                     <li><a href="login.jsp">Login</a></li>
                                      <li><a href="sign_up.jsp">Sign up</a></li>
                                      <li class="t">
                                           <a href="javascript:;" class="nav-item-toggle">
                                    <span class="nav-item__title">Minh vq<i class="las la-angle-down nav-item__arrow"></i></span>
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
                                                    <a href="updatementee">
                                                        <i class="uil uil-user"></i> Profile</a>
                                                </li>           
                                                <li>
                                                    <a href="">
                                                        <i class="uil uil-setting"></i>
                                                        Settings</a>
                                                </li>
                                                <li>
                                                    <a href="newPassword.jsp">
                                                        <i class="uil uil-key-skeleton"></i> Change Password</a>
                                                </li>
                                                 <li>
                                                    <a href="">
                                                        <i class="uil uil-users-alt"></i> Apply CV</a>
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
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!--END: NAVIGATION-->
                </div>
            </div>
        </header>

<section id="main_content">

<div class="container">

<ol class="breadcrumb">
  <li><a href="index.html">Home</a></li>
  <li class="active">Active page</li>
</ol>
      
<div class="row">
  <aside class="col-md-4">
    <div class=" box_style_1 profile">
        <p class="text-center"><img src="${mentor.avatar}" alt="Teacher" class="img-circle styled"></p>  
      <ul>
        <li>Name <strong class="pull-right"><c:out value="${mentor.fullName}" /></strong> </li>
        <li>Email <strong class="pull-right"><c:out value="${mentor.gmail}" /></strong></li>
        <li>Telephone <strong class="pull-right"><c:out value="${mentor.phone}" /></strong></li>
        <li>Address <strong class="pull-right"><c:out value="${mentor.address}" /></strong></li>
        </ul>
    </div></aside><div class="col-md-8">
    
      
    <ul class="nav nav-tabs" id="mytabs">
      <li class="active"><a href="#profile_teacher" data-toggle="tab">Profile</a></li>
      <li><a href="#courses" data-toggle="tab">My Courses</a></li>
    </ul>
     
    <div class="tab-content">
    
      <div class="tab-pane fade in active" id="profile_teacher">
        <h3>About me</h3>
        <p><c:out value="${mentor.profession}" /></p>
        <h4>Credentials</h4>
        <p><c:out value="${mentor.achievementDescription}" /></p>
        <div class="row">
          <div class="col-md-6">
            <ul class="list_3">
      
            </ul>
          </div>
          </div> 
      </div> 
      
      <div class="tab-pane fade in" id="courses">
        <h3>Active courses</h3>
        </div></div>          
  </div>    
</div>  
</div><!-- End container -->
</section><!-- End main_content-->

    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>

<!-- JQUERY -->
<script src="jss/jquery-2.2.4.min.js"></script>

<!-- OTHER JS --> 
<script src="jss/superfish.js"></script>
<script src="jss/bootstrap.min.js"></script>
<script src="jss/retina.min.js"></script>
<script src="assets/validate.js"></script>
<script src="jss/jquery.placeholder.js"></script>
<script src="jss/functions.js"></script>
<script src="jss/classie.js"></script>
<script src="jss/uisearch.js"></script>
<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/functions.js"></script>
  </body>
</html>