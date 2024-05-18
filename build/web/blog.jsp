<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>HexaDash</title>

   <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600;700&display=swap" rel="stylesheet">

   <!-- inject:css-->

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

<link rel="stylesheet" type="text/css" href="style/style.css">

   <!-- endinject -->

   <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">

   <!-- Fonts -->
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

</head>

<body class="layout-light side-menu">
    
   <div class="mobile-search">
      <form action="/" class="search-form">
         <img src="img/svg/search.svg" alt="search" class="svg">
         <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..." aria-label="Search">
      </form>
   </div>
   <div class="mobile-author-actions"></div>
   <jsp:include page="control_nav.jsp" />

   <main class="main-content">

      <jsp:include page="sidebar.jsp" />

      <div class="contents">


         <div class="blog-page">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">

                     <div class="breadcrumb-main">
                        <h4 class="text-capitalize breadcrumb-title">Blog</h4>
                        <div class="breadcrumb-action justify-content-center flex-wrap">
                           <nav aria-label="breadcrumb">
                              <ol class="breadcrumb">
                                 <li class="breadcrumb-item"><a href="#"><i class="uil uil-estate"></i>Dashboard</a></li>
                                 <li class="breadcrumb-item"><a href="#">Pages</a></li>
                                 <li class="breadcrumb-item active" aria-current="page">Blog style</li>
                              </ol>
                           </nav>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg2.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">The Ultimate Glossary of Terms About</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg3.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">Multiple Dashboard Design Idea</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg4.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">How to Create a Niche Based Dashboard</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg2.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">The Ultimate Glossary of Terms About</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg3.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">Multiple Dashboard Design Idea</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg4.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">How to Create a Niche Based Dashboard</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg2.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">The Ultimate Glossary of Terms About</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg3.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">Multiple Dashboard Design Idea</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-xl-4 col-md-6 mb-25">

                     <div class="blog-card">
                        <div class="blog-card__thumbnail">
                           <a href="#">
                              <img src="img/bg4.png" alt="">
                           </a>
                        </div>
                        <div class="blog-card__details">
                           <div class="blog-card__content">
                              <div class="blog-card__title--top">15 March 2021</div>
                              <h4 class="blog-card__title">
                                 <a href="#" class="entry-title" rel="bookmark">How to Create a Niche Based Dashboard</a>
                              </h4>
                              <p>There are many variations of passages of majority have suffered alteration in some form</p>
                           </div>
                           <div class="blog-card__meta">
                              <div class="blog-card__meta-profile">
                                 <img src="img/alex-suprun.png" alt="">
                                 <span>Machel Bold</span>
                              </div>
                              <div class="blog-card__meta-count">
                                 <ul>
                                    <li>
                                       <div class="blog-card__meta-reaction">
                                          <img src="img/svg/heart.svg" alt="heart" class="svg">
                                          <span class="blog-card__meta-reaction-like">15 K</span>
                                       </div>
                                    </li>
                                    <li>
                                       <div class="blog-card__meta-doc-wrapper">
                                          <img src="img/svg/file-text.svg" alt="file-text" class="svg">
                                          <span class="blog-card__meta-doc">75</span>
                                       </div>
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
                  <div class="col-12">
                     <div class="d-flex justify-content-end mt-1 mb-50">

                        <nav class="dm-page ">
                           <ul class="dm-pagination d-flex">
                              <li class="dm-pagination__item">
                                 <a href="#" class="dm-pagination__link pagination-control"><span class="la la-angle-left"></span></a>
                                 <a href="#" class="dm-pagination__link"><span class="page-number">1</span></a>
                                 <a href="#" class="dm-pagination__link active"><span class="page-number">2</span></a>
                                 <a href="#" class="dm-pagination__link"><span class="page-number">3</span></a>
                                 <a href="#" class="dm-pagination__link pagination-control"><span class="page-number">...</span></a>
                                 <a href="#" class="dm-pagination__link"><span class="page-number">12</span></a>
                                 <a href="#" class="dm-pagination__link pagination-control"><span class="la la-angle-right"></span></a>
                                 <a href="#" class="dm-pagination__option">
                                 </a>
                              </li>
                              <li class="dm-pagination__item">
                                 <div class="paging-option">
                                    <select name="page-number" class="page-selection">
                                       <option value="20">20/page</option>
                                       <option value="40">40/page</option>
                                       <option value="60">60/page</option>
                                    </select>
                                 </div>
                              </li>
                           </ul>
                        </nav>


                     </div>
                  </div>
               </div>
               <!-- ends: .row -->
            </div>
         </div>

      </div>
      <footer class="footer-wrapper">
         <div class="footer-wrapper__inside">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6">
                     <div class="footer-copyright">
                        <p><span>© 2023</span><a href="#">Sovware</a>
                        </p>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="footer-menu text-end">
                        <ul>
                           <li>
                              <a href="#">About</a>
                           </li>
                           <li>
                              <a href="#">Team</a>
                           </li>
                           <li>
                              <a href="#">Contact</a>
                           </li>
                        </ul>
                     </div>
                     <!-- ends: .Footer Menu -->
                  </div>
               </div>
            </div>
         </div>
      </footer>
   </main>
   <div id="overlayer">
      <div class="loader-overlay">
         <div class="dm-spin-dots spin-lg">
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
            <span class="spin-dot badge-dot dot-primary"></span>
         </div>
      </div>
   </div>
   <div class="overlay-dark-sidebar"></div>
   <div class="customizer-overlay"></div>
   <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBgYKHZB_QKKLWfIRaYPCadza3nhTAbv7c"></script>
   <!-- inject:js-->
   <script src="assets/vendor_assets/js/jquery/jquery-3.5.1.min.js"></script>
   <script src="assets/vendor_assets/js/jquery/jquery-ui.js"></script>
   <script src="assets/vendor_assets/js/bootstrap/popper.js"></script>
   <script src="assets/vendor_assets/js/bootstrap/bootstrap.min.js"></script>
   <script src="assets/vendor_assets/js/moment/moment.min.js"></script>
   <script src="assets/vendor_assets/js/accordion.js"></script>
   <script src="assets/vendor_assets/js/apexcharts.min.js"></script>
   <script src="assets/vendor_assets/js/autoComplete.js"></script>
   <script src="assets/vendor_assets/js/Chart.min.js"></script>
   <script src="assets/vendor_assets/js/daterangepicker.js"></script>
   <script src="assets/vendor_assets/js/drawer.js"></script>
   <script src="assets/vendor_assets/js/dynamicBadge.js"></script>
   <script src="assets/vendor_assets/js/dynamicCheckbox.js"></script>
   <script src="assets/vendor_assets/js/footable.min.js"></script>
   <script src="assets/vendor_assets/js/fullcalendar@5.2.0.js"></script>
   <script src="assets/vendor_assets/js/google-chart.js"></script>
   <script src="assets/vendor_assets/js/jquery-jvectormap-2.0.5.min.js"></script>
   <script src="assets/vendor_assets/js/jquery-jvectormap-world-mill-en.js"></script>
   <script src="assets/vendor_assets/js/jquery.countdown.min.js"></script>
   <script src="assets/vendor_assets/js/jquery.filterizr.min.js"></script>
   <script src="assets/vendor_assets/js/jquery.magnific-popup.min.js"></script>
   <script src="assets/vendor_assets/js/jquery.peity.min.js"></script>
   <script src="assets/vendor_assets/js/jquery.star-rating-svg.min.js"></script>
   <script src="assets/vendor_assets/js/leaflet.js"></script>
   <script src="assets/vendor_assets/js/leaflet.markercluster.js"></script>
   <script src="assets/vendor_assets/js/loader.js"></script>
   <script src="assets/vendor_assets/js/message.js"></script>
   <script src="assets/vendor_assets/js/moment.js"></script>
   <script src="assets/vendor_assets/js/muuri.min.js"></script>
   <script src="assets/vendor_assets/js/notification.js"></script>
   <script src="assets/vendor_assets/js/popover.js"></script>
   <script src="assets/vendor_assets/js/select2.full.min.js"></script>
   <script src="assets/vendor_assets/js/slick.min.js"></script>
   <script src="assets/vendor_assets/js/trumbowyg.min.js"></script>
   <script src="assets/vendor_assets/js/wickedpicker.min.js"></script>
   <script src="assets/theme_assets/js/apexmain.js"></script>
   <script src="assets/theme_assets/js/charts.js"></script>
   <script src="assets/theme_assets/js/drag-drop.js"></script>
   <script src="assets/theme_assets/js/footable.js"></script>
   <script src="assets/theme_assets/js/full-calendar.js"></script>
   <script src="assets/theme_assets/js/googlemap-init.js"></script>
   <script src="assets/theme_assets/js/icon-loader.js"></script>
   <script src="assets/theme_assets/js/jvectormap-init.js"></script>
   <script src="assets/theme_assets/js/leaflet-init.js"></script>
   <script src="assets/theme_assets/js/main.js"></script>
   <!-- endinject-->
</body>

</html>