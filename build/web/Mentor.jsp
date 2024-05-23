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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous">




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
            .profile img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .avatar{
                transform: translateY(-30px);
                width: 100px;
                height: 100px;
                background-size: cover;
            }
            .course{

                display: flex;
                justify-content: space-between;
            }
            .ac{
                transform: translateY(-24px);
            }
            .rounded-circle{
                border-radius: 50%;
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
                            <span class="logo-default">FMASTER</span>
                            <span class="logo-dark">FMASTER</span>
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
                                    <c:if test="${sessionScope.user == null}">
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="sign_up.jsp">Sign up</a></li>
                                        </c:if>
                                    <li class="t">
                                        <a href="javascript:;" class="nav-item-toggle">
                                            <span class="nav-item__title">Minh vq<i class="las la-angle-down nav-item__arrow"></i></span>
                                        </a>
                                        <ul class="dropdown-menu"> 
                                            <li>  <div class="nav-author__info">
                                                    <div class="author-img">
                                                        <img src="" alt="" class="rounded-circle">
                                                    </div>
                                                    <div>
                                                        <span>Developer</span>
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
                    <li class="active">Active page</li>
                </ol>

                <div class="row">
                    <aside class="col-md-4">
                        <div class=" box_style_1 profile">
                            <p class="text-center"><img src="./img/${mentor.avatar}" alt="Teacher" class="img-circle styled"></p>  
                            <ul>
                                <li>Name <strong class="pull-right"><c:out value="${mentor.fullName}" /></strong> </li>
                                <li>Email <strong class="pull-right"><c:out value="${mentor.gmail}" /></strong></li>
                                <li>Telephone <strong class="pull-right"><c:out value="${mentor.phone}" /></strong></li>
                                <li>Address <strong class="pull-right"><c:out value="${mentor.address}" /></strong></li>
                                <li>Gender <strong class="pull-right">${mentor.sex? "Male" : "Female"}</strong></li>                                <li>Address <strong class="pull-right"><c:out value="${mentor.address}" /></strong></li></li>
                                <li>Price <strong class="pull-right"><c:out value="${mentor.rate}" /></strong></li>
                            </ul>
                        </div></aside><div class="col-md-8">

                          
                        <ul class="nav nav-tabs" id="mytabs">
                            <li class="active"><a href="#profile_teacher" data-toggle="tab">Profile</a></li>
                            <li><a href="#courses" data-toggle="tab">Feedback</a></li>
                        </ul>
                         
                        <div class="tab-content">

                            <div class="tab-pane fade in active" id="profile_teacher">
                                <h3>About me</h3>
                                <p><strong> Profession: </strong> <c:out value="${mentor.profession}" /></p>
                                <p><strong> profession Introduction: </strong> <c:out value="${mentor.professionIntro}" /></p>
                                <h4>My Achievement </h4>
                                <p><c:out value="${mentor.achievementDescription}" /></p>
                                <h4>Service Description </h4>
                                <p><c:out value="${mentor.service_description}" /></p>
                                <h4>My Skill </h4>

                                <c:forEach items="${mentor.listSkills}" var="skill">
                                    <p>${skill.skillName}</p>
                                </c:forEach>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="list_3">

                                        </ul>
                                    </div>
                                </div> 
                            </div> 

                            <div class="tab-pane fade in" id="courses">
                                <h3 class="ac">Rate & Comment</h3>

                                <c:forEach items="${mentor.feedBacks}" var="feedback">
                                    <div id ="te" class="course">
                                        <div class="user-avatar">
                                            <img class="avatar" src="img/${feedback.avatar}" alt="User Avatar">
                                        </div>
                                          <p><c:out value="${feedback.menteeName}" /></p>
                                        <div id="te" class="rating">
                                            <div class="star-rating" data-rating="${feedback.star}">
                                               
                                            </div>
                                        </div>
                                   

                                        <div class="comment">
                                            <p>${feedback.comment}</p>
                                        </div>
                                    </div>

                                </c:forEach>
                            </div>          
                        </div>    
                    </div>  
                </div><!-- End container -->
        </section><!-- End main_content-->


        <script src="jss/jquery-2.2.4.min.js"></script>


        <script src="jss/superfish.js"></script>
        <script src="jss/bootstrap.min.js"></script>
        <script src="jss/jquery.placeholder.js"></script>
        <script src="jss/classie.js"></script>
        <script src="jss/uisearch.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/functions.js"></script>
     <script>
   
    document.querySelectorAll('.star-rating').forEach(function(element) {
       
        var rating = parseFloat(element.getAttribute('data-rating'));

        // Calculate the number of full stars, half star, and empty stars
        const fullStars = Math.floor(rating);
        const hasHalfStar = rating % 1 !== 0;
        const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

        // Create and append stars to the rating element
        for (let i = 0; i < fullStars; i++) {
            const star = document.createElement('i');
            star.classList.add('fas', 'fa-star');
            element.appendChild(star);
        }
        if (hasHalfStar) {
            const halfStar = document.createElement('i');
            halfStar.classList.add('fas', 'fa-star-half-alt');
            element.appendChild(halfStar);
        }
        for (let i = 0; i < emptyStars; i++) {
            const emptyStar = document.createElement('i');
            emptyStar.classList.add('far', 'fa-star');
            element.appendChild(emptyStar);
        }
    });
</script>

    </body>
</html>