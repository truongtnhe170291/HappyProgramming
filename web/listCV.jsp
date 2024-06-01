<%-- 
    Document   : listCV
    Created on : Jun 1, 2024, 1:08:40 AM
    Author     : 84979
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fmaster</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" /><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                        <div class="col-lg-12 mb-30">
                            <div class="card mt-30">
                                <div class="card-body">

                                    <div class="userDatatable adv-table-table global-shadow border-light-0 w-100 adv-table">
                                        <div class="table-responsive">
                                            <div class="adv-table-table__header">
                                                <h4>List CV</h4>

                                            </div>
                                            <div id="filter-form-container"></div>
                                            <table class="table mb-0 table-borderless adv-table" data-sorting="true" data-filter-container="#filter-form-container" data-paging-current="1" data-paging-position="right" data-paging-size="10">
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
                                                            <span class="userDatatable-title float-end">action</span>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.cvList}" var="cv">
                                                        <tr>
                                                            <td>
                                                                <div class="userDatatable-content">${cv.cvId}</div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex">
                                                                    <div class="userDatatable-inline-title">
                                                                        <h6>${cv.fullName}</h6>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="userDatatable-content d-inline-block">
                                                                    <span class="bg-opacity-success  color-success rounded-pill userDatatable-content-status active">Pending</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <ul class="orderDatatable_actions mb-0 d-flex flex-wrap">
                                                                    <li>
                                                                        <a href="CVDetailServlet?cvId=${cv.cvId}" class="view">
                                                                            <i class="uil uil-eye"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=2&mentorName=${cv.userName}" class="edit">
                                                                            <i class="fa-solid fa-check"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="ChangeCVStatusServlet?cvId=${cv.cvId}&status=3" class="remove">
                                                                            <i class="fa-solid fa-xmark"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>



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
