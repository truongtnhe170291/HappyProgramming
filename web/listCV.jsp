<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fmaster</title>
        <jsp:include page="style/linkcss.jsp" />
        <style>

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


                <div class="support-ticket mt-1">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="breadcrumb-main">
                                    <h4 class="text-capitalize breadcrumb-title">CV Submissions</h4>
                                    <div class="breadcrumb-action justify-content-center flex-wrap">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#"><i class="uil uil-estate"></i>Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#">apps</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Tickets</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>

                            </div>
                            <div class="col-12">
                                <div class="support-ticket-system">

                                    <div class="breadcrumb-main breadcrumb-main--ticket justify-content-sm-between ">
                                        <div class=" d-flex flex-wrap justify-content-center breadcrumb-main__wrapper">
                                            <div class="d-flex align-items-center ticket__title justify-content-center me-md-25 mb-md-0 mb-20">
                                                <h4 class="text-capitalize fw-500 breadcrumb-title">All CVs submitted</h4>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="userDatatable userDatatable--ticket mt-1">
                                        <div class="table-responsive">
                                            <table class="table mb-0 table-borderless">
                                                <thead>
                                                    <tr class="userDatatable-header">
                                                        <th>
                                                            <span class="userDatatable-title">NO</span>
                                                        </th>
                                                        <th>
                                                            <span class="userDatatable-title">Mentor</span>
                                                        </th>
                                                        <th>
                                                            <span class="userDatatable-title">Status</span>
                                                        </th>
                                                        <th>
                                                            <span class="userDatatable-title">Rate</span>
                                                        </th>
                                                        <th class="actions">
                                                            <span class="userDatatable-title">Actions</span>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cvList}" var="cv">
                                                        <tr>
                                                            <td>${cv.cvId}</td>
                                                            <td>
                                                                <div class="d-flex">
                                                                    <div class="userDatatable__imgWrapper d-flex align-items-center">
                                                                        <a href="#" class="profile-image rounded-circle d-block m-0" style="background-image:url('img/tm6.png'); background-size: cover;"></a>
                                                                    </div>
                                                                    <div class="userDatatable-inline-title">
                                                                        <a href="#" class="text-dark fw-500">
                                                                            <h6>${cv.fullName}</h6>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </td>


                                                            <td>
                                                                <div class="userDatatable-content d-inline-block">
                                                                    <span class="bg-opacity-warning color-warning userDatatable-content-status">Pending</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <input class="userDatatable-content--date" type="text" />                                       
                                                            </td>
                                                            <td>
                                                                <ul class="orderDatatable_actions mb-0 d-flex flex-wrap">
                                                                    <li>
                                                                        <div class="action-btn">
                                                                            <a href="#" class="btn btn-primary centaxs" data-bs-toggle="modal" data-bs-target="#ticket_modal" style="background-color: #fff; border: none;">
                                                                                <i class="uil uil-eye"></i></a>
                                                                            <div class="modal fade ticket_modal" id="ticket_modal" role="dialog" tabindex="-1" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                                                    <div class="modal-content  radius-xl">
                                                                                        <div class="modal-body pb-sm-50 pb-30">
                                                                                            <div class="modal-header">
                                                                                                <h1>
                                                                                                    Detail
                                                                                                </h1>
                                                                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                    <img src="img/svg/x.svg" alt="x" class="svg">
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="ticket_modal-modal">
                                                                                                <form>
                                                                                                    <div>CV Id: ${requestScope.cv.cvId}</div><br>
                                                                                                    <div>Mentor Name: ${requestScope.cv.userName}</div><br>
                                                                                                    <div>Email: ${requestScope.cv.gmail}</div><br>
                                                                                                    <div>Full name: ${requestScope.cv.fullName}</div><br>
                                                                                                    <div>DoB: ${requestScope.cv.dob.toString()}</div><br>
                                                                                                    <div>Gender: ${requestScope.cv.sex}</div><br>
                                                                                                    <div>Address: ${requestScope.cv.address}</div><br>
                                                                                                    <div>Profession: ${requestScope.cv.profession}</div><br>
                                                                                                    <div>Profession Introduction: ${requestScope.cv.professionIntro}</div><br>
                                                                                                    <div>Achievement Description: ${requestScope.cv.achievementDescription}</div><br>
                                                                                                    <div>Service Description: ${requestScope.cv.serviceDescription}</div><br>
                                                                                                    <div>Skills: 
                                                                                                        <c:forEach items="${requestScope.skills}" var="s">
                                                                                                            <p>${s.skillName}</p>
                                                                                                        </c:forEach>
                                                                                                    </div><br>
                                                                                                    <div>Status: ${requestScope.cv.stattusId}</div><br>
                                                                                                </form>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <!-- Modal -->

                                                                        </div>

                                                                    </li>
                                                                    <li>
                                                                        <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=2&mentorName=${cv.userName}" class="edit">
                                                                            <i class="uil uil-check"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=3" class="remove">
                                                                            <i class="uil uil-times"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
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