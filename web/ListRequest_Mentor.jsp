<!doctype html>
<html lang="en" dir="ltr">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            <div class="main-sidebar sidebar-style-2">
                <aside id="sidebar-wrapper">

                    <ul class="sidebar-menu">
                        <li class="menu-header">Main</li>
                        <li class="dropdown active">
                            <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                    data-feather="monitor"></i><span>Dashboard</span></a>
                            <ul class="dropdown-menu">
                                <li class="active"><a class="nav-link" href="Homes_manager.jsp">Dashboard 1</a></li>
                            </ul>
                        </li>
                        <li class="menu-header">Request</li>
                        <li class="dropdown">
                            <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Management</span></a>
                            <ul class="dropdown-menu">
                                <li><a class="nav-link" href="listCV">List CV</a></li>
                                <li><a class="nav-link" href="skills">List Skills</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Schedule Management</span></a>
                            <ul class="dropdown-menu">
                                <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>
                            </ul>
                        </li>

                    </ul>
                </aside>
            </div>

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
                                                <th><span class="userDatatable-title">User Name</span></th>
                                                <th><span class="userDatatable-title">Total Booking Slots</span></th>
                                                <th><span class="userDatatable-title">Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="slot" items="${listSlot}">
                                                <tr>
                                                    <td><div class="userDatatable-content">${slot.mentorName}</div></td>
                                                    <td><div class="userDatatable-content">${slot.endTime}</div></td>
                                                    <td>
                                                        <form action="HandleSlotMentor" method="post">
                                                            <input type="hidden" name="mentorName" value="${slot.mentorName}" />
                                                            <input type="hidden" name="cycleID" value="${slot.cycleID}" />
                                                            <!-- Button trigger modal -->
                                                            <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal${slot.mentorName}">
                                                                View Detail
                                                            </button>
                                                            <!-- Button set action -->
                                                            <button type="submit" name="action" value="Approve">Approve</button>
                                                            <button type="submit" name="action" value="Reject">Reject</button>
                                                        </form>

                                                    </td>
                                                </tr>

                                                <!--<div class="modal-dialog modal-xl">...</div>-->

                                                <!-- Modal -->
                                            <div class="modal fade" id="exampleModal${slot.mentorName}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

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

            </div>

        </main>


    </body>


</html>