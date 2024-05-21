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
        <meta name="description" content="Themeforest Template Polo, html template">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Document title -->
        <title>Fmaster</title>
        <!-- Stylesheets & Fonts -->
        <link href="css/plugins.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Body Inner -->
        <div class="body-inner">
            <!-- Header -->
            <jsp:include page="header.jsp"/>
            <!-- end: Header -->
            <!-- Inspiro Slider -->
            <div id="slider" class="inspiro-slider slider-fullscreen dots-creative" data-fade="true">
                <!-- Slide 1 -->
                <div class="slide" data-bg-video="video/pexels-waves.mp4">
                    <div class="bg-overlay"></div>
                    <div class="container">
                        <div class="slide-captions text-center text-light">
                            <!-- Captions -->
                            <h1 data-caption-animate="zoom-out">WELCOME TO THE WORLD OF POLO</h1>
                            <p>Say hello to the smartest and most flexible bootstrap template. Polo is an powerful template that can build any type of websites, and quite possibly the only one you will ever need.</p>
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
                            <h1>220+ Laytout Demos</h1>
                            <p class="text-small">POLO is packed with 220+ pre-made layouts that allow you to quickly jumpstart your project. Completely customizable for creating your own designs.</p>
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
                        <span class="lead">Create amam ipsum dolor sit amet, Beautiful nature, and rare feathers!.</span>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="0">
                                <h4>Modern Design</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="200">
                                <h4>Loaded with Features</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="400">
                                <h4>Completely Customizable</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="600">
                                <h4>100% Responsive Layout</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="800">
                                <h4>Clean Modern Code</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div data-animate="fadeInUp" data-animate-delay="1000">
                                <h4>Free Updates & Support</h4>
                                <p>Lorem ipsum dolor sit amet, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam.</p>
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
                        <span class="lead">Lorem ipsum dolor sit amet, coper suscipit lobortis nisl ut aliquip ex ea commodo
                            consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
                            consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto.</span>
                    </div>
                </div>
                <div class="portfolio">
                    <!-- Portfolio Items -->
                    <div id="portfolio" class="grid-layout portfolio-4-columns" data-margin="0">
                        <!-- portfolio item -->
                        <div class="portfolio-item no-overlay ct-photography ct-media ct-branding ct-Media ct-webdesign">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-slider">
                                    <div class="carousel dots-inside dots-dark arrows-dark" data-items="1" data-loop="true" data-autoplay="true" data-animate-in="fadeIn" data-animate-out="fadeOut" data-autoplay="1500">
                                        <a href="#"><img src="images/portfolio/64.jpg" alt=""></a>
                                        <a href="#"><img src="images/portfolio/70.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
                        <div class="portfolio-item img-zoom ct-photography ct-marketing ct-media">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img src="images/portfolio/60.jpg" alt=""></a>
                                </div>
                                <div class="portfolio-description">
                                    <a title="Paper Pouch!" data-lightbox="image" href="images/portfolio/83l.jpg"><i class="icon-maximize"></i></a>
                                    <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
                        <div class="portfolio-item img-zoom ct-photography ct-media ct-branding ct-Media">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img src="images/portfolio/61.jpg" alt=""></a>
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
                                    <a href="#"><img src="images/portfolio/65.jpg" alt=""></a>
                                </div>
                                <div class="portfolio-description" data-lightbox="gallery">
                                    <a title="Photoshop Mock-up!" data-lightbox="gallery-image" href="images/portfolio/80l.jpg"><i class="icon-copy"></i></a>
                                    <a title="Paper Pouch!" data-lightbox="gallery-image" href="images/portfolio/81l.jpg" class="hidden"></a>
                                    <a title="Mock-up" data-lightbox="gallery-image" href="images/portfolio/82l.jpg" class="hidden"></a>
                                    <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
                        <div class="portfolio-item img-zoom ct-marketing ct-media ct-branding ct-marketing ct-webdesign">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img src="images/portfolio/66.jpg" alt=""></a>
                                </div>
                                <div class="portfolio-description">
                                    <a href="portfolio-page-grid-gallery.html">
                                        <h3>Last Iceland Sunshine</h3>
                                        <span>Graphics</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
                        <div class="portfolio-item img-zoom ct-photography ct-media ct-branding ct-marketing ct-webdesign">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img src="images/portfolio/67.jpg" alt=""></a>
                                </div>
                                <div class="portfolio-description">
                                    <a title="Paper Pouch!" data-lightbox="iframe" href="https://www.youtube.com/watch?v=k6Kly58LYzY"><i class="icon-play"></i></a>
                                    <a href="portfolio-page-grid-gallery.html"><i class="icon-link"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="portfolio-item no-overlay ct-photography ct-media ct-branding ct-Media ct-marketing ct-webdesign">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-slider">
                                    <div class="carousel dots-inside dots-dark arrows-dark" data-items="1" data-loop="true" data-autoplay="true" data-animate-in="fadeIn" data-animate-out="fadeOut">
                                        <a href="#"><img src="images/portfolio/68.jpg" alt=""></a>
                                        <a href="#"><img src="images/portfolio/71.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                        <!-- portfolio item -->
                        <div class="portfolio-item img-zoom ct-photography ct-marketing ct-media">
                            <div class="portfolio-item-wrap">
                                <div class="portfolio-image">
                                    <a href="#"><img src="images/portfolio/69.jpg" alt=""></a>
                                </div>
                                <div class="portfolio-description">
                                    <a href="portfolio-page-grid-gallery.html">
                                        <h3>Luxury Wine</h3>
                                        <span>Graphics / Branding</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- end: portfolio item -->
                    </div>
                    <!-- end: Portfolio Items -->
                </div>
            </section>
            <section class="content background-grey">
                <div class="container">
                    <div class="heading-text heading-section">
                        <h2>OUR BLOG</h2>
                        <span class="lead">The most happiest time of the day!. Morbi sagittis, sem quis lacinia faucibus,
                            orci ipsum gravida tortor, vel interdum mi sapien ut justo. Nulla varius consequat magna, id
                            molestie ipsum volutpat quis. A true story, that never been told!. Fusce id mi diam, non ornare
                            orci. Pellentesque ipsum erat, facilisis ut venenatis eu, sodales vel dolor. </span>
                    </div>
                    <div id="blog" class="grid-layout post-3-columns m-b-30" data-item="post-item">
                        <!-- Post item-->
                        <div class="post-item border">
                            <div class="post-item-wrap">
                                <div class="post-image">
                                    <a href="#">
                                        <img alt="" src="images/blog/12.jpg">
                                    </a>
                                    <span class="post-meta-category"><a href="">Lifestyle</a></span>
                                </div>
                                <div class="post-item-description">
                                    <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                    <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                            Comments</a></span>
                                    <h2><a href="#">Standard post with a single image
                                        </a></h2>
                                    <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
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
                                        <img alt="" src="images/blog/17.jpg">
                                    </a>
                                    <span class="post-meta-category"><a href="">Science</a></span>
                                </div>
                                <div class="post-item-description">
                                    <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                    <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                            Comments</a></span>
                                    <h2><a href="#">Standard post with a single image
                                        </a></h2>
                                    <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
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
                                        <img alt="" src="images/blog/18.jpg">
                                    </a>
                                    <span class="post-meta-category"><a href="">Science</a></span>
                                </div>
                                <div class="post-item-description">
                                    <span class="post-meta-date"><i class="fa fa-calendar-o"></i>Jan 21, 2017</span>
                                    <span class="post-meta-comments"><a href=""><i class="fa fa-comments-o"></i>33
                                            Comments</a></span>
                                    <h2><a href="#">Standard post with a single image
                                        </a></h2>
                                    <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet.</p>
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
                        <h2>MEET OUR TEAM</h2>
                        <p>Lorem ipsum dolor sit amet, consecte adipiscing elit. Suspendisse condimentum porttitor cursumus.
                        </p>
                    </div>
                    <div class="row team-members">
                        <div class="col-lg-3">
                            <div class="team-member">
                                <div class="team-image">
                                    <img src="images/team/6.jpg">
                                </div>
                                <div class="team-desc">
                                    <h3>Alea Smith</h3>
                                    <span>Software Developer</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing tristique hendrerit laoreet. </p>
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
                                        <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80">
                                            <i class="icon-mail"></i>
                                            <span>Mail</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="team-member">
                                <div class="team-image">
                                    <img src="images/team/7.jpg">
                                </div>
                                <div class="team-desc">
                                    <h3>Ariol Doe</h3>
                                    <span>Software Developer</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing tristique hendrerit laoreet. </p>
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
                                        <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80">
                                            <i class="icon-mail"></i>
                                            <span>Mail</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="team-member">
                                <div class="team-image">
                                    <img src="images/team/8.jpg">
                                </div>
                                <div class="team-desc">
                                    <h3>Emma Ross</h3>
                                    <span>Software Developer</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing tristique hendrerit laoreet. </p>
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
                                        <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80">
                                            <i class="icon-mail"></i>
                                            <span>Mail</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="team-member">
                                <div class="team-image">
                                    <img src="images/team/9.jpg">
                                </div>
                                <div class="team-desc">
                                    <h3>Victor Loda</h3>
                                    <span>Software Developer</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing tristique hendrerit laoreet. </p>
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
                                        <a class="btn btn-xs btn-slide btn-light" href="mailto:#" data-width="80">
                                            <i class="icon-mail"></i>
                                            <span>Mail</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
            <script src="js/jquery.js"></script>
            <script src="js/plugins.js"></script>
            <script src="js/functions.js"></script>
    </body>

</html>
