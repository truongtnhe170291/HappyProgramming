<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>HexaDash</title>
           <jsp:include page="style/linkcss.jsp" />

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
   <jsp:include page="style/linkJS.jsp" />

</body>

</html>