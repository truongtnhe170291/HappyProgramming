<%-- 
    Document   : blog_skill
    Created on : May 20, 2024, 8:28:55 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="INSPIRO" />
    <meta name="description" content="Themeforest Template Polo, html template">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document title -->
    <title>POLO | The Multi-Purpose HTML5 Template</title>
    <!-- Stylesheets & Fonts -->
    <link href="css/plugins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Body Inner -->
    <div class="body-inner">
        <!-- Header -->
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
                                    <li class="dropdown"><a href="detailCourse.jsp">Features</a>
                                        <ul class="dropdown-menu"> 
                                                    <li><a href="blog_skill.jsp">Mentor detail</a></li>
                                                    <li><a href="user_info.jsp">CV</a></li>                            
                                        </ul>
                                    </li>
                                     <li><a href="login.jsp">Login</a></li>
                                      <li><a href="sign_up.jsp">Sign up</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!--END: NAVIGATION-->
                </div>
            </div>
        </header>
        <!-- end: Header -->
        <!-- Content -->
        <section id="page-content">
            <div class="container">
                <!-- post content -->
                <!-- Portfolio Filter -->
                <nav class="grid-filter gf-outline" data-layout="#blog">
                    <ul>
                        <li class="active"><a href="#" data-category="*">Show All</a></li>
                        <li><a href="#" data-category=".bc-general">General</a></li>
                        <li><a href="#" data-category=".bc-music">Music</a></li>
                        <li><a href="#" data-category=".bc-economics">Economics</a></li>
                        <li><a href="#" data-category=".bc-medical">medical</a></li>
                        <li><a href="#" data-category=".bc-sport">Sport</a></li>
                        <li><a href="#" data-category=".bc-science">Science</a></li>
                    </ul>
                    <div class="grid-active-title">Show All</div>
                </nav>
                <!-- end: Portfolio Filter -->
                <!-- Blog -->
                <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">
                    <!-- Post item-->
                    <div class="post-item border bc-general bc-music bc-economics bc-medical bc-sport bc-science">
                        <div class="post-item-wrap">
                            <div class="post-image">
                                <a href="detailCourse.jsp">
                                    <img alt="" src="images/blog/12.jpg">
                                </a>
                                <span class="post-meta-category"><a href="">Lifestyle</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Standard post with a single image
                                    </a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item-->
                    <!-- Post item-->
                    <div class="post-item border bc-medical bc-sport bc-science">
                        <div class="post-item-wrap">
                            <div class="post-slider">
                                <div class="carousel dots-inside arrows-visible arrows-only" data-items="1" data-loop="true" data-autoplay="true" data-lightbox="gallery">
                                    <a href="images/blog/11.jpg" data-lightbox="gallery-image">
                                        <img alt="" src="images/blog/16.jpg">
                                    </a>
                                    <a href="images/blog/16.jpg" data-lightbox="gallery-image">
                                        <img alt="" src="images/blog/11.jpg">
                                    </a>
                                </div>
                                <span class="post-meta-category"><a href="">Technology</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Simplicity, a post with slider gallery</a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item-->
                    <!-- Post item-->
                    <div class="post-item border bc-general bc-music bc-economics">
                        <div class="post-item-wrap">
                            <div class="post-image">
                                <a href="detailCourse.jsp">
                                    <img alt="" src="images/blog/17.jpg">
                                </a>
                                <span class="post-meta-category"><a href="">Science</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Standard post with a single image
                                    </a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>


                    <div class="post-item border bc-general bc-economics">
                        <div class="post-item-wrap">
                            <div class="post-image">
                                <a href="detailCourse.jsp">
                                    <img alt="" src="images/blog/18.jpg">
                                </a>
                                <span class="post-meta-category"><a href="">Science</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Standard post with a single image
                                    </a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item-->
                    <!-- Post item YouTube-->
                    <div class="post-item border bc-medical bc-sport bc-science">
                        <div class="post-item-wrap">
                            <div class="post-video">
                                <div class="ratio ratio-16x9">
                                    <iframe width="560" height="376" src="https://www.youtube.com/embed/dA8Smj5tZOQ" frameborder="0" allowfullscreen></iframe>
                                </div>
                                <span class="post-meta-category"><a href="">Video</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">This is a example post with YouTube</a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More </a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item YouTube-->
                    <!-- Post item-->
                    <div class="post-item border bc-general bc-music bc-economics bc-medical">
                        <div class="post-item-wrap">
                            <div class="post-slider">
                                <div class="carousel dots-inside arrows-visible arrows-only" data-autoplay="2600" data-animate-in="fadeIn" data-animate-out="fadeOut" data-items="1" data-loop="true" data-lightbox="gallery">
                                    <a href="images/blog/19.jpg" data-lightbox="gallery-image">
                                        <img alt="" src="images/blog/19.jpg">
                                    </a>
                                    <a href="images/blog/20.jpg" data-lightbox="gallery-image">
                                        <img alt="" src="images/blog/20.jpg">
                                    </a>
                                </div>
                                <span class="post-meta-category"><a href="">Technology</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Simplicity, a post with slider gallery</a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item-->
                    <!-- Post item-->
                    <div class="post-item border bc-economics bc-medical">
                        <div class="post-item-wrap">
                            <div class="post-image">
                                <a href="detailCourse.jsp">
                                    <img alt="" src="images/blog/14.jpg">
                                </a>
                                <span class="post-meta-category"><a href="">Lifestyle</a></span>
                            </div>
                            <div class="post-item-description">
                                <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33 Comments</a></span>
                                <h2><a href="detailCourse.jsp">Standard post with a single image
                                    </a></h2>
                                <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
                                <a href="#" class="item-link">Read More <i class="icon-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- end: Post item-->
                </div>
                <!-- end: Blog -->
                <!-- Pagination -->
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item active"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
                <!-- end: Pagination -->
            </div>
            <!-- end: post content -->
        </section>
        <!-- end: Content -->

    </div>
    <!-- end: Body Inner -->
    <!-- Scroll top -->
    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
    <!--Plugins-->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/functions.js"></script>
</body>

</html>
