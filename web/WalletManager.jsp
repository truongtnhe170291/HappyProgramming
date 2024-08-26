<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wallet</title>
        <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">

        <style>
            .wallet-container {
                width:100%;
                max-width:100%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 15px;
                padding: 30px;
                color: #fff;
                box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
                margin-bottom: 30px;
            }

            .wallet-container h2 {
                font-size: 24px;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

            .wallet-details p {
                font-size: 18px;
                margin-bottom: 10px;
            }

            .wallet-details strong {
                font-weight: 600;
            }

            #walletId, #realBalance {
                font-size: 22px;
                font-weight: 700;
            }
            .contents{
                width:100% !important;
                max-width:100% !important;
            }

            .contents h2 {
                color: #333;
                margin-bottom: 20px;
            }

            .userDatatable {
                background: #fff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                background-color: #f8f9fa;
                color: #495057;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
                border-top: none;
                padding: 15px;
            }

            .table td {
                vertical-align: middle;
                font-size: 15px;
                padding: 15px;
            }

            .table-striped tbody tr:nth-of-type(odd) {
                background-color: rgba(0,0,0,.02);
            }

            .amount {
                font-weight: 600;
            }

            .positive {
                color: #28a745; /* màu xanh cho số dương */
            }

            .negative {
                color: #dc3545; /* màu đỏ cho số âm */
            }

            .pagination {
                display: flex;
                justify-content: right;
                margin-top: 20px;
                margin-right: 20px;
                margin-bottom: 20px;
            }

            .prev {
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
            }

            .next {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
            }

            .pagination a, .pagination span {
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                background-color: #fff;
                border: 1px solid #ddd;
            }

            .pagination span {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }



            .no-transactions {
                text-align: center;
                padding: 20px;
                font-style: italic;
                color: #6c757d;
            }
        </style>


        <script>
            function formatNumber(number) {
                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }

            function formatDate(dateString) {
                const options = {
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',
                    hour12: false
                };
                const date = new Date(dateString);
                return date.toLocaleDateString('vi-VN', options);
            }

            document.addEventListener('DOMContentLoaded', function () {
                const balanceElement = document.getElementById('realBalance');
                if (balanceElement) {
                    balanceElement.textContent = formatNumber(balanceElement.textContent);
                }

                const amountElements = document.querySelectorAll('.amount');
                amountElements.forEach(function (element) {
                    element.textContent = formatNumber(element.textContent) + ' VND';
                });

                const dateElements = document.querySelectorAll('.transaction-date');
                dateElements.forEach(function (element) {
                    element.textContent = formatDate(element.textContent);
                });
            });
        </script>


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
        <jsp:include page="header_Manager.jsp" />

        <main class="main-content">



            <div class="contents">
                <div class="wallet-container">
                    <h2>Wallet Information</h2>
                    <div class="wallet-details">
                        <p><strong>Wallet Name:</strong> <span id="walletId"><c:out value="${wallet.wallet_id}" /></span></p>
                        <p><strong>Real Balance:</strong> <span id="realBalance"><c:out value="${wallet.real_balance}" /></span> VND</p>
                    </div>
                </div>

                <h2>Transaction History</h2>
                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">
                        <table class="table mb-0 table-borderless table-striped">
                            <thead>
                                <tr>

                                    <th>Sender</th>
                                    <th>Receiver</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty listTran}">
                                        <tr>
                                            <td colspan="6" class="no-transactions">No Transactions</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="tran" items="${listTran}">
                                            <tr>

                                                <td><c:out value="${tran.user_send}" /></td>
                                                <td><c:out value="${tran.user_receive}" /></td>
                                                <td class="transaction-date"><c:out value="${tran.create_date}" /></td>
                                                <td class="amount ${tran.user_send == sessionScope.user.userName ? 'negative' : 'positive'}">
                                                    ${tran.user_send == sessionScope.user.userName ? "-" : "+"}${tran.amount}
                                                </td>

                                                <td><c:out value="${tran.message}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="pagination">
                    <c:forEach var="i" begin="1" end="${numPage}">
                        <a href="WalletManager?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>
                </div>
            </div>


            <div class="settingSidebar">
                <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                </a>
                <div class="settingSidebar-body ps-container ps-theme-default">
                    <div class=" fade show active">
                        <div class="setting-panel-header">Setting Panel
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <h6 class="font-medium m-b-10">Sidebar Color</h6>
                        <div class="selectgroup selectgroup-pills sidebar-color">
                            <label class="selectgroup-item">
                                <input type="radio" name="icon-input" value="1"
                                       class="selectgroup-input select-sidebar">
                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                      data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                            </label>
                            <label class="selectgroup-item">
                                <input type="radio" name="icon-input" value="2"
                                       class="selectgroup-input select-sidebar" checked>
                                <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                      data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                            </label>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <h6 class="font-medium m-b-10">Color Theme</h6>
                        <div class="theme-setting-options">
                            <ul class="choose-theme list-unstyled mb-0">
                                <li title="white" class="active">
                                    <div class="white"></div>
                                </li>
                                <li title="cyan">
                                    <div class="cyan"></div>
                                </li>
                                <li title="black">
                                    <div class="black"></div>
                                </li>
                                <li title="purple">
                                    <div class="purple"></div>
                                </li>
                                <li title="orange">
                                    <div class="orange"></div>
                                </li>
                                <li title="green">
                                    <div class="green"></div>
                                </li>
                                <li title="red">
                                    <div class="red"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <div class="theme-setting-options">
                            <label class="m-b-0">
                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                       id="mini_sidebar_setting">
                                <span class="custom-switch-indicator"></span>
                                <span class="control-label p-l-10">Mini Sidebar</span>
                            </label>
                        </div>
                    </div>
                    <div class="p-15 border-bottom">
                        <div class="theme-setting-options">
                            <label class="m-b-0">
                                <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                       id="sticky_header_setting">
                                <span class="custom-switch-indicator"></span>
                                <span class="control-label p-l-10">Sticky Header</span>
                            </label>
                        </div>
                    </div>
                    <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                        <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                            <i class="fas fa-undo"></i> Restore Default
                        </a>
                    </div>
                </div>
            </div>



            <script src="assetss/js/app.min.js"></script>
            <script src="assetss/bundles/jquery-validation/dist/jquery.validate.min.js"></script>
            <!-- JS Libraies -->
            <script src="assetss/bundles/jquery-steps/jquery.steps.min.js"></script>
            <!-- Page Specific JS File -->
            <script src="assetss/js/page/form-wizard.js"></script>
            <!-- Template JS File -->   
            <script src="assetss/js/scripts.js"></script>
            <!-- Custom JS File -->
            <script src="assetss/js/custom.js"></script>
        </main>


    </body>

</html>