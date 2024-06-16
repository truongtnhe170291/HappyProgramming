<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Calendar</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }

            .container {
                max-width: 80%;
                margin: 0 auto;
                padding: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }

            th,
            td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: center;
            }

            td {
                position: relative;
            }

            td span {
                display: block;
                font-size: 14px;
                color: #666;
                margin-bottom: 5px;
            }

            td hr {
                border: none;
                border-top: 1px solid #ddd;
                margin: 5px 0;
            }

            td input[type="checkbox"] {
                transform: scale(1.2);
            }

            button {
                display: block;
                width: 150px;
                margin: 20px auto;
                padding: 10px;
                border: none;
                background-color: #4caf50;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                border-radius: 5px;
            }

            button:hover {
                background-color: #45a049;
            }

            .note {
                margin-top: 20px;
                background-color: #fdf4f4;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .note h4 {
                color: #c0392b;
                margin-top: 0;
            }

            .note ul {
                list-style-type: disc;
                padding-left: 20px;
            }

            .note li {
                margin-bottom: 5px;
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
                <div class="container">
                    <h1>Booking Calendar</h1>

                    <form action="CalendarBookingServlet" method="post">
                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2" style="text-align: center">
                                        WEEK
                                        <select name="week">
                                            <c:forEach items="${listCycleWeek}" var="week">
                                                <option value="${week.cycle}">${week.cycleWeek}</option>
                                            </c:forEach>
                                        </select>
                                        <br />
                                        <br />
                                        SLOT
                                    </th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                    <th>Saturday</th>
                                    <th>Sunday</th>
                                </tr>
                                <tr>
                                    <c:forEach items="${listDays}" var="day">
                                        <c:if test="${day.cycle eq 24}">
                                            <th>${day.dateValue}</th>
                                            </c:if>
                                        </c:forEach>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listSlots}" var="s">
                                    <tr>
                                        <td>
                                            <span>${s.slot_id}</span>
                                            <hr>
                                            <span>${s.slot_name}</span>
                                        </td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + mo"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + tu"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + we"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + th"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + fr"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + sa"></td>
                                        <td><input type="checkbox" name="booking" value="${s.slot_id} + su"></td>
                                    </tr>
                                </c:forEach>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                        <div class="note">
                            <div class="row">
                                <div class="col md-6">
                                    <h4>Note:</h4>
                                    <ul>
                                        <li>Your selection of week will select for hole month</li>
                                        <li>You cannot booking a schedule on <strong>Saturday</strong> and <strong>Sunday</strong></li>
                                        <li>You can <strong>Update</strong> your schedule when status is <strong>Pending</strong></li>
                                    </ul>
                                </div>
                                <div class="col md-6" style="text-align: end">
                                    <h4>Your Schedule Status</h4><br/>
                                    <c:if test="${status != null}">
                                        <h3>${status}</h3>
                                    </c:if>
                                    <c:if test="${status eq ''}">
                                        <h3 style="color: #4caf50">Select</h3>
                                    </c:if>
                                </div>
                            </div>


                        </div>
                        <div style="display: flex; justify-content: end">
                            <button style="margin: 10px 5px" type="submit">Submit</button>
                            <button style="margin: 10px 5px" type="submit">Save</button>
                        </div>

                    </form>
                </div>
            </div>
        </main>
    </body>

</html>
