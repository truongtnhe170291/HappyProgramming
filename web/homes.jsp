<%-- 
    Document   : homes.jsp
    Created on : May 20, 2024, 8:18:32 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="author" content="INSPIRO" />
        <meta name="description" content=" html">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Document title -->
        <title>Fmaster</title>
        <!-- Stylesheets & Fonts -->
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            .dev {
                background-size: cover;
            }

            .blog{
                display: flex;
            }
           
    .footer {
        background-color: #ccc;
        padding: 40px 0;
    }

    .footer h3 {
        margin-bottom: 20px;
    }

    .footer ul {
        list-style-type: none;
        padding: 0;
    }

    .footer ul li {
        margin-bottom: 10px;
    }

    .footer ul li a {
        text-decoration: none;
        color: #343a40;
    }

    .footer ul li a:hover {
        text-decoration: underline;
    }

    .footer-bottom {
        background-color: #e9ecef;
        padding: 20px 0;
        text-align: center;
    }
        </style>
    </head>

    <body>
        <div class="body-inner">
            <!-- Header -->
            <jsp:include page="header.jsp"/>
            <div id="slider" class="inspiro-slider slider-fullscreen dots-creative" data-fade="true">
                <!-- Slide 1 -->
                <div class="slide" data-bg-video="video/Happy Programing_1.mp4">
                    <div class="bg-overlay"></div>
                    <div class="container">
                        <div class="slide-captions text-center text-light">
                            <!-- Captions -->
                            <h1 data-caption-animate="zoom-out"></h1>
                            <p style="margin-top:50px;transform: translateY(50px);">Welcome aboard FMaster—the ultimate destination for creative minds. Whether you're here to learn, to create, or to be inspired, your journey starts now. So, dive in, explore, and let your imagination soar. The world of FMaster is yours to conquer..</p>

                            <!-- end: Captions -->
                        </div>
                    </div>
                </div>
                <!-- end: Slide 1 -->
                <!-- Slide 2 -->
                <div class="slide" data-bg-video="video/Happy Programing.mp4">
                     <div class="bg-overlay"></div>
                    <div class="container">
                        <div class="slide-captions text-start text-light">
                            <!-- Captions -->
                            <h1>100+ Quality mentors</h1>
                            <p class="text-small">FMASTER: Discover & Develop Your Passion for Programming with Mentor Code: Detailed Instructions from Basic to Advanced</p>
                            <!-- end: Captions -->
                        </div>
                    </div>
                </div>
                <!-- end: Slide 2 -->
            </div>
            <section class="background-grey">
                <div class="container">
                    <div class="heading-text heading-section">
                        <h2>WHAT WE DO</h2>
                        <span class="lead">Our Job: Connects You With Mentors Bible Verses For My Respect Programming.</span>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="0">
                                <h4>Thinking Skills</h4>
                                <p>Thinking Skills: A Creative & Logical Approach to Problem Solving.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="200">
                                <h4>Loaded with Features</h4>
                                <p>Integrating Many Breakthrough Features To Help You Learn & Develop. Tools, Resources & Comprehensive Support for Developers.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="400">
                                <h4>Completely Customizable</h4>
                                <p>Total Personalization: Tailoring Roadmaps & Tools for Optimal Performance.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="600">
                                <h4>100% Responsive Layout</h4>
                                <p>Flexible & Responsive Interface: Unlimited Learning on Any Device.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="800">
                                <h4>Clean Modern Code</h4>
                                <p>Modern Prototype Code: The Perfect Combination of Clean and Modern.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="1000">
                                <h4>Free Updates & Support</h4>
                                <p>Mentor Code: Free Support and Updates, Bringing Peace of Mind to Your Learning Journey.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END WHAT WE DO -->
            <!-- PORTFOLIO -->
            <section class="p-b-0">
                <div class="container">
                    <div class="heading-text heading-section">
                        <h2>Recent Work</h2>
                        <span class="lead">Beyond Syntax: Crafting Proficiency in Programming Languages with Mentor Code's Tailored Approach.</span>
                    </div>
                </div>
                <div class="portfolio">
                    <!-- Portfolio Items -->

                    <div id="portfolio" class="grid-layout portfolio-4-columns" data-margin="0">
                        <!-- portfolio item -->
                        
                        <c:forEach items="${requestScope.topblog}" var="topblog">
                            <div class="portfolio-item img-zoom ct-photography ct-marketing ct-media">
                                <div class="portfolio-item-wrap">
                                    <div class="portfolio-image">
                                           
                                        <a href="${topblog.link}"><img class="test" src="./imgblog/${topblog.img}" alt="test" /></a>
                                    </div>
                                    <div class="portfolio-description">
                                        <a title="Paper Pouch!" data-lightbox="image" href="./imgblog/${topblog.img}"><i class="icon-maximize"></i></a>
                                        <a href="${topblog.link}"><i class="icon-link"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!--                         end: portfolio item 
                                                 portfolio item 
                                                <div class="portfolio-item img-zoom ct-photography ct-marketing ct-media">
                                                    <div class="portfolio-item-wrap">
                                                        <div class="portfolio-image">
                                                            <a href="#"><img class="test" src="img/JSs.jpg" alt=""></a>
                        
                                                        </div>
                                                        <div class="portfolio-description">
                                                            <a title="Paper Pouch!" data-lightbox="image" href="img/C.jpg"><i class="icon-maximize"></i></a>
                                                            <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end: portfolio item 
                                                 portfolio item 
                                                <div class="portfolio-item img-zoom ct-photography ct-media ct-branding ct-Media">
                                                    <div class="portfolio-item-wrap">
                                                        <div class="portfolio-image">
                                                            <a href="#"><img src="img/java.jpg" alt=""></a>
                                                        </div>
                                                        <div class="portfolio-description">
                                                            <a href="portfolio-page-grid-gallery.html">
                                                                <h3>Let's Go Outside</h3>
                                                                <span>Illustrations / Graphics</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                 end: portfolio item 
                                                 portfolio item 
                                                <div class="portfolio-item img-zoom ct-photography ct-media ct-branding ct-marketing ct-webdesign">
                                                    <div class="portfolio-item-wrap">
                                                        <div class="portfolio-image">
                                                            <a href="#"><img src="img/sql.jpg" alt=""></a>
                                                        </div>
                                                        <div class="portfolio-description" data-lightbox="gallery">
                                                            <a title="Photoshop Mock-up!" data-lightbox="gallery-image" href="images/portfolio/80l.jpg"><i class="icon-copy"></i></a>
                                                            <a title="Paper Pouch!" data-lightbox="gallery-image" href="images/portfolio/81l.jpg" class="hidden"></a>
                                                            <a title="Mock-up" data-lightbox="gallery-image" href="images/portfolio/82l.jpg" class="hidden"></a>
                                                            <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            
                                            </div>-->
                        <!-- end: Portfolio Items -->
                    </div>
            </section>
            <section class="content background-grey">
                <div class="container">
                    <div class="heading-text heading-section">
                        <h2>Top 3 mentor suggested</h2>
                        <span class="lead">Renowned for their exceptional teaching prowess, this mentor commands a vast following of eager learners. </span>
                    </div>                      
                    <div id="blog" class="grid-layout post-3-columns m-b-30 d-flex" data-item="post-item">

                    <c:forEach items="${requestScope.topMentors}" var="member">
                            <!-- Post item-->
                            <div class="post-item border">
                                <div class="post-item-wrap">
                                    <div class="post-image">
                                        <a href="#">
                                            <img alt="" src="./img/${member.avatar}">
                                        </a>
                                    </div>
                                    <div class="post-item-description">
                                        <span class="post-meta-date"><i class="fa fa-calendar-o"></i></span>
                                        <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i></a></span>
                                        <h2><a href="MentorProfileServlet?cvId=${member.cvID}">
                                                ${member.fullName}
                                            </a></h2>
                                        <div class="star-rating" data-rating="${member.starAVG}">
                                            <!-- Render star rating here if available -->
                                        </div>
                                        <p>Learn:
                                            <c:forEach items="${member.listSkills}" var="skill">
                                                ${skill.skillName}
                                                <c:if test="${not loop.last}">,</c:if>
                                            </c:forEach>
                                        </p>
                                        <!--  <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a-->
                                        <div id="te" class="rating">
                                            <!-- Your additional rating or content here -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                    </c:forEach>
 </div>

                    <!--                             end: Post item-->
                    <!--                         Post item-->
                    <!--                            <div class="post-item border">
                                                    <div class="post-item-wrap">
                                                        <div class="post-image">
                                                            <a href="#">
                                                                <img alt="" src="img/react.png" width="356" height="200">
                                                            </a>
                                                            <span class="post-meta-category"><a href="">Science</a></span>
                                                        </div>
                                                        <div class="post-item-description">
                                                            <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2024</span>
                                                            <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                                                    Comments</a></span>
                                                            <h2><a href="#">The Complete JavaScript Course 2024: From Zero to Expert!
                                                                </a></h2>
                                                            <p>The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!.</p>
                                                            <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div>-->
                    <!--                            end: Post item-->
                    <!--                            Post item-->
                    <!--                            <div class="post-item border">
                                                    <div class="post-item-wrap">
                                                        <div class="post-image">
                                                            <a href="#">
                                                                <img alt="" src="img/python.jpg">
                                                            </a>
                                                            <span class="post-meta-category"><a href="">Science</a></span>
                                                        </div>
                                                        <div class="post-item-description">
                                                            <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2024</span>
                                                            <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                                                    Comments</a></span>
                                                            <h2><a href="#">100 Days of Code: The Complete Python Pro Bootcamp
                                                                </a></h2>
                                                            <p>Master Python by building 100 projects in 100 days. Learn data science, automation, build websites, games and apps!.</p>
                                                            <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div>-->
                    <!-- end: Post item-->
                </div>
        </div>
    </section>
    <section class="background-grey">
        <div class="container">
            <div class="heading-text heading-section text-center">
                <!--                        <h2>TOP 5 MENTOR WE SUGGEST</h2>
                                        <p>Meet the Dream Team: The People Powering Our Vision.</p>
                                    </div>
                                    <div class="row team-members">
                                       
                                            <div class="col-lg-3">
                                                <div class="team-member">
                                                    <div class="team-image">
                                                        <a href="MentorProfileServlet?mentorName=">
                                                            <img src="./img/" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="team-desc">
                                                        <h3>
                                                            <a href="MentorProfileServlet?mentorName="></a>
                                                        </h3>
                                                        <div>
                                                            
                                                        </div>
                                                        <div id="te" class="rating">
                                                            <div class="star-rating" data-rating="">
                
                                                            </div>
                                                        </div>
                                                        <div class="align-center">
                                                            <a class="btn btn-xs btn-slide btn-light" href="#">
                                                                <i class="fab fa-facebook-f"></i>
                                                                <span>Facebook</span>
                                                            </a>
                                                            <a class="btn btn-xs btn-slide btn-light" href="#" data-width="100">
                                                                <i class="fab fa-twitter"></i>
                                                                <span>Twitter</span>
                                                            </a>
                                                            <a class="btn btn-xs btn-slide btn-light" href="#" data-width="118">
                                                                <i class="fab fa-instagram"></i>
                                                                <span>Instagram</span>
                                                            </a>
                                                            <a class="btn btn-xs btn-slide btn-light" href="#" data-width="80">
                                                                <i class="icon-mail"></i>
                                                                <span>Mail</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                    </div>-->


                </section>
            <div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <h3>About FMaster</h3>
                <p>FMaster is the ultimate destination for creative minds. Whether you're here to learn, create, or be inspired, your journey starts now.</p>
            </div>
            <div class="col-lg-4">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="faq.jsp">FAQ</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h3>Contact Us</h3>
                <p>Email: support@fmaster.com</p>
                <p>Phone: +123-456-7890</p>
                <p>Address: 1234 FMaster St, Knowledge City, IN 56789</p>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <p>&copy; 2024 FMaster. All rights reserved.</p>
        </div>
    </div>
</div>
                <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
                <script src="js/jquery.js"></script>
                <script src="js/plugins.js"></script>
                <script src="js/functions.js"></script>
                </body>

                </html>
