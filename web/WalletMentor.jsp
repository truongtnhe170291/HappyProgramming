<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wallet</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                color: white;
            }

            .form-container .schedule-table .tableslot th,
            .form-container .schedule-table .tableslot td {
                border: 0.2px solid #e0e0e0 !important;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #4285f4;
                font-weight: bold;
                border-bottom: 2px solid #ffffff;
            }

            td {
                background-color: #ffffff;
                color: #333;
                vertical-align: top;
                height: 100px;
                border-bottom: 1px solid #e0e0e0;
            }

            td+td {
                border-left: 1px solid #e0e0e0;
            }

            tr+tr td {
                border-top: 1px solid #e0e0e0;
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            li {
                align-items: center;
                list-style: none;
                margin-bottom: 5px;
            }

            button {
                border-radius: 40%;
                width: 60px;
                height: 41px;
                background-color: #fff;
                margin-right: 5px;
                color: white;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
            }

            .modal-content.radius-xl {
                border-radius: 15px;
                padding: 20px;
                background-color: #fff;
            }

            .modal-body.pb-sm-50.pb-30 {
                padding-bottom: 50px;
            }

            .ticket_modal-modal h1 {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .ticket_modal-modal div {
                font-size: 16px;
                margin-bottom: 10px;
            }

            .ticket_modal-modal section {
                margin-top: 20px;
            }

            .calendar .header {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
                text-align: center;
            }

            .calendar .day {
                border-bottom: 1px solid #ccc;
                padding: 10px 0;
            }

            .calendar .day-header {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .calendar .event {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .calendar .event-dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .ticket_modal-modal label {
                font-weight: bold;
            }

            .status-open {
                width: 100px !important;
                height: 50px !important;
                color: greenyellow !important;
            }

            .status-processing {
                width: 100px !important;
                height: 50px !important;
                color: yellow !important;
            }

            .status-cancel,
            .status-closed {
                width: 100px !important;
                height: 50px !important;
                color: red !important;
            }

            .custom_modal {
                transform: translateX(50px);
                max-width: 100% !important;
                width: 90% !important;
            }

            .week-selector {
                background-color: #4285f4;
                color: white;
                padding: 5px;
                border: none;
            }

            .slot-info {
                background-color: #e8f0fe;
                padding: 5px;
                margin-bottom: 5px;
                border-radius: 4px;
                font-size: 12px;
            }

            .class-code {
                font-weight: bold;
                color: #4285f4;
            }

            .view-materials,
            .edu-next {
                display: inline-block;
                padding: 2px 5px;
                margin: 2px;
                font-size: 10px;
                border-radius: 3px;
            }

            .view-materials {
                background-color: #fbbc05;
                color: white;
            }

            .edu-next {
                background-color: #4285f4;
                color: white;
            }

            .room-info {
                color: #4285f4;
            }

            .attendance {
                font-style: italic;
            }

            .attendance.attended {
                color: #4285f4;
            }

            .attendance.absent {
                color: #ea4335;
            }

            .hd {
                background-color: #4285f4 !important;
            }

            .time-info {

                display: flex;
                justify-content: center;
                font-size: 11px;
                color: #80e27e;
            }

            .empty-cell {
                height: 100%;
            }
            .filter-container {
                display: flex;
                align-items: center;
                gap: 20px;
                background-color: #f5f5f5;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .filter-group {
                display: flex;
                flex-direction: column;
                flex: 1;
            }

            .filter-group label {
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            .filter-group select,
            .filter-group input {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            .filter-group select {
                appearance: none;
                background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
                background-repeat: no-repeat;
                background-position: right 12px top 50%;
                background-size: 12px auto;
            }

            .filter-button {
                width: 120px !important;
                margin-top: 30px;
                background-color: #4CAF50 !important;
                color: #000;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .filter-button:hover {
                background-color: #ccc !important;
            }
            .d-flex {
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
            }

            .btn-primary {
                padding: 0 !important;
                width: 40px !important;
                height: 40px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                background-color: #fff !important;
                border: none !important;
                margin: 0 5px !important;
            }

            .fas, .uil {
                font-size: 18px !important;
                color: #000 !important;
                width: auto !important;
                height: auto !important;
                line-height: normal !important;
            }

            form {
                margin: 0 !important;
            }

            button[type="submit"] {
                padding: 0 !important;
                width: 40px !important;
                height: 40px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                border: none !important;
                border-radius: 0.42rem !important;
            }

            .action-btn {
                margin: 0 !important;
                display: flex !important;
                align-items: center !important;
            }
            .custome{
                background-color: #80e27e !important;
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




        </style>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


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
<h1 class="userDatatable-title">Wallet Information</h1>              
         <h1 class="userDatatable-title">Transaction</h1>              

                <div class="userDatatable userDatatable--ticket mt-1">
                    <div class="table-responsive">
                        <table class="table mb-0 table-borderless">

                            <thead class="hd">
                                <tr class="userDatatable-header">
                                   <th><span class="userDatatable-title">Wallet ID: <c:out value="${wallet.wallet_id}" /></span></th>
                                                <th><span class="userDatatable-title">Real Balance: <c:out value="${wallet.real_balance}" /></span></th>
                            
                                             
                                </tr>
                            </thead>

                            <c:forEach var="tran" items="${listTran}">
                                <tr>
                                  <td><c:out value="${tran.transaction_id}" /></td>
                        <td><c:out value="${tran.user_send}" /></td>
                        <td><c:out value="${tran.user_receive}" /></td>
                        <td><c:out value="${tran.create_date}" /></td>
                        <td><c:out value="${tran.amount}" /></td>
                        <td><c:out value="${tran.message}" /></td>
                                </tr>
                            </c:forEach>
                        </table>
                      



        <div class="pagination">
            <c:forEach var="i" begin="1" end="${numPage}">
                <a href="WalletMentorServlet?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>
        </div>
      </div>







                    </div>
                </div>
            </div>
        </main>
     

    </body>

</html>