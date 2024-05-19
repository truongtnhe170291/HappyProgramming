<%-- 
    Document   : Productdetail
    Created on : May 19, 2024, 9:18:07 AM
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
   <title>HexaDash</title>
   <jsp:include page="style/linkcss.jsp" />


   <style>
       .Comment{
           transform: translateY(-200px);
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
    <jsp:include page="control_nav.jsp" />

   <main class="main-content">

      <jsp:include page="sidebar.jsp" />

      <div class="contents">

         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-12">
                  <div class="shop-breadcrumb">

                     <div class="breadcrumb-main">
                        <h4 class="text-capitalize breadcrumb-title">Product Details</h4>
                        <div class="breadcrumb-action justify-content-center flex-wrap">
                           <nav aria-label="breadcrumb">
                              <ol class="breadcrumb">
                                 <li class="breadcrumb-item"><a href="#"><i class="uil uil-estate"></i>Dashboard</a></li>
                                 <li class="breadcrumb-item active" aria-current="page">Product Details</li>
                              </ol>
                           </nav>
                        </div>
                     </div>

                  </div>
               </div>
            </div>
         </div>
         <div class="products mb-30">
            <div class="container-fluid">
               <!-- Start: Card -->
               <div class="card product-details h-100 border-0">
                  <div class="product-item d-flex p-sm-50 p-20">
                     <div class="row">
                        <div class="col-lg-5">
                           <!-- Start: Product Slider -->
                           <div class="product-item__image">
                              <div class="wrap-gallery-article carousel slide carousel-fade" id="carouselExampleCaptions" data-bs-ride="carousel">
                                 <div>
                                    <div class="carousel-inner">
                                       <div class="carousel-item active">
                                          <img class="img-fluid d-flex bg-opacity-primary " src="img/furniture.jpg" alt="Card image cap" title="">
                                       </div>
                                       <div class="carousel-item">
                                          <img class="img-fluid d-flex bg-opacity-primary" src="img/furniture2.jpg" alt="Card image cap" title="">
                                       </div>
                                       <div class="carousel-item">
                                          <img class="img-fluid d-flex bg-opacity-primary" src="img/furniture3.jpg" alt="Card image cap" title="">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="overflow-hidden">
                                    <!-- Bottom switcher of slider -->
                                    <ul class="reset-ul d-flex flex-wrap list-thumb-gallery">
                                       <li>
                                          <a href="#" class="thumbnail active" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" aria-current="true" aria-label="Slide 1">
                                             <img class="img-fluid d-flex" src="img/furniture.jpg" alt="">
                                          </a>
                                       </li>

                                       <li>
                                          <a href="#" class="thumbnail " data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2">
                                             <img class="img-fluid d-flex" src="img/furniture2.jpg" alt="">
                                          </a>
                                       </li>

                                       <li>
                                          <a href="#" class="thumbnail " data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3">
                                             <img class="img-fluid d-flex" src="img/furniture3.jpg" alt="">
                                          </a>
                                       </li>
                                    </ul>
                                 </div>

                              </div>
                           </div>
                           <!-- End: Product Slider -->
                        </div>
                        <div class=" col-lg-7">
                           <!-- Start: Product Details -->
                           <div class=" b-normal-b mb-25 pb-sm-35 pb-15 mt-lg-0 mt-15">
                              <div class="product-item__body">
                                 <!-- Start: Product Title -->
                                 <div class="product-item__title">
                                    <a href="#">
                                       <h1 class="card-title">
                                          This stools are also decently
                                          stored
                                       </h1>
                                    </a>
                                 </div>
                                 <!-- End: Product Title -->
                                 <div class="product-item__content text-capitalize">
                                    <!-- Start: Product Ratings -->
                                    <div class="stars-rating d-flex align-items-center">
                                       <span class="star-icon las la-star active"></span>
                                       <span class="star-icon las la-star active"></span>
                                       <span class="star-icon las la-star active"></span>
                                       <span class="star-icon las la-star active"></span>
                                       <span class="star-icon las la-star-half-alt active"></span>
                                       <span class="stars-rating__point">4.9</span>
                                       <span class="stars-rating__review">
                                          <span>778</span> Reviews</span>
                                    </div>
                                    <!-- End: Product Ratings -->
                                    <!-- Start: Product Brand -->
                                    <span class="product-details-brandName">Brand:<span>Louis
                                          Poulsen</span></span>
                                    <span class="product-desc-price">
                                       <sub>$</sub>200.00</span>
                                    <div class="d-flex align-items-center mb-2">
                                       <span class="product-price">$100.00</span>
                                       <span class="product-discount">50% Off</span>
                                    </div>
                                    <!-- End: Product Brand -->
                                    <!-- Start: Product Description -->
                                    <p class=" product-deatils-pera">Lorem ipsum dolor sit amet, consetetur
                                       sadipscing elitr, sed diam
                                       nonumy eirmod tempor invidunt ut labore et dolore magna.</p>
                                    <!-- End: Product Description -->

                                    <!-- Start: Product Stock -->
                                    <div class="product-details__availability">
                                       <div class="title">
                                          <p>Available:</p>
                                          <span class="stock">In stock</span>
                                       </div>
                                       <div class="title">
                                          <p>Shipping:</p>
                                          <span class="free"> Free</span>
                                       </div>
                                    </div>
                                    <!-- End: Product Stock -->
                                    <!-- Start: Product Quantity -->
                                    <div class="quantity product-quantity flex-wrap">
                                       <div class="me-15 d-flex align-items-center flex-wrap">
                                          <p class="fs-14 fw-500 color-dark">Quantity:</p>
                                          <input type="button" value="-" class="qty-minus bttn bttn-left wh-36">
                                          <input type="number" value="1" class="qty qh-36 input">
                                          <input type="button" value="+" class="qty-plus bttn bttn-right wh-36">
                                       </div>
                                       <span class="fs-13 fw-400 color-light my-sm-0 my-10">540 pieces available</span>
                                    </div>
                                    <!-- End: Product Quantity -->
                                    <!-- Start: Product Selections -->
                                    <div class="product-item__button mt-lg-30 mt-sm-25 mt-20 d-flex flex-wrap">
                                       <div class=" d-flex flex-wrap product-item__action align-items-center">
                                          <button class="btn btn-primary btn-default btn-squared border-0 me-10 my-sm-0 my-2">buy
                                             now</button>
                                          <button class="btn btn-secondary btn-default btn-squared border-0 px-25 my-sm-0 my-2 me-10">
                                             <img src="img/svg/shopping-bag.svg" alt="shopping-bag" class="svg">
                                             Add To Cart</button>
                                          <div class="like-icon">
                                             <button type="button">
                                                <i class="lar la-heart icon"></i>
                                             </button>
                                          </div>
                                          <div class="like-icon me-15 my-sm-0 my-3 ">
                                             <button type="button">
                                                <img class="svg" src="img/svg/share-2.svg" alt="share-2">
                                             </button>
                                          </div>
                                       </div>
                                       <div class="product-deatils__social my-xxl-0 my-10 d-flex align-items-center">
                                          <ul class="d-flex">
                                             <li>
                                                <a href="#">
                                                   <i class="lab la-facebook-f"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="lab la-twitter"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="lab la-pinterest"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="lab la-linkedin-in"></i>
                                                </a>
                                             </li>
                                             <li>
                                                <a href="#">
                                                   <i class="lab la-telegram"></i>
                                                </a>
                                             </li>
                                          </ul>
                                       </div>
                                    </div>
                                    <!-- End: Product Selections -->
                                 </div>
                              </div>
                           </div>
                           <!-- Start: Product Availability -->
                           <div class="product-details__availability">
                              <div class="title">
                                 <p>Category:</p>
                                 <span class="free">Furniture</span>
                              </div>
                              <div class="title">
                                 <p>Tags:</p>
                                 <span class="free"> Blue, Green, Light</span>
                              </div>
                           </div>
                           
                           <!-- End: Product Availability -->
                           <!-- End: Product Details -->
                        </div>
                     </div>
                  </div>
               </div>

               <!-- End: Card -->
            </div>
         </div>

 </div>
      <div class="Comment"> <jsp:include page="Comment.jsp" />
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
    <jsp:include page="style/linkJS.jsp" />
</body>

</html>
