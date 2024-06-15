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
    
    <link rel="stylesheet" href="assetss/css/app.min.css">
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <link rel="stylesheet" href="assetss/css/custom.css">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            
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
  display: flex;
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
      <div class="loader"></div>
        <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <div class="navbar-bg"></div>
                <nav class="navbar navbar-expand-lg main-navbar sticky">
                    <div class="form-inline mr-auto">
                        <ul class="navbar-nav mr-3">
                            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
                                   collapse-btn"> <i data-feather="align-justify"></i></a></li>
                            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                                    <i data-feather="maximize"></i>
                                </a></li>
                            <li>
                                <form class="form-inline mr-auto">
                                    <div class="search-element">
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                                        <button class="btn" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <ul class="navbar-nav navbar-right">

                        <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                                                                     class="nav-link notification-toggle nav-link-lg"><i data-feather="bell" class="bell"></i>
                            </a>
                            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
                                <div class="dropdown-header">
                                    Notifications
                                    <div class="float-right">
                                        <a href="#">Mark All As Read</a>
                                    </div>
                                </div>
                                <div class="dropdown-footer text-center">
                                    <a href="#">View All <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown"><a href="#" data-toggle="dropdown"
                                                class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="assetss/img/user.png"
                                                                                             class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
                            <div class="dropdown-menu dropdown-menu-right pullDown">
                                <div class="dropdown-title">Hello Sarah Smith</div>
                                <div class="dropdown-divider"></div>
                                <a href="auth-login.html" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <div class="main-sidebar sidebar-style-2">
                    <aside id="sidebar-wrapper">

                        <ul class="sidebar-menu">
                            <li class="menu-header">Main</li>
                            <li class="dropdown active">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i
                                        data-feather="monitor"></i><span>Dashboard</span></a>
                                <ul class="dropdown-menu">
                                    <li class="active"><a class="nav-link" href="Homes_manager.jsp">Dashboard 1</a></li>
                                </ul>
                            </li>
                            <li class="menu-header">Request</li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>CV Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="listCV">List CV</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Schedule Management</span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>
                                </ul>
                            </li>

                        </ul>
                    </aside>
                </div>
                <div class="main-content">
                    <section class="section">
                        <ul class="breadcrumb breadcrumb-style ">
                            <li class="breadcrumb-item">
                                <h4 class="page-title m-b-0">Homes</h4>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="Homes_manager.jsp">
                                    <i class="fas fa-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">Schedule</li>
                         
                        </ul>
                        <div class="section-body">
                            <div class="row clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>List Schedule Mentor</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
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
              <h1>7 160.27 <span>USD</span></h1>
            </div>
            <p class="wallet-stats">
              50 wallets | 30 hidden | 0 watch only | 0 ledger
            </p>
            <div class="wallet-list"></div>
          </section>
          <section class="transaction-history">
            <div class="tabs">
              <button class="active" id="historyBtn">History</button>
              <button id="depositBtn">Deposit</button>
            </div>
            <div id="historyContent" class="tab-content active">
              <div class="filters">
                <select id="wallet-filter">
                  <option>Wallet: All</option>
                </select>
                <select id="type-filter">
                  <option>Type: All</option>
                </select>
                <input type="text" placeholder="Search by hash, address" />
                
              </div>
              <table class="transactions"></table>
            </div>
            <div id="depositContent" class="tab-content">
              <div class="deposit-form">
                <h2>Deposit Funds</h2>
                <form id="depositForm">
                  <div class="form-group">
                    <label for="amount">Amount</label>
                    <input
                      type="number"
                      id="amount"
                      placeholder="Enter amount"
                      required
                    />
                  </div>
                  <div class="form-group">
                    <label for="walletAddress">Wallet Address</label>
                    <input
                      type="text"
                      id="walletAddress"
                      placeholder="Enter wallet address"
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
                                                </div>
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
                document
                  .querySelector(`button[id="${tabId.replace("Content", "Btn")}"]`)
                  .classList.add("active");
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
            
  </body>
</html>

