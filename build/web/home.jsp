<%-- Document : home Created on : May 18, 2024, 8:36:20 AM Author : 84979 --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!doctype html>
            <html lang="en" dir="ltr">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>FMASTER</title>
          <jsp:include page="style/linkcss.jsp" />

            </head>

            <body class="layout-light side-menu">
                <div class="mobile-search">
                    <form action="/" class="search-form">
                        <img src="img/svg/search.svg" alt="search" class="svg">
                        <input class="form-control me-sm-2 box-shadow-none" type="search" placeholder="Search..."
                            aria-label="Search">
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
                                            <h4 class="text-capitalize breadcrumb-title">shop</h4>
                                            <div class="breadcrumb-action justify-content-center flex-wrap">
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb">
                                                        <li class="breadcrumb-item"><a href="#"><i
                                                                    class="uil uil-estate"></i>Home</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">Library
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="products_page product_page--grid mb-30">
                            <div class="container-fluid">
                                <div class="row justify-content-center">
                                    <div class="columns-1 col-lg-8 col-sm-10 mb-lg-0 mb-30">
                                        <div class="widget mb-lg-30">
                                            <div class="widget-header-title px-20 py-15">
                                                <h6 class="d-flex align-content-center fw-500">
                                                    <img src="img/svg/sliders.svg" alt="sliders" class="svg"> Filters
                                                </h6>
                                            </div>
                                            <div class="category_sidebar">
                                                <!-- Start: Aside -->
                                                <aside class="product-sidebar-widget mb-30">
                                                    <!-- Title -->
                                                    <div class="widget_title nocollapse">
                                                        <h6>Price Range</h6>
                                                    </div>
                                                    <!-- Title -->
                                                    <!-- Body -->
                                                    <div class="card border-0 shadow-none mt-10">
                                                        <div class="product-price-ranges">
                                                            <div id="price-range" class="mb-0">
                                                                <div class="section price">
                                                                    <div class="price-slider"></div>
                                                                    <p class="price-value"></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Body -->
                                                </aside>
                                                <!-- End: Aside -->
                                                <!-- Start: Aside -->
                                                <aside class="product-sidebar-widget mb-30">
                                                    <!-- Title -->
                                                    <div class="widget_title" data-bs-toggle="collapse"
                                                        data-bs-target="#multiCollapseExample2" role="button"
                                                        aria-expanded="true">
                                                        <h6>Skills</h6>
                                                    </div>
                                                    <!-- Title -->
                                                    <!-- Body -->
                                                    <div class="card border-0 shadow-none multi-collapse mt-10 collapse show"
                                                        id="multiCollapseExample2">
                                                        <div class="product-category limit-list-item">
                                                            <ul>
                                                                <c:forEach items="${listSkill}" var="skill">
                                                                    <li>
                                                                        <div class="w-100">
                                                                            <a href="#"
                                                                                class="fs-14 color-gray">${skill.skillName}<span
                                                                                    class="item-numbers">92</span></a>
                                                                        </div>
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                    <!-- Body -->
                                                </aside>

                                                <aside class="product-sidebar-widget">
                                                    <!-- Title -->
                                                    <div class="widget_title" data-bs-toggle="collapse"
                                                        data-bs-target="#multiCollapseExample4" role="button"
                                                        aria-expanded="true">
                                                        <h6>Ratings</h6>
                                                    </div>
                                                    <!-- Title -->
                                                    <!-- Body -->
                                                    <div class="card border-0 shadow-none multi-collapse mt-10 collapse show"
                                                        id="multiCollapseExample4">
                                                        <div class="product-ratings">
                                                            <ul>
                                                                <li>
                                                                    <div
                                                                        class="checkbox-theme-default custom-checkbox ">
                                                                        <input class="checkbox" type="checkbox"
                                                                            id="rating-1">
                                                                        <label for="rating-1">

                                                                            <span
                                                                                class="stars-rating d-flex align-items-center">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span class="checkbox-text">
                                                                                    and up
                                                                                    <span class="item-numbers">42</span>
                                                                                </span>
                                                                            </span>

                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div
                                                                        class="checkbox-theme-default custom-checkbox ">
                                                                        <input class="checkbox" type="checkbox"
                                                                            id="rating-3">
                                                                        <label for="rating-3">

                                                                            <span
                                                                                class="stars-rating d-flex align-items-center">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span class="checkbox-text">
                                                                                    and up
                                                                                    <span class="item-numbers">54</span>
                                                                                </span>
                                                                            </span>

                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div
                                                                        class="checkbox-theme-default custom-checkbox ">
                                                                        <input class="checkbox" type="checkbox"
                                                                            id="rating-4">
                                                                        <label for="rating-4">

                                                                            <span
                                                                                class="stars-rating d-flex align-items-center">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span class="checkbox-text">
                                                                                    and up
                                                                                    <span class="item-numbers">78</span>
                                                                                </span>
                                                                            </span>

                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div
                                                                        class="checkbox-theme-default custom-checkbox ">
                                                                        <input class="checkbox" type="checkbox"
                                                                            id="rating-5">
                                                                        <label for="rating-5">

                                                                            <span
                                                                                class="stars-rating d-flex align-items-center">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span class="checkbox-text">
                                                                                    and up
                                                                                    <span class="item-numbers">42</span>
                                                                                </span>
                                                                            </span>

                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div
                                                                        class="checkbox-theme-default custom-checkbox ">
                                                                        <input class="checkbox" type="checkbox"
                                                                            id="rating-6">
                                                                        <label for="rating-6">

                                                                            <span
                                                                                class="stars-rating d-flex align-items-center">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span
                                                                                    class="star-icon las la-star inactive"></span>
                                                                                <span class="checkbox-text">
                                                                                    and up
                                                                                    <span class="item-numbers">35</span>
                                                                                </span>
                                                                            </span>

                                                                        </label>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <!-- Body -->
                                                </aside>
                                                <!-- End: Aside -->
                                            </div>
                                        </div><!-- End: .widget -->
                                    </div><!-- End: .columns-1 -->
                                    <div class="columns-2 col-lg-12">
                                        <!-- Start: Top Bar -->
                                        <!-- Start: Top Bar -->
                                        <div class="shop_products_top_filter">
                                            <div class="project-top-wrapper d-flex flex-wrap align-items-center">
                                                <div class="project-top-left d-flex flex-wrap align-items-center">
                                                    <div class="project-search shop-search  global-shadow ">
                                                        <form action="/"
                                                            class="d-flex align-items-center user-member__form">
                                                            <img src="img/svg/search.svg" alt="search" class="svg">
                                                            <input class="form-control me-sm-2 border-0 box-shadow-none"
                                                                type="search" placeholder="Search" aria-label="Search">
                                                        </form>
                                                    </div>
                                                    <span
                                                        class="project-result-showing fs-14 color-gray ms-xl-25 me-xl-0 text-center mt-lg-0 mt-20">Showing
                                                        <span>1–8</span> of <span>86</span>
                                                        results</span>
                                                </div>
                                                <div class="project-top-right d-flex flex-wrap align-items-center">
                                                    <div class="project-category flex-wrap d-flex align-items-center">
                                                        <p class="fs-14 color-gray text-capitalize">sort by:</p>
                                                        <div class="project-tap project-tab__product">
                                                            <ul class="nav px-1 " id="ap-tab" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" id="ap-overview-tab"
                                                                        data-bs-toggle="pill" href="#ap-overview"
                                                                        role="tab" aria-controls="ap-overview"
                                                                        aria-selected="true">top rated</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="project-icon-selected content-center mt-lg-0 mt-25">
                                                        <div
                                                            class="listing-social-link listing-social-link__products pb-lg-0 pb-xs-2">
                                                            <div class="icon-list-social d-flex">
                                                                <a class="icon-list-social__link rounded-circle icon-list-social__style justify-content-center active ms-xl-20"
                                                                    href="#">
                                                                    <img class="svg" src="img/svg/grid.svg"
                                                                        alt="grid"></a>
                                                                <a class="icon-list-social__link rounded-circle icon-list-social__style justify-content-center  "
                                                                    href="product-list.html">
                                                                    <img class="svg" src="img/svg/list.svg"
                                                                        alt="list"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End: Top Bar -->
                                        <!-- End: Top Bar -->
                                        <!-- Start: Shop Item -->
                                        <div class="tab-content mt-25" id="ap-tabContent">
                                            <div class="tab-pane fade show active" id="ap-overview" role="tabpanel"
                                                aria-labelledby="ap-overview-tab">
                                                <!-- Start: Shop Item -->
                                                <div class="row product-page-list justify-content-center">
                                                    <div class="cus-xl-3 col-lg-6 col-md-11 col-12 mb-30 px-10">

                                                        <div class="card product product--grid">
                                                            <div class="h-100">
                                                                <div class="product-item">
                                                                    <div class="product-item__image">
                                                                        <span class="like-icon">
                                                                            <button type="button"
                                                                                class="content-center">
                                                                                <i class="lar la-heart icon"></i>
                                                                            </button>
                                                                        </span>
                                                                        <a href="#"><img class="card-img-top img-fluid"
                                                                                src="img/digital-chair.png"
                                                                                alt="digital-chair"></a>
                                                                    </div>
                                                                    <div class="card-body px-20 pb-25 pt-25">
                                                                        <div class="product-item__body text-capitalize">
                                                                            <a href="product-details.html">
                                                                                <h6 class="card-title">Montes
                                                                                    scelerisque</h6>
                                                                            </a>
                                                                            <div
                                                                                class="stars-rating d-flex align-items-center flex-wrap mb-10">
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star active"></span>
                                                                                <span
                                                                                    class="star-icon las la-star-half-alt active"></span>
                                                                                <span
                                                                                    class="stars-rating__point">4.9</span>
                                                                                <span class="stars-rating__review">
                                                                                    <span>778</span> Reviews</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-item__footer">

                                                                            <div
                                                                                class="d-flex align-items-center flex-wrap">
                                                                                <span
                                                                                    class="product-desc-price">$200.00</span>
                                                                                <span
                                                                                    class="product-price">$100.00</span>
                                                                                <span class="product-discount">50%
                                                                                    Off</span>
                                                                            </div>
                                                                        </div>
                                                                        <div
                                                                            class="product-item__button d-flex mt-20 flex-wrap">



                                                                            <button
                                                                                class="btn btn-default btn-squared color-light btn-outline-light px-20 "><img
                                                                                    src="img/svg/shopping-bag.svg"
                                                                                    alt="shopping-bag" class="svg">
                                                                                Add To Cart
                                                                            </button>






                                                                            <button
                                                                                class="btn btn-primary btn-default btn-squared border-0 px-25">buy
                                                                                now
                                                                            </button>





                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                                <!-- End: Shop Item -->
                                            </div>
                                        </div>
                                        <!-- End: Shop Item -->
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="user-pagination">
                                                    <div
                                                        class="d-flex justify-content-lg-end justify-content-center mt-1 mb-30">

                                                        <nav class="dm-page ">
                                                            <ul class="dm-pagination d-flex">
                                                                <li class="dm-pagination__item">
                                                                    <a href="#"
                                                                        class="dm-pagination__link pagination-control"><span
                                                                            class="la la-angle-left"></span></a>
                                                                    <a href="#" class="dm-pagination__link"><span
                                                                            class="page-number">1</span></a>
                                                                    <a href="#" class="dm-pagination__link active"><span
                                                                            class="page-number">2</span></a>
                                                                    <a href="#" class="dm-pagination__link"><span
                                                                            class="page-number">3</span></a>
                                                                    <a href="#"
                                                                        class="dm-pagination__link pagination-control"><span
                                                                            class="page-number">...</span></a>
                                                                    <a href="#" class="dm-pagination__link"><span
                                                                            class="page-number">12</span></a>
                                                                    <a href="#"
                                                                        class="dm-pagination__link pagination-control"><span
                                                                            class="la la-angle-right"></span></a>
                                                                    <a href="#" class="dm-pagination__option">
                                                                    </a>
                                                                </li>
                                                                <li class="dm-pagination__item">
                                                                    <div class="paging-option">
                                                                        <select name="page-number"
                                                                            class="page-selection">
                                                                            <option value="20">20/page</option>
                                                                            <option value="40">40/page</option>
                                                                            <option value="60">60/page</option>
                                                                        </select>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </nav>


                                                    </div>
                                                    <!-- End of Pagination-->
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- End: .columns-2 -->
                                </div>
                            </div>
                        </div>
                        <!-- End: .products -->
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