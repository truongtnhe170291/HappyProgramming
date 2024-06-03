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
                                                <th><span class="userDatatable-title">Mentor Name</span></th>
                                                <th><span class="userDatatable-title">Slot ID</span></th>
                                                <th><span class="userDatatable-title">Slot Name</span></th>
                                                <th><span class="userDatatable-title">Day of Slot</span></th>
                                                <th><span class="userDatatable-title">Day of Week</span></th>
                                                <th><span class="userDatatable-title">Start Time</span></th>
                                                <th><span class="userDatatable-title">End Time</span></th>
                                                <th><span class="userDatatable-title">Action</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="slot" items="${listSlot}">
                                                <tr>
                                                    <td><div class="userDatatable-content">${slot.mentorName}</div></td>
                                                    <td><div class="userDatatable-content">${slot.slotId}</div></td>
                                                    <td><div class="userDatatable-content">${slot.slot_name}</div></td>
                                                    <td><div class="userDatatable-content">${slot.dayOfSlot}</div></td>
                                                    <td><div class="userDatatable-content">${slot.nameOfDay}</div></td>
                                                    <td><div class="userDatatable-content">${slot.startTime}</div></td>
                                                    <td><div class="userDatatable-content">${slot.endTime}</div></td>
                                                    <td>
                                                        <form action="HandleSlotMentor method="post">
                                                            <input type="hidden" name="selectedId" value="${slot.selectedId}" />
                                                            <button type="submit" name="action" value="2">Approve</button>
                                                            <button type="submit" name="action" value="3">Reject</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
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