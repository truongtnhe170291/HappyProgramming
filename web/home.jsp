<%-- 
    Document   : home
    Created on : Jun 1, 2024, 12:09:21 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Fmaster</title>
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

         <div class="demo2 mb-25 t-thead-bg">
            <div class="container-fluid">
               <div class="row ">
                  <div class="col-lg-12">

                     <div class="breadcrumb-main">
                        <h4 class="text-capitalize breadcrumb-title">Statistical</h4>
                        <div class="breadcrumb-action justify-content-center flex-wrap">
                           <nav aria-label="breadcrumb">
                              <ol class="breadcrumb">
                                 <li class="breadcrumb-item"><a href="#"><i class="uil uil-estate"></i>Statistical</a></li>
                              </ol>
                           </nav>
                        </div>
                     </div>

                  </div>
                  <div class="col-xxl-3 col-sm-6  col-ssm-12 mb-25">
                     <!-- Card 1  -->
                     <div class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                        <div class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                           <div class="ap-po-details__titlebar">
                              <p>Total Products</p>
                              <h1>100+</h1>
                              <div class="ap-po-details-time">
                                 <span class="color-success"><i class="las la-arrow-up"></i>
                                    <strong>25.36%</strong></span>
                                 <small>Since last month</small>
                              </div>
                           </div>
                           <div class="ap-po-details__icon-area color-primary">
                              <i class="uil uil-arrow-growth"></i>
                           </div>
                        </div>

                     </div>
                     <!-- Card 1 End  -->
                  </div>

                  <div class="col-xxl-3 col-sm-6  col-ssm-12 mb-25">
                     <!-- Card 2 -->
                     <div class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                        <div class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                           <div class="ap-po-details__titlebar">
                              <p>Total Orders</p>
                              <h1>30,825</h1>
                              <div class="ap-po-details-time">
                                 <span class="color-success"><i class="las la-arrow-up"></i>
                                    <strong>25.36%</strong></span>
                                 <small>Since last month</small>
                              </div>
                           </div>
                           <div class="ap-po-details__icon-area color-secondary">
                              <i class="uil uil-users-alt"></i>
                           </div>
                        </div>

                     </div>
                     <!-- Card 2 End  -->
                  </div>

                  <div class="col-xxl-3 col-sm-6  col-ssm-12 mb-25">
                     <!-- Card 3 -->
                     <div class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                        <div class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                           <div class="ap-po-details__titlebar">
                              <p>Total Sales</p>
                              <h1>$30,825</h1>
                              <div class="ap-po-details-time">
                                 <span class="color-danger"><i class="las la-arrow-down"></i>
                                    <strong>25.36%</strong></span>
                                 <small>Since last month</small>
                              </div>
                           </div>
                           <div class="ap-po-details__icon-area color-success">
                              <i class="uil uil-usd-circle"></i>
                           </div>
                        </div>

                     </div>
                     <!-- Card 3 End  -->
                  </div>

                  <div class="col-xxl-3 col-sm-6  col-ssm-12 mb-25">
                     <!-- Card 4  -->
                     <div class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                        <div class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                           <div class="ap-po-details__titlebar">
                              <p>New Customers</p>
                              <h1>30,825</h1>
                              <div class="ap-po-details-time">
                                 <span class="color-success"><i class="las la-arrow-up"></i>
                                    <strong>25.36%</strong></span>
                                 <small>Since last month</small>
                              </div>
                           </div>
                           <div class="ap-po-details__icon-area color-info">
                              <i class="uil uil-tachometer-fast"></i>
                           </div>
                        </div>

                     </div>
                     <!-- Card 4 End  -->
                  </div>



                  <div class="col-xxl-4 mb-25">

                     <div class="card border-0 px-25">
                        <div class="card-header px-0 border-0">
                           <h6>New Product</h6>
                           <div class="card-extra">
                              <ul class="card-tab-links nav-tabs nav" role="tablist">
                                 <li>
                                    <a class="active" href="#t_selling-today" data-bs-toggle="tab" id="t_selling-today-tab" role="tab" aria-selected="true">Today</a>
                                 </li>
                                 <li>
                                    <a href="#t_selling-week" data-bs-toggle="tab" id="t_selling-week-tab" role="tab" aria-selected="true">Week</a>
                                 </li>
                                 <li>
                                    <a href="#t_selling-month" data-bs-toggle="tab" id="t_selling-month-tab" role="tab" aria-selected="true">Month</a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                        <div class="card-body p-0">
                           <div class="tab-content">
                              <div class="tab-pane fade active show" id="t_selling-today" role="tabpanel" aria-labelledby="t_selling-today-tab">
                                 <div class="selling-table-wrap">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless ">
                                          <thead>
                                             <tr>
                                                <th>PRDUCTS NAME</th>
                                                <th>Price</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="radius-xs img-fluid order-bg-opacity-primary" src="img/giorgio.png" alt="img">
                                                      <span>UV Protected Sunglass</span>
                                                   </div>
                                                </td>
                                                <td>$38,536</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="radius-xs img-fluid order-bg-opacity-primary" src="img/headphone.png" alt="img">
                                                      <span>Black Headphone</span>
                                                   </div>
                                                </td>
                                                <td>$20,573</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="radius-xs img-fluid order-bg-opacity-primary" src="img/shoes.png" alt="img">
                                                      <span>Nike Shoes</span>
                                                   </div>
                                                </td>
                                                <td>$17,457</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="radius-xs img-fluid order-bg-opacity-primary" src="img/mac-pro.png" alt="img">
                                                      <span>15" Mackbook Pro</span>
                                                   </div>
                                                </td>
                                                <td>$15,354</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="radius-xs img-fluid order-bg-opacity-primary" src="img/creativ-bag.png" alt="img">
                                                      <span>Women Bag</span>
                                                   </div>
                                                </td>
                                                <td>$12,354</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="t_selling-week" role="tabpanel" aria-labelledby="t_selling-week-tab">
                                 <div class="selling-table-wrap">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless">
                                          <thead>
                                             <tr>
                                                <th>PRDUCTS NAME</th>
                                                <th>Price</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/287.png" alt="img">
                                                      <span>Samsung Galaxy S8 256GB</span>
                                                   </div>
                                                </td>
                                                <td>$60,258</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid" src="img/165.png" alt="img">
                                                      <span>Half Sleeve Shirt</span>
                                                   </div>
                                                </td>
                                                <td>$2,483</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/166.png" alt="img">
                                                      <span>Marco Shoes</span>
                                                   </div>
                                                </td>
                                                <td>$19,758</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/315.png" alt="img">
                                                      <span>15" Mackbook Pro</span>
                                                   </div>
                                                </td>
                                                <td>$197,458</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/506.png" alt="img">
                                                      <span>Apple iPhone X</span>
                                                   </div>
                                                </td>
                                                <td>115,254</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="t_selling-month" role="tabpanel" aria-labelledby="t_selling-month-tab">
                                 <div class="selling-table-wrap">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless">
                                          <thead>
                                             <tr>
                                                <th>PRDUCTS NAME</th>
                                                <th>Price</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/287.png" alt="img">
                                                      <span>Samsung Galaxy S8 256GB</span>
                                                   </div>
                                                </td>
                                                <td>$60,258</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid" src="img/165.png" alt="img">
                                                      <span>Half Sleeve Shirt</span>
                                                   </div>
                                                </td>
                                                <td>$2,483</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/166.png" alt="img">
                                                      <span>Marco Shoes</span>
                                                   </div>
                                                </td>
                                                <td>$19,758</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/315.png" alt="img">
                                                      <span>15" Mackbook Pro</span>
                                                   </div>
                                                </td>
                                                <td>$197,458</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <img class="me-15 wh-34 img-fluid order-bg-opacity-primary" src="img/506.png" alt="img">
                                                      <span>Apple iPhone X</span>
                                                   </div>
                                                </td>
                                                <td>115,254</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>

                  <div class="col-xxl-8 mb-25">

                     <div class="card border-0 px-25">
                        <div class="card-header px-0 border-0">
                           <h6>Best Seller</h6>
                           <div class="card-extra">
                              <ul class="card-tab-links nav-tabs nav" role="tablist">
                                 <li>
                                    <a class="active" href="#t_selling-today222" data-bs-toggle="tab" id="t_selling-today222-tab" role="tab" aria-selected="true">Today</a>
                                 </li>
                                 <li>
                                    <a href="#t_selling-week222" data-bs-toggle="tab" id="t_selling-week222-tab" role="tab" aria-selected="true">Week</a>
                                 </li>
                                 <li>
                                    <a href="#t_selling-month333" data-bs-toggle="tab" id="t_selling-month333-tab" role="tab" aria-selected="true">Month</a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                        <div class="card-body p-0">
                           <div class="tab-content">
                              <div class="tab-pane fade active show" id="t_selling-today222" role="tabpanel" aria-labelledby="t_selling-today222-tab">
                                 <div class="selling-table-wrap selling-table-wrap--source">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless">
                                          <thead>
                                             <tr>
                                                <th>Seller name</th>
                                                <th>Company</th>
                                                <th>Product</th>
                                                <th>Revenue</th>
                                                <th>Status</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-1.png" alt="img">
                                                      </div>
                                                      <span>Robert Clinton</span>
                                                   </div>
                                                </td>
                                                <td>Samsung</td>
                                                <td>Smart Phone</td>
                                                <td>
                                                   $38,536
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-2.png" alt="img">
                                                      </div>
                                                      <span>Michael Johnson </span>
                                                   </div>
                                                </td>
                                                <td>Asus</td>
                                                <td>Laptop</td>
                                                <td>
                                                   $20,573
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-secondary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-3.png" alt="img">
                                                      </div>
                                                      <span>Daniel White</span>
                                                   </div>
                                                </td>
                                                <td>Google</td>
                                                <td>Watch</td>
                                                <td>
                                                   $17,457
                                                </td>
                                                <td>Pending</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-success align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-4.png" alt="img">
                                                      </div>
                                                      <span>Chris Barin </span>
                                                   </div>
                                                </td>
                                                <td>Apple</td>
                                                <td>Computer</td>
                                                <td>
                                                   $15,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-info align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-5.png" alt="img">
                                                      </div>
                                                      <span>Daniel Pink</span>
                                                   </div>
                                                </td>
                                                <td>Panasonic</td>
                                                <td>Sunglass</td>
                                                <td>
                                                   $12,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="t_selling-week222" role="tabpanel" aria-labelledby="t_selling-week222-tab">
                                 <div class="selling-table-wrap selling-table-wrap--source">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless">
                                          <thead>
                                             <tr>
                                                <th>Seller name</th>
                                                <th>Company</th>
                                                <th>Product</th>
                                                <th>Revenue</th>
                                                <th>Status</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-1.png" alt="img">
                                                      </div>
                                                      <span>Robert Clinton</span>
                                                   </div>
                                                </td>
                                                <td>Samsung</td>
                                                <td>Smart Phone</td>
                                                <td>
                                                   $38,536
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-2.png" alt="img">
                                                      </div>
                                                      <span>Michael Johnson </span>
                                                   </div>
                                                </td>
                                                <td>Asus</td>
                                                <td>Laptop</td>
                                                <td>
                                                   $20,573
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-secondary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-3.png" alt="img">
                                                      </div>
                                                      <span>Daniel White</span>
                                                   </div>
                                                </td>
                                                <td>Google</td>
                                                <td>Watch</td>
                                                <td>
                                                   $17,457
                                                </td>
                                                <td>Pending</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-success align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-4.png" alt="img">
                                                      </div>
                                                      <span>Chris Barin </span>
                                                   </div>
                                                </td>
                                                <td>Apple</td>
                                                <td>Computer</td>
                                                <td>
                                                   $15,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-info align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-5.png" alt="img">
                                                      </div>
                                                      <span>Daniel Pink</span>
                                                   </div>
                                                </td>
                                                <td>Panasonic</td>
                                                <td>Sunglass</td>
                                                <td>
                                                   $12,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                              <div class="tab-pane fade" id="t_selling-month333" role="tabpanel" aria-labelledby="t_selling-month333-tab">
                                 <div class="selling-table-wrap selling-table-wrap--source">
                                    <div class="table-responsive">
                                       <table class="table table--default table-borderless">
                                          <thead>
                                             <tr>
                                                <th>Seller name</th>
                                                <th>Company</th>
                                                <th>Product</th>
                                                <th>Revenue</th>
                                                <th>Status</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-1.png" alt="img">
                                                      </div>
                                                      <span>Robert Clinton</span>
                                                   </div>
                                                </td>
                                                <td>Samsung</td>
                                                <td>Smart Phone</td>
                                                <td>
                                                   $38,536
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-primary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-2.png" alt="img">
                                                      </div>
                                                      <span>Michael Johnson </span>
                                                   </div>
                                                </td>
                                                <td>Asus</td>
                                                <td>Laptop</td>
                                                <td>
                                                   $20,573
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-secondary align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-3.png" alt="img">
                                                      </div>
                                                      <span>Daniel White</span>
                                                   </div>
                                                </td>
                                                <td>Google</td>
                                                <td>Watch</td>
                                                <td>
                                                   $17,457
                                                </td>
                                                <td>Pending</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-success align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-4.png" alt="img">
                                                      </div>
                                                      <span>Chris Barin </span>
                                                   </div>
                                                </td>
                                                <td>Apple</td>
                                                <td>Computer</td>
                                                <td>
                                                   $15,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                             <tr>
                                                <td>
                                                   <div class="selling-product-img d-flex align-items-center">
                                                      <div class="selling-product-img-wrapper order-bg-opacity-info align-items-end">
                                                         <img class=" img-fluid" src="img/author/robert-5.png" alt="img">
                                                      </div>
                                                      <span>Daniel Pink</span>
                                                   </div>
                                                </td>
                                                <td>Panasonic</td>
                                                <td>Sunglass</td>
                                                <td>
                                                   $12,354
                                                </td>
                                                <td>Done</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
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
  
</body>

</html>
