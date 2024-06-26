<%-- 
    Document   : AdminDashbroad
    Created on : Jun 24, 2024, 11:42:21 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
    <style>
      body {
        background-color: #f9f9f9;
        color: #333;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      .dashboard {
        padding: 20px;
      }

      h1 {
        text-align: center;
        color: #333;
      }

      .accounts-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .accounts-table th,
      .accounts-table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }

      .accounts-table th {
        background-color: #f1f1f1;
      }

      .disable-btn {
        background-color: #ff4c4c;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
      }

      .disable-btn:hover {
        background-color: #ff1c1c;
      }

      .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
      }

      .popup-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        width: 400px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      .close-btn {
        float: right;
        font-size: 24px;
        cursor: pointer;
        color: #333;
      }

      textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ddd;
        margin-top: 10px;
        background-color: #fff;
        color: #333;
      }

      .submit-btn {
        background-color: #4caf50;
        color: #fff;
        border: none;
        padding: 10px 20px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 5px;
      }

      .submit-btn:hover {
        background-color: #45a049;
      }
    </style>
  </head>
  
  
  <body>
    <div class="dashboard">
      <h1>Admin Dashboard</h1>
     <table class="accounts-table">
    <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="account" items="${accounts}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${account.fullName}</td>
                <td>${account.statusId == 1 ? 'Enabled' : 'Disabled'}</td>
                <td>
                    <form action="accountstatus" method="post" style="display:inline;">
                        <input type="hidden" name="userName" value="${account.userName}">
                        <input type="hidden" name="newStatus" value="${account.statusId == 1 ? 2 : 1}">
                        <button type="submit">
                            ${account.statusId == 1 ? 'Disable' : 'Enable'}
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    </div>

    <div id="popup" class="popup">
      <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <h2>Disable Account</h2>
        <textarea id="reason" rows="4"></textarea>
        <button class="submit-btn" onclick="disableAccount()">Submit</button>
      </div>
    </div>

    <script>
      function showPopup(menteeId) {
        document.getElementById("popup").style.display = "flex";
        document.getElementById("popup").dataset.menteeId = menteeId;
      }

      function closePopup() {
        document.getElementById("popup").style.display = "none";
        document.getElementById("reason").value = "";
      }

      function disableAccount() {
        const menteeId = document.getElementById("popup").dataset.menteeId;
        const reason = document.getElementById("reason").value;

        if (reason.trim() === "") {
          alert("Please provide a reason for disabling the account.");
          return;
        }

        console.log(`Disabling account `+menteeId `for reason: `+reason);

        closePopup();
      }
    </script>
  </body>
</html>

