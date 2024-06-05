<%-- 
    Document   : Manager
    Created on : May 31, 2024, 11:54:22 PM
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
            <div class="sidebar-wrapper">
         <div class="sidebar sidebar-collapse" id="sidebar">
            <div class="sidebar__menu-group">
               <ul class="sidebar_nav">
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-window-section"></span>
                        <span class="menu-text">Layouts</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="l_sidebar">
                           <a href="#" data-layout="light">Light Mode</a>
                        </li>
                        <li class="l_sidebar">
                           <a href="#" data-layout="dark">Dark Mode</a>
                        </li>
                     </ul>
                  </li>
                  
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-calendar-alt"></span>
                        <span class="menu-text">Calendar</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="l_sidebar">
                           <a href="MentorRequest">Booking Calendar</a>
                        </li>
                        <li class="l_sidebar">
                           <a href="Mentor_Mentee_calendar.jsp">View Schedule</a>
                        </li>
                     </ul>
                  </li>
                  
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-users-alt"></span>
                        <span class="menu-text">Menter </span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="">
                           <a href="HandleSlotMentor">Menter Request</a>
                        </li>
                     </ul>
                  </li>
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-users-alt"></span>
                        <span class="menu-text">CV</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul class="toggle">
                        <li class="">
                           <a href="cv">Apply CV</a>
                        </li>
                     </ul>
                  </li>
                   <li class="has-child">
                     <a href="listCV.jsp" class="ch">
                        <span class="nav-icon uil uil-users-alt"></span>
                        <span class="menu-text">List CV</span>
                        <span class="toggle-icon">
                            
                        </span>
                            </a>
                        <ul class="toggle">
                        <li class="">
                           <a href="listCV.jsp">All CV</a>
                        </li>
                     </ul>
                 
                    
                  </li>
               </ul>
            </div>
         </div>
      </div>
                <jsp:include page="style/linkJS.jsp" />
      <div class="contents">

         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-12">

                  <div class="breadcrumb-main">
                     <h4 class="text-capitalize breadcrumb-title">Dashboard</h4>
                     <div class="breadcrumb-action justify-content-center flex-wrap">
                        <nav aria-label="breadcrumb">
                           <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="Manager.jsp"><i class="uil uil-estate"></i>Dashboard</a></li>
                           </ol>
                        </nav>
                     </div>
                  </div>

               </div>
            </div>
            <div class="row">
               <div class="col-12">

                  <div class="card">
                     <div class="card-header color-dark fw-500">
                        Basic Usage
                     </div>
                     <div class="card-body p-0">
                        <div class="table4 p-25 mb-30">
                           <div class="table-responsive">
                              <table class="table mb-0">
                                 <thead>
                                    <tr class="userDatatable-header">
                                       <th>
                                          <span class="userDatatable-title">Name</span>
                                       </th>
                                       <th>
                                          <span class="userDatatable-title">Age</span>
                                       </th>
                                       <th>
                                          <span class="userDatatable-title">Address</span>
                                       </th>
                                    </tr>
                                 </thead>
                                 <tbody>

                                    <tr>
                                       <td>
                                          <div class="userDatatable-content">
                                             Mike
                                          </div>
                                       </td>
                                       <td>
                                          <div class="userDatatable-content">
                                             32
                                          </div>
                                       </td>
                                       <td>
                                          <div class="userDatatable-content">
                                             10 Downing Street
                                          </div>
                                       </td>
                                    </tr>


                                    <tr>
                                       <td>
                                          <div class="userDatatable-content">
                                             Jhon
                                          </div>
                                       </td>
                                       <td>
                                          <div class="userDatatable-content">
                                             42
                                          </div>
                                       </td>
                                       <td>
                                          <div class="userDatatable-content">
                                             5 Downing Street
                                          </div>
                                       </td>
                                    </tr>

                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
               <div class="col-12 mt-30">

                  <div class="card border-0">
                     <div class="card-header">
                        <h6>Social Traffic Metrics</h6>
                        <div class="card-extra">
                           <ul class="card-tab-links nav-tabs nav" role="tablist">
                              <li><a class="active" id="st_matrics-today-tab" data-bs-toggle="tab" href="#st_matrics-today" role="tab" aria-selected="true">Today</a></li>
                              <li><a id="st_matrics-week-tab" data-bs-toggle="tab" href="#st_matrics-week" role="tab" aria-selected="false">Week</a></li>
                              <li><a id="st_matrics-month-tab" data-bs-toggle="tab" href="#st_matrics-month" role="tab" aria-selected="false">Month</a></li>
                              <li><a id="st_matrics-year-tab" data-bs-toggle="tab" href="#st_matrics-year" role="tab" aria-selected="false">Year</a></li>
                           </ul>
                           <div class="dropdown dropleft">
                              <a href="#" role="button" id="Today" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <img src="img/svg/more-horizontal.svg" alt="more-horizontal" class="svg">
                              </a>
                              <div class="dropdown-menu" aria-labelledby="Today">
                                 <a class="dropdown-item" href="#">Action</a>
                                 <a class="dropdown-item" href="#">Another action</a>
                                 <a class="dropdown-item" href="#">Something else here</a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="card-body p-0 pe-2">
                        <div class="tab-content">
                           <div class="tab-pane fade active show" id="st_matrics-today" role="tabpanel" aria-labelledby="st_matrics-today-tab">
                              <div class="table-responsive">
                                 <table class="table table-bordered table-social">
                                    <thead>
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col" colspan="3">Acquisition</th>
                                          <th scope="col" colspan="3">Behavior</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>Social Network</td>
                                          <td>Users</td>
                                          <td>New Users</td>
                                          <td>Sessions</td>
                                          <td>Bounce Rate</td>
                                          <td>Pages / Sessions</td>
                                          <td>Avg. Session Duration</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Facebook</a>
                                          </td>
                                          <td>1,458</td>
                                          <td>452</td>
                                          <td>9,235</td>
                                          <td>25%</td>
                                          <td>3.9</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Twitter</a>
                                          </td>
                                          <td>4,785</td>
                                          <td>426</td>
                                          <td>8,156</td>
                                          <td>-26%</td>
                                          <td>1.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Linkedin</a>
                                          </td>
                                          <td>3,416</td>
                                          <td>951</td>
                                          <td>6,124</td>
                                          <td>56%</td>
                                          <td>5.3</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Youtube</a>
                                          </td>
                                          <td>5,426</td>
                                          <td>753</td>
                                          <td>9,147</td>
                                          <td>15%</td>
                                          <td>7.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Instagram</a>
                                          </td>
                                          <td>6,258</td>
                                          <td>852</td>
                                          <td>4,369</td>
                                          <td>75%</td>
                                          <td>2.7</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Google+</a>
                                          </td>
                                          <td>9,632</td>
                                          <td>123</td>
                                          <td>1,256</td>
                                          <td>46%</td>
                                          <td>2.6</td>
                                          <td>00:05:16</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="st_matrics-week" role="tabpanel" aria-labelledby="st_matrics-week-tab">
                              <div class="table-responsive">
                                 <table class="table table-bordered table-social">
                                    <thead>
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col" colspan="3">Acquisition</th>
                                          <th scope="col" colspan="3">Behavior</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>Social Network</td>
                                          <td>Users</td>
                                          <td>New Users</td>
                                          <td>Sessions</td>
                                          <td>Bounce Rate</td>
                                          <td>Pages / Sessions</td>
                                          <td>Avg. Session Duration</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Facebook</a>
                                          </td>
                                          <td>1,558</td>
                                          <td>452</td>
                                          <td>9,235</td>
                                          <td>27%</td>
                                          <td>6.9</td>
                                          <td>00:06:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Twitter</a>
                                          </td>
                                          <td>4,585</td>
                                          <td>426</td>
                                          <td>8,856</td>
                                          <td>-26%</td>
                                          <td>1.5</td>
                                          <td>00:03:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Linkedin</a>
                                          </td>
                                          <td>3,416</td>
                                          <td>951</td>
                                          <td>6,124</td>
                                          <td>56%</td>
                                          <td>5.3</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Youtube</a>
                                          </td>
                                          <td>5,426</td>
                                          <td>553</td>
                                          <td>4,647</td>
                                          <td>20%</td>
                                          <td>8.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Instagram</a>
                                          </td>
                                          <td>62,258</td>
                                          <td>452</td>
                                          <td>4,669</td>
                                          <td>55%</td>
                                          <td>1.7</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Google+</a>
                                          </td>
                                          <td>6,632</td>
                                          <td>113</td>
                                          <td>1,956</td>
                                          <td>56%</td>
                                          <td>5.6</td>
                                          <td>00:06:16</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="st_matrics-month" role="tabpanel" aria-labelledby="st_matrics-month-tab">
                              <div class="table-responsive">
                                 <table class="table table-bordered table-social">
                                    <thead>
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col" colspan="3">Acquisition</th>
                                          <th scope="col" colspan="3">Behavior</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>Social Network</td>
                                          <td>Users</td>
                                          <td>New Users</td>
                                          <td>Sessions</td>
                                          <td>Bounce Rate</td>
                                          <td>Pages / Sessions</td>
                                          <td>Avg. Session Duration</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Facebook</a>
                                          </td>
                                          <td>1,258</td>
                                          <td>452</td>
                                          <td>9,235</td>
                                          <td>25%</td>
                                          <td>3.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Twitter</a>
                                          </td>
                                          <td>4,785</td>
                                          <td>423</td>
                                          <td>8,156</td>
                                          <td>-26%</td>
                                          <td>1.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Linkedin</a>
                                          </td>
                                          <td>3,416</td>
                                          <td>956</td>
                                          <td>6,124</td>
                                          <td>46%</td>
                                          <td>5.3</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Youtube</a>
                                          </td>
                                          <td>5,426</td>
                                          <td>753</td>
                                          <td>9,147</td>
                                          <td>15%</td>
                                          <td>7.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Instagram</a>
                                          </td>
                                          <td>6,258</td>
                                          <td>852</td>
                                          <td>4,369</td>
                                          <td>75%</td>
                                          <td>2.7</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Google+</a>
                                          </td>
                                          <td>9,632</td>
                                          <td>123</td>
                                          <td>1,656</td>
                                          <td>36%</td>
                                          <td>2.8</td>
                                          <td>00:05:16</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="st_matrics-year" role="tabpanel" aria-labelledby="st_matrics-year-tab">
                              <div class="table-responsive">
                                 <table class="table table-bordered table-social">
                                    <thead>
                                       <tr>
                                          <th scope="col"></th>
                                          <th scope="col" colspan="3">Acquisition</th>
                                          <th scope="col" colspan="3">Behavior</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>Social Network</td>
                                          <td>Users</td>
                                          <td>New Users</td>
                                          <td>Sessions</td>
                                          <td>Bounce Rate</td>
                                          <td>Pages / Sessions</td>
                                          <td>Avg. Session Duration</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Facebook</a>
                                          </td>
                                          <td>1,458</td>
                                          <td>452</td>
                                          <td>9,245</td>
                                          <td>35%</td>
                                          <td>5.9</td>
                                          <td>00:08:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Twitter</a>
                                          </td>
                                          <td>4,285</td>
                                          <td>424</td>
                                          <td>8,356</td>
                                          <td>-25%</td>
                                          <td>1.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Linkedin</a>
                                          </td>
                                          <td>3,416</td>
                                          <td>951</td>
                                          <td>6,124</td>
                                          <td>56%</td>
                                          <td>5.3</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Youtube</a>
                                          </td>
                                          <td>5,426</td>
                                          <td>753</td>
                                          <td>9,147</td>
                                          <td>15%</td>
                                          <td>7.5</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Instagram</a>
                                          </td>
                                          <td>6,258</td>
                                          <td>852</td>
                                          <td>4,369</td>
                                          <td>75%</td>
                                          <td>2.7</td>
                                          <td>00:05:16</td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <a href="">Google+</a>
                                          </td>
                                          <td>9,632</td>
                                          <td>123</td>
                                          <td>1,256</td>
                                          <td>46%</td>
                                          <td>2.6</td>
                                          <td>00:05:16</td>
                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>

               <div class="col-xxl-6 mt-30">

                  <div class="card border-0">
                     <div class="card-header">
                        <h6>Top Selling Products</h6>
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
                              <li>
                                 <a href="#t_selling-year" data-bs-toggle="tab" id="t_selling-year-tab" role="tab" aria-selected="true">Year</a>
                              </li>
                           </ul>
                           <div class="dropdown dropleft">
                              <a href="#" role="button" id="todo12" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <img src="img/svg/more-horizontal.svg" alt="more-horizontal" class="svg">
                              </a>
                              <div class="dropdown-menu" aria-labelledby="todo12">
                                 <a class="dropdown-item" href="#">Action</a>
                                 <a class="dropdown-item" href="#">Another action</a>
                                 <a class="dropdown-item" href="#">Something else here</a>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="card-body p-0 pb-15">
                        <div class="tab-content">
                           <div class="tab-pane fade active show" id="t_selling-today" role="tabpanel" aria-labelledby="t_selling-today-tab">
                              <div class="selling-table-wrap">
                                 <div class="table-responsive">
                                    <table class="table table--default body-px-25">
                                       <thead>
                                          <tr>
                                             <th>Prducts Name</th>
                                             <th>Price</th>
                                             <th>Sold</th>
                                             <th>Revenue</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>Samsung Galaxy S8 256GB</td>
                                             <td>$289</td>
                                             <td>339</td>
                                             <td>$60,258</td>
                                          </tr>
                                          <tr>
                                             <td>Half Sleeve Shirt</td>
                                             <td>$29</td>
                                             <td>136</td>
                                             <td>$2,483</td>
                                          </tr>
                                          <tr>
                                             <td>Marco Shoes</td>
                                             <td>$59</td>
                                             <td>448</td>
                                             <td>$19,758</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="t_selling-week" role="tabpanel" aria-labelledby="t_selling-week-tab">
                              <div class="selling-table-wrap">
                                 <div class="table-responsive">
                                    <table class="table table--default body-px-25">
                                       <thead>
                                          <tr>
                                             <th>Prducts Name</th>
                                             <th>Price</th>
                                             <th>Sold</th>
                                             <th>Revenue</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>Samsung Galaxy S8 256GB</td>
                                             <td>$289</td>
                                             <td>339</td>
                                             <td>$60,258</td>
                                          </tr>
                                          <tr>
                                             <td>Half Sleeve Shirt</td>
                                             <td>$29</td>
                                             <td>136</td>
                                             <td>$2,483</td>
                                          </tr>
                                          <tr>
                                             <td>Marco Shoes</td>
                                             <td>$59</td>
                                             <td>448</td>
                                             <td>$19,758</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
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
                                    <table class="table table--default body-px-25">
                                       <thead>
                                          <tr>
                                             <th>PRDUCTS NAME</th>
                                             <th>Price</th>
                                             <th>Sold</th>
                                             <th>Revenue</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>Samsung Galaxy S8 256GB</td>
                                             <td>$289</td>
                                             <td>339</td>
                                             <td>$60,258</td>
                                          </tr>
                                          <tr>
                                             <td>Half Sleeve Shirt</td>
                                             <td>$29</td>
                                             <td>136</td>
                                             <td>$2,483</td>
                                          </tr>
                                          <tr>
                                             <td>Marco Shoes</td>
                                             <td>$59</td>
                                             <td>448</td>
                                             <td>$19,758</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <div class="tab-pane fade" id="t_selling-year" role="tabpanel" aria-labelledby="t_selling-year-tab">
                              <div class="selling-table-wrap">
                                 <div class="table-responsive">
                                    <table class="table table--default body-px-25">
                                       <thead>
                                          <tr>
                                             <th>PRDUCTS NAME</th>
                                             <th>Price</th>
                                             <th>Sold</th>
                                             <th>Revenue</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>Samsung Galaxy S8 256GB</td>
                                             <td>$289</td>
                                             <td>339</td>
                                             <td>$60,258</td>
                                          </tr>
                                          <tr>
                                             <td>Half Sleeve Shirt</td>
                                             <td>$29</td>
                                             <td>136</td>
                                             <td>$2,483</td>
                                          </tr>
                                          <tr>
                                             <td>Marco Shoes</td>
                                             <td>$59</td>
                                             <td>448</td>
                                             <td>$19,758</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
                                             <td>115,254</td>
                                          </tr>
                                          <tr>
                                             <td>15" Mackbook Pro</td>
                                             <td>$1,299</td>
                                             <td>159</td>
                                             <td>$197,458</td>
                                          </tr>
                                          <tr>
                                             <td>Apple iPhone X</td>
                                             <td>$899</td>
                                             <td>146</td>
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
