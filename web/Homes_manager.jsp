<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>Manager</title>
        <!-- General CSS Files -->
        <link rel="stylesheet" href="assetss/css/app.min.css">
        <!-- Template CSS -->
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="assetss/css/custom.css">

        <style>
            /* Add this to your style.css or inside a <style> tag in the <head> section */
            .amount.positive {
                color: green;
            }

            .amount.negative {
                color: red;
            }
 .pagination {
        display: flex;
        gap: 5px;
    }
    .page-link {
        padding: 5px 10px;
        text-decoration: none;
        color: #333;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 3px;
        transition: background-color 0.3s, color 0.3s;
    }
    .page-link:hover {
        background-color: #f0f0f0;
    }
    .page-link.active {
        background-color: #0074D9;
        color: white;
        border-color: #4CAF50;
    }
    .filter-container {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 20px;
}

.filter-input {
  margin-right: 10px;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.filter-button {
  padding: 8px 15px;
  background-color: #4e73df;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.filter-button:hover {
  background-color: #2e59d9;
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
    <body>

        <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <jsp:include page="header_Manager.jsp" />
                <!-- Main Content -->
                <div class="main-content">
                    <section class="section">
                        <ul class="breadcrumb breadcrumb-style ">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Dashboard</h4>
                            </li>

                        </ul>
                        <div class="row">
                            <div class="col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-statistic-4">
                                        <div class="info-box7-block">
                                            <h6 class="m-b-20 text-right">Total Request CV</h6>
                                            <h4 class="text-right"><i class="fas fa-address-card pull-left bg-indigo c-icon"></i><span>${totalCVs} CVs</span>
                                            </h4>
                                            <div style="display: flex; justify-content: space-between">
                                                <!--                                                <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-up col-green m-r-5"></i><span
                                                                                                        class="text-success font-weight-bold">23%</span> then previous month</p>
                                                <!--<a style="padding-top: 18px" href="listCV">View detail</a>-->
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-statistic-4">
                                        <div class="info-box7-block">
                                            <h6 class="m-b-20 text-right">Registered Users</h6>
                                            <h4 class="text-right"><i class="fas fa-users pull-left bg-cyan c-icon"></i><span>${totalAcc} Accounts</span>
                                            </h4>
                                            <div style="display: flex; justify-content: space-between">
                                                <!--                                                <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-up col-red m-r-5"></i><span
                                                                                                        class="col-red font-weight-bold">3%</span> then previous month</p>
                                                <!--<a style="padding-top: 18px" href="accountstatus">View detail</a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-statistic-4">
                                        <div class="info-box7-block">
                                            <h6 class="m-b-20 text-right">Total Request Schedule</h6>
                                            <h4 class="text-right"><i
                                                    class="fas fa-calendar pull-left bg-brown c-icon"></i><span>${totalRequest} Requests</span>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-statistic-4">
                                        <div class="info-box7-block">
                                            <h6 class="m-b-20 text-right">Total Skills</h6>
                                            <h4 class="text-right"><i
                                                    class="fas fa-code pull-left bg-green c-icon"></i><span>${totalSkills} Skills</span>
                                            </h4>
                                            <div style="display: flex; justify-content: space-between">
                                                <!--                                                <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-down col-red m-r-5"></i><span
                                                                                                        class="col-red font-weight-bold">05%</span> then previous month</p>
                                                <!--<a style="padding-top: 18px" href="">View detail</a>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                       <div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4>History Transactions</h4>
                <div class="card-header-form">
                   <div class="filter-container">
  <input type="text" id="search-remitter" class="filter-input" placeholder="Search sender...">
  <input type="text" id="search-receiver" class="filter-input" placeholder="Search receiver...">
  <input type="date" id="search-date" class="filter-input">
  <button id="filter-button" class="filter-button">Filter</button>
</div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped" id="transaction-table">
                        <thead>
                            <tr>
                                <th>Sender</th>
                                <th>Receiver</th>
                                <th>Time</th>
                                <th>Message</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody id="transaction-body">
                            <c:forEach items="${listTran}" var="tran">
                                <tr>
                                    <td class="sender">${tran.user_send}</td>
                                    <td class="receiver">${tran.user_receive}</td>
                                    <td class="date">${tran.create_date}</td>
                                    <td>${tran.message}</td>
                                    <td class="amount ${tran.user_send == sessionScope.user.userName ? 'negative' : 'positive'}">
                                        ${tran.user_send == sessionScope.user.userName ? "-" : "+"}${tran.amount}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:if test="${listTran eq null}">
                    <p style="text-align: center; color: red">There are no suitable record...</p>
                </c:if>
            </div> 
           <div style="display: flex; justify-content: flex-end; margin-bottom: 5px;">
    <div class="pagination">
        <c:forEach begin="1" end="${requestScope.numPage}" var="i">
            <a href="transaction?action=manager&index=${i}" 
               class="page-link ${param.index == i ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>
</div>
        </div>
    </div>
</div>


                    </section>
                    <div class="settingSidebar">
                        <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
                        </a>
                        <div class="settingSidebar-body ps-container ps-theme-default">
                            <div class=" fade show active">
                                <div class="setting-panel-header">Setting Panel
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Select Layout</h6>
                                    <div class="selectgroup layout-color w-50">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                                            <span class="selectgroup-button">Light</span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                                            <span class="selectgroup-button">Dark</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="p-15 border-bottom">
                                    <h6 class="font-medium m-b-10">Sidebar Color</h6>
                                    <div class="selectgroup selectgroup-pills sidebar-color">
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                                  data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                                        </label>
                                        <label class="selectgroup-item">
                                            <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
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
                    </div>
                </div>

            </div>
        </div>
                                            <script>
                                               document.addEventListener('DOMContentLoaded', () => {
    const searchRemitter = document.getElementById('search-remitter');
    const searchReceiver = document.getElementById('search-receiver');
    const searchDate = document.getElementById('search-date');
    const filterButton = document.getElementById('filter-button');
    const transactionBody = document.getElementById('transaction-body');
    const rows = Array.from(transactionBody.getElementsByTagName('tr'));

    function filterTransactions() {
        const remitterValue = searchRemitter.value.toLowerCase();
        const receiverValue = searchReceiver.value.toLowerCase();
        const dateValue = searchDate.value;

        rows.forEach(row => {
            const sender = row.querySelector('.sender').textContent.toLowerCase();
            const receiver = row.querySelector('.receiver').textContent.toLowerCase();
            const date = new Date(row.querySelector('.date').textContent);
            const formattedDate = date.toISOString().split('T')[0];

            const matchesRemitter = sender.includes(remitterValue);
            const matchesReceiver = receiver.includes(receiverValue);
            const matchesDate = !dateValue || formattedDate === dateValue;

            row.style.display = matchesRemitter && matchesReceiver && matchesDate ? '' : 'none';
        });
    }

    filterButton.addEventListener('click', filterTransactions);
});
                                            </script>
        <!-- General JS Scripts -->
        <script src="assetss/js/app.min.js"></script>
        <!-- JS Libraies -->
        <script src="assetss/bundles/apexcharts/apexcharts.min.js"></script>
        <script src="assetss/bundles/amcharts4/core.js"></script>
        <script src="assetss/bundles/amcharts4/charts.js"></script>
        <script src="assetss/bundles/amcharts4/animated.js"></script>
        <script src="assetss/bundles/jquery.sparkline.min.js"></script>
        <!-- Page Specific JS File -->
        <script src="assetss/js/page/index.js"></script>
        <!-- Template JS File -->
        <script src="assetss/js/scripts.js"></script>
        <!-- Custom JS File -->
        <script src="assetss/js/custom.js"></script>
    </body>

</html>