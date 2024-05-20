<%-- 
    Document   : Comment
    Created on : May 19, 2024, 9:20:17 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>FMASTER</title>
          <jsp:include page="style/linkcss.jsp" />

   <style>
                    .comment-list__textarea {
                 width: 100%;
                 height: 100px; 
                 padding: 10px;
                 border: 1px solid #ccc;
                 border-radius: 5px;
                 font-size: 14px;
                 resize: vertical; 
                 box-sizing: border-box;
             }

             .comment-list__textarea:focus {
                 border-color: #66afe9;
                 outline: none;
                 box-shadow: 0 0 8px rgba(102, 175, 233, 0.6);
             }

   </style>
</head>

<body class="layout-light side-menu">
   <div class="mobile-search">
      <form action="/" class="search-form">
         <img src="img/svg/search.svg" alt="search" class="svg">
         <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..." aria-label="Search">
      </form>
   </div>
   <div class="mobile-author-actions"></div>

   <main class="main-content">

      <div class="contents">

         <div class="dm-page-content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-lg-12">

                     <div class="breadcrumb-main">
                        <h4 class="text-capitalize breadcrumb-title">Comment</h4>
                        <div class="breadcrumb-action justify-content-center flex-wrap">

                        </div>
                     </div>

                  </div>
                  <div class="col-12">
                     <div class="card card-default card-md mb-4">
                        <div class="card-header py-20">
                           <h6>Usage with list</h6>
                        </div>
                        <div class="card-body">
                           <div class="comment-list">
                         <textarea class="comment-list__textarea" placeholder="Reply to"></textarea>

 
                              <ul class="comment-list__content">
                                 <li class="mb-20">
                                    <div class="dm-comment-box media">
                                       <div class="dm-comment-box__author">
                                          <figure>
                                             <img src="img/author/1.jpg" class="bg-opacity-primary d-flex" alt="Admin Autor">
                                          </figure>
                                       </div><!-- ends: .dm-comment-box__author -->
                                       <div class="dm-comment-box__content media-body">
                                          <div class="comment-content-inner cci">
                                             <span class="cci__author-info">David</span>
                                             <p class="cci__comment-text">We supply a series of design principles, practical patterns and high quality
                                                design resources (Sketch and Axure), to help people create their product prototypes beautifully and
                                                efficiently.</p>
                                             <div class="cci__comment-actions">

                                                <a href="#" class="btn-like">
                                                   <img class="svg" src="img/svg/thumbs-up.svg" alt="thumbs-up">
                                                   <span class="line-count">0</span>
                                                </a>
                                                <a href="#" class="btn-dislike">
                                                   <img src="img/svg/thumbs-down.svg" alt="thumbs-down" class="svg">
                                                   <span class="line-count">0</span>
                                                </a>

                                                <a href="#" class="btn-reply">
                                                   <span>Reply</span>
                                                </a>
                                             </div><!-- ends: .cci__comment-actions -->
                                          </div>
                                       </div><!-- ends: .dm-comment-box__content -->
                                    </div><!-- ends: .dm-comment-box -->


                                 </li>
                                 <li>


                                    <div class="dm-comment-box media">
                                       <div class="dm-comment-box__author">
                                          <figure>
                                             <img src="img/author/1.jpg" class="bg-opacity-primary d-flex" alt="Admin Autor">
                                          </figure>
                                       </div><!-- ends: .dm-comment-box__author -->
                                       <div class="dm-comment-box__content media-body">
                                          <div class="comment-content-inner cci">
                                             <span class="cci__author-info">David</span>
                                             <p class="cci__comment-text">We supply a series of design principles, practical patterns and high quality
                                                design resources (Sketch and Axure), to help people create their product prototypes beautifully and
                                                efficiently.</p>
                                             <div class="cci__comment-actions">

                                                <a href="#" class="btn-like">
                                                   <img class="svg" src="img/svg/thumbs-up.svg" alt="thumbs-up">
                                                   <span class="line-count">0</span>
                                                </a>
                                                <a href="#" class="btn-dislike">
                                                   <img src="img/svg/thumbs-down.svg" alt="thumbs-down" class="svg">
                                                   <span class="line-count">0</span>
                                                </a>

                                                <a href="#" class="btn-reply">
                                                   <span>Reply</span>
                                                </a>
                                             </div><!-- ends: .cci__comment-actions -->
                                          </div>
                                       </div><!-- ends: .dm-comment-box__content -->
                                    </div><!-- ends: .dm-comment-box -->


                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <!-- ends: .card -->

 
                     <!-- ends: .card -->
                  </div>
                  <!-- ends: .col-12 -->
               </div>
            </div>
         </div>
         <!-- ends: .dm-page-content -->


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
