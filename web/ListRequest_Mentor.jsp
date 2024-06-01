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

         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-12">

                  <div class="breadcrumb-main user-member justify-content-sm-between ">
                     <div class=" d-flex flex-wrap justify-content-center breadcrumb-main__wrapper">
                        <div class="d-flex align-items-center user-member__title justify-content-center me-sm-25">
                           <h4 class="text-capitalize fw-500 breadcrumb-title">users list datatable</h4>
                           <span class="sub-title ms-sm-25 ps-sm-25">Home</span>
                        </div>

                        <form action="/" class="d-flex align-items-center user-member__form my-sm-0 my-2">
                           <img src="img/svg/search.svg" alt="search" class="svg">
                           <input class="form-control me-sm-2 border-0 box-shadow-none" type="search" placeholder="Search by Name" aria-label="Search">
                        </form>

                     </div>
                
                  </div>

               </div>
            </div>
            <div class="row">
               <div class="col-lg-12">
                  <div class="userDatatable global-shadow border-light-0 p-30 bg-white radius-xl w-100 mb-30">
                     <div class="table-responsive">
                        <table class="table mb-0 table-borderless">
                           <thead>
                              <tr class="userDatatable-header">
                                 <th>
                                    <div class="d-flex align-items-center">
                                       <div class="custom-checkbox  check-all">
                                          <input class="checkbox" type="checkbox" id="check-44">
                                          <label for="check-44">
                                             <span class="checkbox-text userDatatable-title">user</span>
                                          </label>
                                       </div>
                                    </div>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title">emaill</span>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title">company</span>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title">position</span>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title">join date</span>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title">status</span>
                                 </th>
                                 <th>
                                    <span class="userDatatable-title float-end" onclick="showDetail()">action</span>
                                 </th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td>
                                    <div class="d-flex">
                                       <div class="userDatatable__imgWrapper d-flex align-items-center">
                                          <div class="checkbox-group-wrapper">
                                             <div class="checkbox-group d-flex">
                                                <div class="checkbox-theme-default custom-checkbox checkbox-group__single d-flex">
                                                   <input class="checkbox" type="checkbox" id="check-grp-content12">
                                                   <label for="check-grp-content12"></label>
                                                </div>
                                             </div>
                                          </div>
                                          <a href="#" class="profile-image rounded-circle d-block m-0 wh-38" style="background-image:url('img/tm6.png'); background-size: cover;"></a>
                                       </div>
                                       <div class="userDatatable-inline-title">
                                          <a href="#" class="text-dark fw-500">
                                             <h6>Kellie Marquot</h6>
                                          </a>
                                          <p class="d-block mb-0">
                                             San Francisco, CA
                                          </p>
                                       </div>
                                    </div>
                                 </td>
                                 <td>
                                    <div class="userDatatable-content">
                                       john-keller@gmail.com
                                    </div>
                                 </td>
                                 <td>
                                    <div class="userDatatable-content">
                                       Business Development
                                    </div>
                                 </td>
                                 <td>
                                    <div class="userDatatable-content">
                                       Web Developer
                                    </div>
                                 </td>
                                 <td>
                                    <div class="userDatatable-content">
                                       January 20, 2020
                                    </div>
                                 </td>
                                 <td>
                                    <div class="userDatatable-content d-inline-block">
                                       <span class="bg-opacity-success  color-success rounded-pill userDatatable-content-status active">active</span>
                                    </div>
                                 </td>
                                 <td>
                                    <ul class="orderDatatable_actions mb-0 d-flex flex-wrap">
                                       <li>
                                          <a href="#" class="view">
                                             <i class="uil uil-eye"></i>
                                          </a>
                                       </li>
                                    </ul>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                                    <div id="detail-modal" class="modal">
                     <div class="modal-content">
                         <span class="close-button" onclick="closeDetail()">&times;</span>
                         <p>Detail Content</p>
                     </div>
                 </div>
                     <div class="d-flex justify-content-end pt-30">

                        <nav class="dm-page ">
                           <ul class="dm-pagination d-flex">
                              <li class="dm-pagination__item">
                                 <a href="#" class="dm-pagination__link pagination-control"><span class="la la-angle-left"></span></a>
                                 <a href="#" class="dm-pagination__link"><span class="page-number">1</span></a>
                                 <a href="#" class="dm-pagination__link active"><span class="page-number">2</span></a>
                                 <a href="#" class="dm-pagination__link pagination-control"><span class="page-number">...</span></a>
                                 <a href="#" class="dm-pagination__link"><span class="page-number">12</span></a>
                     
                              </li>
                              <li class="dm-pagination__item">
                                 <div class="paging-option">
                                    <select name="page-number" class="page-selection">
                                       <option value="20">20/page</option>
                                    </select>
                                 </div>
                              </li>
                           </ul>
                        </nav>


                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>

   </main>


</body>

</html>