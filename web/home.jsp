<%-- Document : home Created on : Jun 1, 2024, 12:09:21 AM Author : 84979 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fmaster</title>
        <jsp:include page="style/linkcss.jsp" />
        <style>
            .nav-author__info {
                display: flex;
                align-items: center;
                padding: 20px;
                background-color: #fff;
                /* Nền của header */
                margin: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                /* Độ đậm của shadow */
            }

            .author-img img {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                margin-right: 20px;
                border: 2px solid #ccc;
            }

            .author-details h2 {
                margin: 0;
                font-size: 24px;
                color: #333;
            }

            .skills {
                margin: 20px;
                background-color: #fff;
                /* Nền của phần skills */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                /* Độ đậm của shadow */
            }

            .skills h3 {
                margin-top: 0;
                font-size: 20px;
            }

            .skills p {
                font-weight: bold;
                margin: 5px 0;
                padding-left: 10px;
                color: #007bff;
                /* Màu chữ của các skill */
            }

            .btn-add-skill {
                display: block;
                margin: 10px 0 0;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .rate-section {
                margin: 20px;
                background-color: #fff;
                /* Nền của phần rate-section */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                /* Độ đậm của shadow */
            }

            .rate-section h2 {
                margin: 0;
                font-size: 20px;
            }

            .tuition-price {
                font-size: 24px;
                font-weight: bold;
                color: tomato;
                /* Màu của số tiền học phí */
            }

            .btn-set-rate {
                display: block;
                margin: 10px 0 0;
                padding: 10px 20px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .author-details .highlight {
                color: #007bff;
                font-weight: bold;
            }

            .feedback-table-wrap {
                padding: 15px;
            }

            .feedback-img {
                display: flex;
                align-items: center;
            }

            .feedback-img-wrapper {
                width: 40px;
                height: 40px;
                margin-right: 10px;
                border-radius: 50%;
                overflow: hidden;
            }

            .feedback-img-wrapper img {
                width: 100%;
                height: auto;
            }

            .table--default {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }

            .table-borderless th,
            .table-borderless td {
                border: none;
                padding: 10px;
            }

            .table th {
                text-align: left;
                background-color: #f8f9fa;
                font-weight: 600;
            }

            .table td {
                vertical-align: middle;
            }

            .order-bg-opacity-primary {
                background-color: rgba(0, 123, 255, 0.1);
            }

            .feedback-table-wrap {
                padding: 15px;
            }

            .feedback-img {
                display: flex;
                align-items: center;
            }

            .feedback-img-wrapper {
                width: 40px;
                height: 40px;
                margin-right: 10px;
                border-radius: 50%;
                overflow: hidden;
            }

            .feedback-img-wrapper img {
                width: 100%;
                height: auto;
            }

            .table--default {
                width: 100%;
                margin-bottom: 1rem;
                color: #212529;
                border-collapse: collapse;
            }

            .table-borderless th,
            .table-borderless td {
                border: none;
                padding: 10px;
            }

            .table th {
                text-align: left;
                background-color: #f8f9fa;
                font-weight: 600;
            }

            .table td {
                vertical-align: middle;
            }

            .order-bg-opacity-primary {
                background-color: rgba(0, 123, 255, 0.1);
            }

            .rating {
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .star-rating {
                display: inline-block;
                font-size: 18px;
                color: #ffc107;
            }

            .star-rating:before {
                content: '★★★★★';
                letter-spacing: 3px;
                background: linear-gradient(90deg, #ffc107 calc(var(--rating) / 5 * 100%), #e4e5e9 calc(var(--rating) / 5 * 100%));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .dashboard-container {
                background-color: #f8f9fa !important;
                padding: 20px !important;
                border-radius: 8px !important;
            }

            .nav-author__info {
                display: flex !important;
                align-items: center !important;
                padding: 20px !important;
                background-color: #fff !important;
                border-radius: 8px !important;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
                margin-bottom: 20px !important;
            }

            .author-img img {
                width: 80px !important;
                height: 80px !important;
                border-radius: 50% !important;
                margin-right: 20px !important;
            }

            .highlight {
                color: #007bff !important;
            }

            .skills,
            .rate-section,
            .overview-section {
                padding: 20px !important;
                background-color: #fff !important;
                border-radius: 8px !important;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1) !important;
                margin-bottom: 20px !important;
            }

            .btn-add-skill,
            .btn-set-rate {
                margin-top: 10px !important;
            }

            .skills p {
                margin: 0 !important;
                font-size: 16px !important;
            }

            .dashboard-container {
                margin-bottom: 20px;
            }

            .rating {
                float: right;
            }

            .card_test {
                opacity: 0;
            }
        </style>


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

                <div class="demo2 mb-25 t-thead-bg">
                    <div class="container-fluid">
                        <div class="row ">
                            <div class="col-lg-12">

                                <div class="breadcrumb-main">
                                    <h1 class="text-capitalize breadcrumb-title">Mentor Homepage</h1>
                                    <div class="breadcrumb-action justify-content-center flex-wrap">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#"><i
                                                            class="uil uil-estate"></i>Statistical</a></li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>

                            </div>


                            <div class="container dashboard-container">
                                <div class="nav-author__info">
                                    <div class="author-img">
                                        <img src="./img/${userAvatar}" alt="Avatar">
                                    </div>
                                    <div class="author-details">
                                        <h2>Hello, <span class="highlight">${userFullName}</span></h2>
                                    </div>
                                </div>

                                <div class="skills">
                                    <h3>Top Price Of Skill :</h3>
                                    <c:forEach items="${skillList}" var="skill">
                                        <p>• ${skill.skillName}</p>
                                    </c:forEach>

                                </div>

                                <div class="rate-section">
                                    <h2>My Salary:
                                        <span class="tuition-price">
                                            <fmt:formatNumber value="${rate}" type="number"
                                                              maxFractionDigits="0" minFractionDigits="0" /> VND
                                        </span>
                                    </h2>
                                </div>

                                <div class="overview-section">
                                    <h2>Over View Request</h2>
                                    <form action="StatisticRequestMentor" method="GET">
                                        <button type="submit" class="btn btn-primary">View Details</button>
                                    </form>
                                   <canvas id="requestChart"></canvas>
                                
                                </div>
                            </div>



                            <div class="col-xxl-3 col-sm-6  col-ssm-12 mb-25">


                                <!-- Card 1  -->
                                <div
                                    class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                                    <div
                                        class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                                        <div class="ap-po-details__titlebar">
                                            <p>Total Requests</p>
                                            <h1>${staticMentor.invitedRequests}</h1>
                                            <div class="ap-po-details-time card_test">
                                                <span class="color-success"><i class="las la-arrow-up"></i>
                                                    <strong>${staticMentor.completePercentage}%</strong></span>
                                                <small>Accept</small>
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
                                <div
                                    class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                                    <div
                                        class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                                        <div class="ap-po-details__titlebar">
                                            <p>Accepted Requests</p>
                                            <h1>${staticMentor.acceptedRequests}</h1>
                                            <div class="ap-po-details-time">
                                                <span class="color-success"><i class="las la-arrow-up"></i>
                                                    <strong>${staticMentor.completePercentage}%</strong></span>
                                                <small>Accept</small>
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
                                <div
                                    class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                                    <div
                                        class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                                        <div class="ap-po-details__titlebar">
                                            <p>Canceled Requests</p>
                                            <h1>${staticMentor.canceledRequests}</h1>
                                            <div class="ap-po-details-time">
                                                <span class="color-danger"><i class="las la-arrow-down"></i>
                                                    <strong>${staticMentor.cancelPercentage}%</strong></span>
                                                <small>Cancel</small>
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
                                <div
                                    class="ap-po-details ap-po-details--luodcy  overview-card-shape radius-xl d-flex justify-content-between">





                                    <div
                                        class=" ap-po-details-content d-flex flex-wrap justify-content-between w-100">
                                        <div class="ap-po-details__titlebar">
                                            <p>Total Mentee Requests</p>
                                            <h1>${countMentee}</h1>
                                            <div class="ap-po-details-time card_test">
                                                <span class="color-success"><i class="las la-arrow-up"></i>
                                                    <strong>${staticMentor.completePercentage}%</strong></span>
                                                <small>Accept</small>
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
                                        <h6>Request List</h6>
                                        <form action="ListRequestMentor" method="get">
                                            <input type="hidden" name="statusFilter" value="2">
                                            <input type="hidden" name="menteeNameFilter" value="">
                                            <button type="submit" class="btn btn-primary">View
                                                Details</button>
                                        </form>
                                    </div>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table table--default table-borderless">
                                                <thead>
                                                    <tr>
                                                        <th>Mentee Name</th>
                                                        <th>Deadline Date</th>
                                                        <th>Title</th>
                                                        <th>Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${list}" var="request">
                                                        <tr>
                                                            <td>${request.menteeName}</td>
                                                            <td>${request.deadlineDate}</td>
                                                            <td>${request.title}</td>
                                                            <td>${request.price}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-xxl-8 mb-25">
                                <div class="card border-0 px-25">
                                    <h2>Feedback From My Mentee</h2>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="feedback-list"
                                             role="tabpanel">
                                            <div class="feedback-table-wrap">
                                                <div class="table-responsive">
                                                    <table class="table table--default table-borderless">
                                                        <thead>
                                                            <tr>
                                                                <th>Mentee Name</th>
                                                                <th>Time Feedback</th>
                                                                <th>Comment</th>
                                                                <th>Star</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="fb" items="${feedback}">
                                                                <tr>
                                                                    <td>
                                                                        <div
                                                                            class="feedback-img d-flex align-items-center">
                                                                            <div
                                                                                class="feedback-img-wrapper order-bg-opacity-primary align-items-end">
                                                                                <img class="img-fluid"
                                                                                     src="img/${fb.avatar}"
                                                                                     alt="img">
                                                                            </div>
                                                                            <span>${fb.menteeName}</span>
                                                                        </div>
                                                                    </td>
                                                                    <td>${fb.timeFeedBack}</td>
                                                                    <td>${fb.comment}</td>
                                                                    <td style="justify-content: center">
                                                                        <div class="rating"
                                                                             data-rating="${fb.star}">
                                                                            <span
                                                                                class="star-rating"></span>

                                                                        </div>
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
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
         <script>
        // Tạo các mảng JavaScript để lưu trữ tháng và số lượng yêu cầu
        const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        const requestCounts = new Array(12).fill(null); // Khởi tạo mảng với 12 giá trị null

        // Sử dụng JSTL c:forEach để duyệt qua danh sách 'totalR' và thêm giá trị vào mảng
        <c:forEach var="entry" items="${totalR}">
            const monthIndex = ${entry.month} - 1; // Chuyển đổi tháng về chỉ số (0-based index)
            requestCounts[monthIndex] = ${entry.total_requests};
        </c:forEach>;

        // In ra console để kiểm tra
        console.log("Months:", months);
        console.log("Request Counts:", requestCounts);

        // Khởi tạo biểu đồ với dữ liệu
        const ctx = document.getElementById('requestChart').getContext('2d');
        const requestChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: 'Number of Requests',
                    data: requestCounts,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                document.querySelectorAll('.rating').forEach(rating => {
                    let starRating = rating.querySelector('.star-rating');
                    let ratingValue = rating.getAttribute('data-rating');
                    starRating.style.setProperty('--rating', ratingValue);
                });
            });
        </script>

    </body>

</html>