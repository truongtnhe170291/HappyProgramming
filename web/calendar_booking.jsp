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

            h2 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }

            table {
                width: 80%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                margin: 20px auto;
            }

            th,
            td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
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
        </style>
    </head>

    <body>

        <h2>Booking Calendar</h2>
        <form action="CalendarBookingServlet" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Slot</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${slot}" var="s">
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
            <button type="submit">Submit</button>
        </form>
    </body>

</html>
