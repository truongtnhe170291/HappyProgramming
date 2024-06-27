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
            

        </style>
    </head>

    <body>
        <div class="body-inner">
            <!-- Header -->
            <jsp:include page="header.jsp"/>
            <div id="slider" class="inspiro-slider slider-fullscreen dots-creative" data-fade="true">
                <!-- Slide 1 -->
                <div class="slide" data-bg-video="video/pexels-waves.mp4">
                    <div class="bg-overlay"></div>
                    <div class="container">
                        <div class="slide-captions text-center text-light">
                            <!-- Captions -->
                            <h1 data-caption-animate="zoom-out">WELCOME TO THE WORLD OF FMASTER</h1>
                            <p>Welcome aboard FMaster—the ultimate destination for creative minds. Whether you're here to learn, to create, or to be inspired, your journey starts now. So, dive in, explore, and let your imagination soar. The world of FMaster is yours to conquer..</p>
                            <div><a href="#welcome" class="btn btn-primary scroll-to">Explore more</a></div>

                            <!-- end: Captions -->
                        </div>
                    </div>
                </div>
                <!-- end: Slide 1 -->
                <!-- Slide 2 -->
                <div class="slide" data-bg-video="video/pexels-waves.mp4">
                    <div class="bg-overlay"></div>
                    <div class="container">
                        <div class="slide-captions text-start text-light">
                            <!-- Captions -->
                            <h1>100+ Quality mentors</h1>
                            <p class="text-small">FMASTER: Discover & Develop Your Passion for Programming with Mentor Code: Detailed Instructions from Basic to Advanced</p>
                            <div><a href="#welcome" class="btn btn-primary scroll-to">Explore more</a></div>
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
                        <div class="portfolio-item img-zoom ct-photography ct-marketing ct-media">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img class="test" src="img/C.jpg" alt=""></a>

                                </div>
                                <div class="portfolio-description">
                                    <a title="Paper Pouch!" data-lightbox="image" href="img/C.jpg"><i class="icon-maximize"></i></a>
                                    <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
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
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
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
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
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
                    </div>
                    <!-- end: Portfolio Items -->
                </div>
            </section>
            <section class="content background-grey">
                <div class="container">
                    <div class="heading-text heading-section">
                        <h2>OUR BLOG</h2>
                        <span class="lead">Join the Conversation: Engage with Industry Trends, Best Practices, and Community Discussions on Our Blog. </span>
                    </div>
                    <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">
                        <!-- Post item-->
                        <div class="post-item border">
                            <div class="post-item-wrap">
                                <div class="post-image">
                                    <a href="#">
                                        <img alt="" src="img/CD.png">
                                    </a>
                                    <span class="post-meta-category"><a href="">Lifestyle</a></span>
                                </div>
                                <div class="post-item-description">
                                    <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2024</span>
                                    <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                            Comments</a></span>
                                    <h2><a href="#">Ultimate C# Masterclass for 2024
                                        </a></h2>
                                    <p>In-depth .NET programming course from basics to advanced. Focus on clean code, performance and practice.</p>
                                    <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- end: Post item-->
                        <!-- Post item-->
                        <div class="post-item border">
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
                        </div>
                        <!-- end: Post item-->
                        <!-- Post item-->
                        <div class="post-item border">
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
                        </div>
                        <!-- end: Post item-->
                    </div>
                </div>
            </section>
            <section class="background-grey">
                <div class="container">
                    <div class="heading-text heading-section text-center">
                        <h2>TOP 5 MENTOR WE SUGGEST</h2>
                        <p>Meet the Dream Team: The People Powering Our Vision.</p>
                    </div>
                    <div class="row team-members">
                        <c:forEach items="${requestScope.topMentors}" var="member">
                            <div class="col-lg-3">
                                <div class="team-member">
                                    <div class="team-image">
                                        <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">
                                            <img src="./img/${member.avatar}" alt="${member.mentorName}">
                                        </a>
                                    </div>
                                    <div class="team-desc">
                                        <h3>
                                            <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">${member.getFullName()}</a>
                                        </h3>
                                        <div>
                                            <c:forEach items="${member.listSkills}" var="skill">
                                                <p>${skill.skillName}</p>
                                            </c:forEach>
                                        </div>
                                        <div id="te" class="rating">
                                            <div class="star-rating" data-rating="${member.starAVG}">

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
                        </c:forEach>
                    </div>



            </section>
            <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
            <script src="js/jquery.js"></script>
            <script src="js/plugins.js"></script>
            <script src="js/functions.js"></script>
    </body>

</html>
