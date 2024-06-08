<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="INSPIRO" />
    <link rel="icon" type="image/png" href="images/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document title -->
    <title>Fmaster</title>
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
    <link href='plugins/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href="css/plugins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <style>
            .calendar {
                max-width: 600px;
                margin: 0 auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .header h2 {
                margin: 0;
            }

            .header button {
                background-color: #4CAF50;
                color: #fff;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 10px;
            }

            .day {
                background-color: #f9f9f9;
                border-radius: 4px;
                padding: 10px;
                margin-bottom: 10px;
            }

            .day-header {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .event {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .event-dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                margin-right: 10px;
            }


            .wrapper {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
                background-color: #f2f2f2;

                .mentor-image {
                    transform: translateX(150%);
                    border-radius: 50%;
                    width: 200px;
                    height: 200px;
                    background-size: contain;
                    margin-bottom: 20px;
                }

                .content-box {
                    margin-top: 20px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    background-color: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                    max-width: 800px;
                    width: 100%;
                }

                .btn-light.active {

                    background-color: #2250fc;
                    color: #ccc;
                }
                .btn-light{
                    line-height: 50px;
                    margin-left: 60px;
                }
                input[type="checkbox"] {
                    /*                    display: none;*/
                }
                .status {
                    line-height: 50px;
                    margin-left: 60px;
                    font-size: 16px;
                    margin-top: 10px;
                    color: #333;
                    font-weight: bold;
                }

                .btn-light.active {
                    background-color: #2250fc;
                    color: #ccc;
                }

                input[type="checkbox"] {
                    /*                    display: none;*/
                }
                #calendar{
                    width: 150%;
                    height: auto;

                }
                .content, .col-lg-8, .col-lg-4{
                    width:100%;
                }
                .event {
                    display: flex;
                    align-items: center;
                }

                .event-dot {
                    margin-right: 10px;
                }

                .event-content {
                    display: flex;
                    flex-grow: 1;
                    justify-content: space-between;
                    align-items: center;
                }

                .rights {
                    margin-left: auto;
                }
                .event{
                    display: flex;
                    justify-content: space-between;

                }

            </style>
    <link href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.css" rel="stylesheet">

</head>

<body>

    <jsp:include page="header.jsp" />
    <section id="page-title">
        <div class="container">
            <div class="page-title">
                <h1>Mentee Request</h1>
            </div>
            <div class="breadcrumb">
                <ul>
                    <li><a href="homes.jsp">Home</a> </li>
                    <li class="active"><a href="Mentee_Request.jsp">Mentee Request</a> </li>
                </ul>
            </div>
        </div>
    </section>
    <div class="wrapper">
        <c:set value="${requestScope.cv}" var="cv" />
        <div class="content-box">
            <div class="">
                <img src="./img/${cv.imgcv}" alt="Mentor Image" class="mentor-image">
                <h5>${cv.fullName}</h5>
                <section id="page-content">
                    <div class="container">
                        <div class="row">
                            <!-- content -->
                            <div class="content col-lg-9">
                                <!-- form -->
                                <c:set value="${requestScope.listSchedule}" var="listSchedule" />
                                <form action="request" method="post">
                                    <input type="hidden" name="mentorname" value="${cv.userName}" />
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input name="title" type="text" id="notify_title" value="" class="form-control notification-message" required="">
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control notification-message" placeholder="Type your message here..." required="" rows="5"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Deadline Date</label>
                                                <input name="deadlineDate" id="notify_messages" type="date" class="form-control notification-message" placeholder="" required="" rows="5" />
                                            </div>
                                            <div class="form-group">
                                                <label>Deadline Hour</label>
                                                <input name="deadlineHour" type="time" class="form-control notification-message" placeholder="" required="" rows="5" />
                                            </div>
                                            <div class="form-group">
                                                <label>Price/Slot: </label>
                                                <label class="form-control notification-message" rows="5">
                                                    ${rate}
                                                </label>
                                            </div>
                                        </div>
                                        <section id="page-content" class="no-sidebar">
                                            <div class="container">
                                                <!-- Calendar -->
                                                <div class="row mb-5">
                                                    <div class="col-lg-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="calendar">
                                                            <div class="header">
                                                                <h2>${listSchedule.get(0).startTime} - ${listSchedule.get(0).endTime}</h2>
                                                            </div>

                                                            <c:forEach items="${listSchedule}" var="schedule">
                                                                <div class="day">
                                                                    <div class="day-header">${schedule.nameOfDay} - ${schedule.dayOfSlot}</div>
                                                                    <div class="event">

                                                                        <div>${schedule.slotId}: ${schedule.slot_name}</div>
                                                                        <input type="checkbox" name="schedule" value="${schedule.selectedId}" autocomplete="off">
                                                                    </div>
                                                                </div>
                                                            </c:forEach>

                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end: Calendar -->
                                                <div class="header mt-2 text-end" style="display: flex; justify-content: flex-end;">
                                                    <h4 id="totalPrice">Total Price: </h4>
                                                </div>
                                                <input type="hidden" id="totalPriceInput" name="totalPrice" value="" />
                                            </div>
                                        </section>
                                        <div class="col-lg-4">

                                            <div class="form-group mb-25 status-radio ">
                                                <label for="hiringDateCheckbox">Skill</label>
                                                <div class="d-flex">
                                                    <c:forEach items="${requestScope.skills}" var="skill">
                                                        <div class="form-check text-center m-3">
                                                            <label class="form-check-label" for="hiringDateCheckbox">${skill.skillName}</label>

                                                            <input type="radio" name="skill" value="${skill.skillID}" autocomplete="off" style="transform: translate(80px, -28px);">
                                                        </div>

                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col-lg-9">
                                            <button type="submit" id="notify_btn" class="btn btn-primary">
                                                Send Request</button>
                                            <button type="reset" class="btn btn-primary">
                                                Reset
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
    <!--Plugins-->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/functions.js"></script>
    <script src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src='plugins/moment/moment.min.js'></script>
    <script src='plugins/fullcalendar/fullcalendar.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', (et) => {
    et.preventDefault();

    const deadlineInput = document.getElementById('notify_messages');
    const notifyBtn = document.getElementById("notify_btn");
    const skillRadios = document.querySelectorAll('input[name="skill"]');
    const scheduleCheckboxes = document.querySelectorAll('input[type="checkbox"][name="schedule"]');
    const totalPriceInput = document.getElementById("totalPriceInput");
    const totalPrice = document.getElementById("totalPrice");
    const rate = ${rate}; // Predefined rate from JSP

    // Function to get the next Sunday of the week
    function getSundayOfWeek() {
        const currentDate = new Date();
        const dayOfWeek = currentDate.getDay();
        const daysUntilSunday = (7 - dayOfWeek) % 7;
        const sundayDate = new Date(currentDate);
        sundayDate.setDate(currentDate.getDate() + daysUntilSunday);
        return sundayDate.toISOString().split('T')[0];
    }

    // Function to get the current date in YYYY-MM-DD format
    function getFormattedCurrentDate() {
        const currentDate = new Date();
        return currentDate.toISOString().split('T')[0];
    }

    // Function to show toast message
    function showToastMessage(message) {
        Toastify({
            text: message,
            duration: 5000,
            gravity: "top",
            position: "right",
            backgroundColor: "#ff7b5a",
        }).showToast();
    }

    // Function to count checked schedule checkboxes
    function countCheckedSchedules() {
        return [...scheduleCheckboxes].filter(checkbox => checkbox.checked).length;
    }

    // Function to count selected skills
    function countSelectedSkills() {
        return [...skillRadios].filter(radio => radio.checked).length;
    }

    // Function to update total price based on checked schedule checkboxes
    function updateTotalPrice() {
        const checkedCount = countCheckedSchedules();
        const total = checkedCount * rate;
        totalPriceInput.value = total;
        totalPrice.innerHTML = `Total Price: ${total}`;
    }

    // Function to validate form inputs
    function validateForm() {
        const deadlineDate = deadlineInput.value;
        const currentDate = getFormattedCurrentDate();
        const sundayOfWeek = getSundayOfWeek();
        const checkedSchedules = countCheckedSchedules();
        const selectedSkills = countSelectedSkills();

        if (deadlineDate < currentDate || deadlineDate > sundayOfWeek) {
            notifyBtn.disabled = true;
            showToastMessage("Please select a valid deadline date.");
            return false;
        } else if (checkedSchedules === 0) {
            notifyBtn.disabled = true;
            showToastMessage("Please select at least one slot.");
            return false;
        } else if (selectedSkills === 0) {
            notifyBtn.disabled = true;
            showToastMessage("Please select at least one skill.");
            return false;
        } else {
            notifyBtn.disabled = false;
            return true;
        }
    }

    // Event listener for deadline input change
    deadlineInput.addEventListener('change', validateForm);

    // Event listeners for skill radio buttons change
    skillRadios.forEach(radio => {
        radio.addEventListener('change', validateForm);
    });

    // Event listeners for schedule checkboxes change
    scheduleCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            updateTotalPrice();
            validateForm();
        });
    });

    // Initial validation and price update on page load
    validateForm();
    updateTotalPrice();
});

    </script>
</body>

</html>
