<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wallet</title>
      

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    .wallet-container {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 15px;
        padding: 30px;
        color: #fff;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        margin-bottom: 30px;
    }

    .wallet-info h2 {
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
    }

    .table td {
        vertical-align: middle;
        font-size: 15px;
    }

    .table-striped tbody tr:nth-of-type(odd) {
        background-color: rgba(0,0,0,.02);
    }

    .amount {
        font-weight: 600;
        color: #28a745;
    }

    .pagination {
        justify-content: center;
        margin-top: 20px;
    }

    .pagination a {
        color: #007bff;
        background-color: #fff;
        border: 1px solid #dee2e6;
        padding: 8px 16px;
        margin: 0 4px;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    .pagination a:hover, .pagination a.active {
        background-color: #007bff;
        color: #fff;
        border-color: #007bff;
    }

    .no-transactions {
        text-align: center;
        padding: 20px;
        font-style: italic;
        color: #6c757d;
    }
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="wallet-container">
                            <div class="wallet-info">
                                <h2>Wallet Information</h2>
                                <div class="wallet-details">
                                    <p><strong>Wallet Name:</strong> <span id="walletId"><c:out value="${wallet.wallet_id}" /></span></p>
                                    <p><strong>Balance:</strong> <span id="realBalance"><c:out value="${wallet.real_balance}" /></span> </p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="userDatatable userDatatable--ticket mt-1">
                            <div class="table-responsive">
                                <table class="table mb-0 table-borderless">
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
                                                        <td class="amount"><c:out value="${tran.amount}" /></td>
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
                                <a href="WalletMentorServlet?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

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

    document.addEventListener('DOMContentLoaded', function() {
        const balanceElement = document.getElementById('realBalance');
        if (balanceElement) {
            balanceElement.textContent = formatNumber(balanceElement.textContent) + ' VND';
        }

        const amountElements = document.querySelectorAll('.amount');
        amountElements.forEach(function(element) {
            element.textContent = formatNumber(element.textContent) + ' VND';
        });

        const dateElements = document.querySelectorAll('.transaction-date');
        dateElements.forEach(function(element) {
            element.textContent = formatDate(element.textContent);
        });
    });
</script>

  
</body>

</html>