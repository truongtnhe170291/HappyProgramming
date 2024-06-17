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

.deposit-btn:hover {
  background-color: #45a049;
}

        </style>
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
                <h1>Available: ${requestScope.wallet.avaiable_balance}<span>VND</span></h1>
            </div>
            <div class="total-balance">
                <h1>Binance: ${requestScope.wallet.real_balance}<span>VND</span></h1>
            </div>
<!--            <div class="wallet-list"></div>-->
          </section>
          <section class="transaction-history">
            <div class="tabs">
              <button class="active" id="historyBtn">History</button>
              <button id="depositBtn">Deposit</button>
            </div>
            <div id="historyContent" class="tab-content active">
                <table class="transactions">
                    <c:forEach items="${requestScope.list}" var="tran">
                    <tr>
                        <td>${tran.create_date}</td>
                        <td>${tran.message}</td>
                        <td>${tran.user_send == sessionScope.user.userName?"-":"+"}${tran.amount}</td>
                    </tr>
                    </c:forEach>
                </table>
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
                <script>
                    const wallets = [
                { name: "SHIBA INU", amount: 39900, value: 0.24, icon: "shiba.png" },
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

