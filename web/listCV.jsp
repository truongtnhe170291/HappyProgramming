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
                                                            <span class="userDatatable-title">Note</span>
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
                                                                        <a href="#" class="profile-image rounded-circle d-block m-0" style="background-image:url('./imgcv/${cv.imgcv}'); background-size: cover;"></a>
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
                                                                    <span class="bg-opacity-warning color-warning userDatatable-content-status">${cv.status.statusName}</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <!--<textarea id="note_${cv.cvId} class="userDatatable-content--date""></textarea>-->
                                                                <input id="note_${cv.cvId}" required name="note" value="" class="userDatatable-content--date" type="text" />
                                                            </td>
                                                            <td>
                                                                <ul class="orderDatatable_actions mb-0 d-flex flex-wrap">
                                                                    <li>
                                                                        <div class="action-btn">
                                                                            <a href="#" class="btn btn-primary centaxs" data-bs-toggle="modal" data-bs-target="#${cv.userName}" style="background-color: #fff; border: none;">
                                                                                <i class="uil uil-eye"></i>
                                                                            </a>
                                                                            <div class="modal fade ticket_modal" id="${cv.userName}" role="dialog" tabindex="-1" aria-hidden="true">
                                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                                                    <div class="modal-content radius-xl">
                                                                                        <div class="modal-body pb-sm-50 pb-30">
                                                                                            <div class="modal-header">
                                                                                                <h1>Detail</h1>
                                                                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                                    <img src="img/svg/x.svg" alt="x" class="svg">
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="ticket_modal-modal">
                                                                                                <div>Mentor Name: ${cv.userName}</div><br>
                                                                                                <div>Email: ${cv.gmail}</div><br>
                                                                                                <div>Full name: ${cv.fullName}</div><br>
                                                                                                <div>DoB: ${cv.dob}</div><br>
                                                                                                <div>Gender: ${cv.sex ? "Male" : "Female"}</div><br>
                                                                                                <div>Address: ${cv.address}</div><br>
                                                                                                <div>Profession: ${cv.profession}</div><br>
                                                                                                <div>Profession Introduction: ${cv.professionIntro}</div><br>
                                                                                                <div>Achievement Description: ${cv.achievementDescription}</div><br>
                                                                                                <div>Service Description: ${cv.serviceDescription}</div><br>
                                                                                                <div>Skills:
                                                                                                    <c:forEach items="${cv.listSkill}" var="skill">
                                                                                                        <p>${skill.skillName}</p>
                                                                                                    </c:forEach>
                                                                                                </div><br>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <form id="form_${cv.cvId}">
                                                                            <button class="edit" id="edit_${cv.cvId}">
                                                                                <i class="uil uil-check"></i>
                                                                            </button>
                                                                            <input type="hidden" name="cvId" value="${cv.cvId}" />
                                                                            <input type="hidden" name="status" value="2" />
                                                                            <input id="note_Input_${cv.cvId}" type="hidden" name="note" value="" />
                                                                        </form>
                                                                    </li>
                                                                    <li>
                                                                        <button class="reject" id="edit_${cv.cvId}">
                                                                            <i class="uil uil-times"></i>
                                                                        </button>
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
        <form id="myForm"></form>
        <script>
            document.addEventListener('DOMContentLoaded', (e) => {
                const editButtons = document.querySelectorAll('.edit');
                editButtons.forEach(button => {
                    button.addEventListener('click', function (event) {
                        event.preventDefault();
                        const cvId = this.id.split('_')[1];
                        const note = document.getElementById('note_' + cvId);
                        const noteInput = document.getElementById('note_Input_' + cvId);

                        noteInput.value = note.value;
                        const form = document.getElementById('form_' + cvId);
                        form.action = 'changeStatus?cvId=' + cvId + '&status=2&note=' + note;
                        form.method = 'get';
                        form.submit();
                    });
                });
                const rejectButtons = document.querySelectorAll('.reject');
                rejectButtons.forEach(button => {
                    button.addEventListener('click', function (event) {
                        event.preventDefault();
                        const cvId = this.id.split('_')[1];
                        const note = document.getElementById('note_' + cvId);
                        const noteInput = document.getElementById('note_Input_' + cvId);

                        noteInput.value = note.value;
                        const form = document.getElementById('form_' + cvId);
                        form.action = 'changeStatus?cvId=' + cvId + '&status=3&note=' + note;
                        form.method = 'get';
                        form.submit();
                    });
                });
            });
        </script>
    </body>

</html>
