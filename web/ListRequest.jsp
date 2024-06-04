<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Requests</title>
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
                border-collapse: collapse;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }



            tr:hover {
                background-color: #f5f5f5;
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
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="contents">
            <h1>List of Requests</h1>
            <div class="userDatatable userDatatable--ticket mt-1">
                <div class="table-responsive">
                    <table class="table mb-0 table-borderless">

                        <thead>
                            <tr class="userDatatable-header">
                                <th>
                                    <span class="userDatatable-title">Title</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Mentor Name</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Deadline Date</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Deadline Hour</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Skills</span>
                                </th>
                                <th>
                                    <span class="userDatatable-title">Description</span>
                                </th>
                                <th class="actions">
                                    <span class="userDatatable-title">Actions</span>
                                </th>
                            </tr>
                        </thead>

                        <c:forEach var="request" items="${requests}">
                            <tr>
                                <td>${request.title}</td>
                                <td>${request.mentorName}</td>
                                <td>${request.deadlineDate}</td>
                                <td>${request.deadlineHour}</td>
                                <td>
                                    <ul>
                                        <c:forEach var="skill" items="${request.listSkills}">
                                            <li>${skill.skillName}</li>
                                            </c:forEach>
                                    </ul>
                                </td>
                                <td>${request.description}</td>
                                <td class="d-flex" style="margin-top:12px;"> <!-- Thêm các nút hành động vào cột mới -->
                                    <form method="POST" action="ListRequest">
                                        <input type="hidden" name="requestId" value="${request.requestId}" />
                                        <div class="action-btn">      
                                            <a href="#" class="btn btn-primary align-center centaxs" data-bs-toggle="modal" data-bs-target="#ticket_modal" style="background-color: #fff; border: none;">

                                                <i class="uil uil-eye  align-center" style="color: blue;"></i> </a> 
                                            <div class="modal fade ticket_modal" id="ticket_modal" role="dialog" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content  radius-xl">
                                                        <div class="modal-body pb-sm-50 pb-30">
                                                            <div class="modal-header">
                                                                <h1>
                                                                    Detail
                                                                </h1>
                                                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <img src="img/svg/x.svg" alt="x" class="svg">
                                                                </button>
                                                            </div>
                                                            <div class="ticket_modal-modal">
                                                                <form>
                                                                    <div>CV Id: ${requestScope.cv.cvId}</div><br>
                                                                    <div>Avatar: ${requestScope.cv.imgcv}</div><br>
                                                                    <div>Mentor Name: ${requestScope.cv.userName}</div><br>
                                                                    <div>Email: ${requestScope.cv.gmail}</div><br>
                                                                    <div>Full name: ${requestScope.cv.fullName}</div><br>
                                                                    <div>DoB: ${requestScope.cv.dob.toString()}</div><br>
                                                                    <div>Gender: ${requestScope.cv.sex}</div><br>
                                                                    <div>Address: ${requestScope.cv.address}</div><br>
                                                                    <div>Profession: ${requestScope.cv.profession}</div><br>
                                                                    <div>Profession Introduction: ${requestScope.cv.professionIntro}</div><br>
                                                                    <div>Achievement Description: ${requestScope.cv.achievementDescription}</div><br>
                                                                    <div>Service Description: ${requestScope.cv.serviceDescription}</div><br>
                                                                    <div>Skills: 
                                                                        <c:forEach items="${requestScope.skills}" var="s">
                                                                            <p>${s.skillName}</p>
                                                                        </c:forEach>
                                                                    </div><br>
                                                                    <div>Status: ${requestScope.cv.stattusId}</div><br>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                    <button style="margin-bottom: 6px; border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" onclick="editRequest(${request.requestId})"><li>
                                            <a href="#" class="edit">
                                                <i class="uil uil-check"></i>
                                            </a>
                                        </li></button>

                                    <form method="POST" action="EditOrDeleteRequest" onsubmit="return confirm('Are you sure you want to delete this request?');">
                                        <input type="hidden" name="requestId" value="${request.requestId}" />
                                        <button style="border-radius: 0.42rem 0.42rem 0.42rem 0.42rem;" type="submit"> <li>
                                                <a href="#" class="remove">
                                                    <i class="uil uil-times"></i>
                                                </a>
                                            </li></button>
                                    </form>


                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </body>

</html>
