<%-- 
    Document   : Wallet
    Created on : Jun 14, 2024, 10:52:41 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Guarda Wallet</title>

        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }

            .browser-frame {
                max-width: 1200px;
                margin: 20px auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }

            .browser-top {
                background: #f0f0f0;
                padding: 10px;
                display: flex;
                align-items: center;
            }

            .browser-buttons span {
                display: inline-block;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin-right: 6px;
            }

            .browser-buttons span:nth-child(1) {
                background-color: #ff5f56;
            }
            .browser-buttons span:nth-child(2) {
                background-color: #ffbd2e;
            }
            .browser-buttons span:nth-child(3) {
                background-color: #27c93f;
            }

            .browser-address {
                margin-left: 20px;
                padding: 4px 8px;
                background: white;
                border-radius: 4px;
                font-size: 14px;
                color: #555;
            }

            .app-content {
                padding: 20px;
            }

            header {
                margin-bottom: 20px;
            }

            nav ul {
                list-style-type: none;
                display: flex;
                padding: 0;
            }

            nav ul li {
                margin-right: 20px;
                cursor: pointer;
                font-weight: bold;
                color: #555;
            }

            nav ul li.active {
                color: #4285f4;
                border-bottom: 2px solid #4285f4;
                padding-bottom: 5px;
            }

            nav ul li sup {
                background-color: #4285f4;
                color: white;
                padding: 2px 4px;
                border-radius: 4px;
                font-size: 10px;
                margin-left: 2px;
            }

            main {
                height: auto;
                display: flex !important;
                gap: 20px;
            }

            .wallet-overview,
            .transaction-history {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.05);
                padding: 20px;
            }

            .wallet-overview {
                flex: 1;
            }

            .total-balance h1 {
                font-size: 28px;
                margin: 0;
            }

            .total-balance span {
                font-size: 16px;
                color: #888;
            }

            .wallet-stats {
                color: #888;
                font-size: 12px;
                margin-top: 5px;
            }

            .wallet-list {
                margin-top: 20px;
            }

            .wallet-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
                border-bottom: 1px solid #eee;
            }

            .wallet-icon {
                width: 32px;
                height: 32px;
                margin-right: 15px;
            }

            .wallet-info h3 {
                margin: 0;
                font-size: 16px;
            }

            .wallet-info p {
                margin: 0;
                font-size: 14px;
                color: #888;
            }

            .transaction-history {
                flex: 2;
            }

            .tabs {
                display: flex;
                border-bottom: 1px solid #eee;
                margin-bottom: 20px;
            }

            .tabs button {
                background: none;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 14px;
                color: #555;
            }

            .tabs button.active {
                color: #4285f4;
                border-bottom: 2px solid #4285f4;
            }

            .tab-content {
                display: none;
            }

            .tab-content.active {
                display: block;
            }
            .Bynance {
                right: 0;
                float: right;
                cursor-pointer: none;
            }
            .filters {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
            }

            .filters select,
            .filters input {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            .transactions {
                width: 100%;
                border-collapse: collapse;
            }

            .transactions td {
                padding: 10px 0;
                border-bottom: 1px solid #eee;
                font-size: 14px;
            }

            .transactions td:last-child {
                text-align: right;
                color: #27ae60;
            }

            .deposit-form {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
            }

            .deposit-form h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group select,
            .form-group input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .deposit-btn {
                width: 100%;
                padding: 10px;
                background-color: #4caf50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .total-balance h1 {
                font-family: 'Arial', sans-serif;
                font-size: 24px;
                color: #333;
                font-weight: bold;
            }

            .deposit-btn:hover {
                background-color: #45a049;
            }
            .negative-amount {
                color: red;
            }
            .hold_history {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .hold_history tr {
                border-bottom: 1px solid #ccc;
            }

            .hold_history td {
                padding: 10px;
                text-align: left;
            }

            .hold_history .test_trans {
                text-align: right;
            }

            .hold_history .negative {
                color: red;
            }

            .hold_history .positive {
                color: #27ae60;
            }

            .hold_history a {
                text-decoration: none;
                color: #007bff;
                margin: 0 5px;
            }

            .hold_history a:hover {
                text-decoration: underline;
            }
            .hold_history {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .hold_history tr {
                border-bottom: 1px solid #ccc;
            }

            .hold_history td {
                padding: 10px;
                text-align: left;
            }

            .hold_history .test_trans {
                text-align: right;
            }

            .hold_history .negative {
                color: red;
            }

            .hold_history .positive {
                color: #27ae60;
            }

            .hold_history a {
                text-decoration: none;
                color: #007bff;
                margin: 0 5px;
            }

            .hold_history a:hover {
                text-decoration: underline;
            }
            .pt{
                padding: 0 4px;
                line-height: 30px;
                border-radius: 5px;
                text-align: center;
                width:30px;
                height:30px;
                float:right;
                margin-top:20px;
                background-color:#ccc;
            }
            /* Đặt cho khung thông báo */
            .no-transaction-message {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 200px;
                background-color: rgba(0, 0, 0, 0.1);
                border: 1px solid #ccc;
                border-radius: 10px;
                font-size: 18px;
                color: #333;
            }

            #holdContent .pt,
            #historyContent .pt {
                display: none;
            }

        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="browser-frame">

            <div class="app-content">
                <header>
                    <nav>
                        <ul>
                            <li class="active">WALLETS</li>
                        </ul>
                    </nav>
                </header>
                <main>
                    <section class="wallet-overview">
                        <div class="total-balance">
                            <h3>Hold: <span id="available_binance" value="${requestScope.wallet.hold}">${requestScope.wallet.hold}</span><span> VND</span></h3>
                        </div>
                        <div class="total-balance">
                            <h3>Balance: <span id="real_binance" value="${requestScope.wallet.real_balance}">${requestScope.wallet.real_balance}</span><span> VND</span></h3>
                        </div>

                        <!--            <div class="wallet-list"></div>-->
                    </section>
                    <section class="transaction-history">
                        <div class="tabs">
                            <button class="active" id="historyBtn">History</button>
                            <button  id="holdBtn">Hold</button>
                            <button id="depositBtn">Deposit</button>
                        </div>
                        <div id="historyContent" class="tab-content active">
                            <table class="transactions">
                                <c:forEach items="${requestScope.listTran}" var="tran">
                                    <tr>
                                        <td>${tran.create_date}</td>
                                        <td>${tran.message}</td>
                                        <td class="test_trans ${tran.amount < 0 ? 'negative' : 'positive'}" value="${tran.amount}">
                                            ${tran.user_send == sessionScope.user.userName ? "-" : "+"}${tran.amount} VNĐ
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="pt">
                                <c:forEach begin="1" end="${requestScope.numPage}" var="i">
                                    <a href="transaction?action=mentee&index=${i}">${i}</a> &nbsp;
                                </c:forEach>
                            </div>
                        </div>

                        <div id="holdContent" class="tab-content">
                            <table class="hold_history">
                                <c:forEach items="${requestScope.listHold}" var="hold">
                                    <tr>
                                        <td class="dateTime">${hold.create_date}</td>
                                        <td>${hold.message}</td>
                                        <td class="test_trans ${hold.amount < 0 ? 'negative' : 'positive'}" value="${hold.amount}">
                                            ${hold.hold ? "+" : "-"}${hold.amount} VNĐ
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="pt">
                                <c:forEach begin="1" end="${requestScope.numPageHold}" var="i">
                                    <a href="PagingHold?action=menteeHold&index=${i}">${i}</a> &nbsp;
                                </c:forEach>
                            </div>
                        </div>


                        <div id="depositContent" class="tab-content">
                            <div class="deposit-form">
                                <h2>Deposit Funds</h2>
                                <form action="vnp" method="POST">
                                    <div class="form-group">
                                        <label for="amount">Amount</label>
                                        <input name="amount"
                                               type="number"
                                               id="amount"
                                               placeholder="Enter amount"
                                               oninput="validateAmount(this)"
                                               required
                                               />
                                    </div>
                                    <div class="form-group">
                                        <label for="walletAddress">Message</label>
                                        <input name="message"
                                               type="text"
                                               id="walletAddress"
                                               placeholder="Enter Message"
                                               required
                                               />
                                    </div>
                                    <button type="submit" class="deposit-btn">
                                        Confirm Deposit
                                    </button>
                                </form>
                            </div>
                        </div>
                    </section>

                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                function formatNumberWithDots(number) {
                    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                }

                function updateBalanceDisplay(elementId) {
                    const element = document.getElementById(elementId);
                    const value = parseInt(element.getAttribute("value"), 10);
                    element.textContent = formatNumberWithDots(value);
                }

                updateBalanceDisplay("available_binance");
                updateBalanceDisplay("real_binance");
            });
        </script>
        <script>
            function formatDateTime(dateTime) {
                return dateTime.replace("T", " ");
            }

            document.addEventListener("DOMContentLoaded", function () {
                const dateTimeCells = document.querySelectorAll(".hold_history td.dateTime");
                dateTimeCells.forEach(cell => {
                    cell.textContent = formatDateTime(cell.textContent);
                });
            });
        </script>
        <script>
            const historyContent = document.getElementById('historyContent');
            const holdContent = document.getElementById('holdContent');
            const hasHistoryTransactions = historyContent.querySelectorAll('.transactions tr').length > 0;
            const hasHoldTransactions = holdContent.querySelectorAll('.hold_history tr').length > 0;

            if (!hasHistoryTransactions) {
                const noTransactionMessage = document.createElement('p');
                noTransactionMessage.textContent = 'No Transaction';
                noTransactionMessage.classList.add('no-transaction-message');
                historyContent.appendChild(noTransactionMessage);
            }

            if (!hasHoldTransactions) {
                const noTransactionMessage = document.createElement('p');
                noTransactionMessage.textContent = 'No Hold';
                noTransactionMessage.classList.add('no-transaction-message');
                holdContent.appendChild(noTransactionMessage);
            }

            if (hasHistoryTransactions && hasHoldTransactions) {
                document.querySelectorAll('.pt').forEach((element) => element.style.display = 'block');
            }
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                function formatNumberWithDotss(number) {
                    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VNĐ";
                }

                function updateTransactionAmounts(selector) {
                    const elements = document.querySelectorAll(selector);
                    elements.forEach(element => {
                        const value = parseInt(element.getAttribute("value"), 10);
                        const sign = element.textContent.trim().charAt(0);
                        const formattedValue = formatNumberWithDotss(Math.abs(value));
                        element.textContent = sign + formattedValue;
                    });
                }

                updateTransactionAmounts("#historyContent .test_trans");
                updateTransactionAmounts("#holdContent .test_trans");
            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const amountInput = document.getElementById('amount');
                const depositBtn = document.querySelector('.deposit-btn');
                amountInput.addEventListener('input', function () {
                    validateAmount(this.value);
                });
                function validateAmount(value) {
                    let parsedAmount = parseInt(value);
                    if (parsedAmount < 100000 || parsedAmount > 10000000) {
                        depositBtn.disabled = true;
                        Toastify({
                            text: 'Amount must be between 100,000 and 10,000,000',
                            duration: 3000,
                            gravity: 'top',
                            position: 'right',
                            backgroundColor: 'linear-gradient(to right, #00b09b, #96c93d)',
                            stopOnFocus: true,
                            close: true
                        }).showToast();
                    } else {
                        depositBtn.disabled = false;
                    }
                }
            });
        </script>
        <script>
            document.querySelectorAll('.transactions td:first-child').forEach(function (td) {
                td.textContent = td.textContent.replace('T', ' ');
            });
            document.querySelectorAll('.test_trans').forEach(function (td) {
                if (td.textContent.trim().startsWith('-')) {
                    td.style.color = 'red';
                }
            });
            const wallets = [
                {name: "SHIBA INU", amount: 39900, value: 0.24, icon: "shiba.png"},
            ];
            const transactions = [
                {
                    date: "26 Jun 2021",
                    time: "07:45 pm",
                    description: "Tezos staking reward",
                    amount: "+0.000247 XTZ",
                },
            ];
            function populateWallets() {
                const walletList = document.querySelector(".wallet-list");
                wallets.forEach(wallet => {
                    const walletItem = document.createElement('div');
                    walletItem.classList.add('wallet-item');
                    walletItem.innerHTML = '<img src="' + wallet.icon + '" class="wallet-icon" alt="' + wallet.name + '">' +
                            '<div class="wallet-info">' +
                            '<h3>' + wallet.name + '</h3>' +
                            '<p>' + (wallet.amount < 1 ? wallet.amount.toFixed(5) : wallet.amount.toFixed(2)) + ' - $' + wallet.value.toFixed(2) + '</p>' +
                            '</div>';
                    walletList.appendChild(walletItem);
                });
            }

            function populateTransactions() {
                const transactionTable = document.querySelector(".transactions");
                transactions.forEach(transaction => {
                    const row = transactionTable.insertRow();
                    row.innerHTML = '<td>' + transaction.date + '<br>' + transaction.time + '</td>' +
                            '<td>' + transaction.description + '</td>' +
                            '<td>' + transaction.amount + '</td>';
                });
            }


            function switchTab(tabId) {
                document.querySelectorAll(".tab-content").forEach((content) => {
                    content.classList.remove("active");
                });
                document.querySelectorAll(".tabs button").forEach((btn) => {
                    btn.classList.remove("active");
                });
                document.getElementById(tabId).classList.add("active");
                document.querySelector(`button[id="${tabId.replace("Content", "Btn")}"]`).classList.add("active");
            }

            document.querySelector(".tabs").addEventListener("click", function (e) {
                if (e.target.tagName === "BUTTON") {
                    switchTab(e.target.id.replace("Btn", "Content"));
                }
            });
            document.getElementById("depositForm").addEventListener("submit", function (e) {
                e.preventDefault();
                const crypto = document.getElementById("cryptoSelect").value;
                const amount = document.getElementById("amount").value;
                const address = document.getElementById("walletAddress").value;
                this.reset();
                switchTab("historyContent");
            });
            window.onload = () => {
                populateWallets();
                populateTransactions();
            };

        </script>

    </body>
</html>

