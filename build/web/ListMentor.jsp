<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách các Mentor</title>
<style>
  /* Thêm một số kiểu cơ bản (tùy chọn) */
  table {
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .mentor-avatar {
    width: 50px;
    height: 50px;
    object-fit: cover; /* Điều chỉnh kích thước hình ảnh để vừa khít */
  }
</style>
</head>
<body>

<h1>Danh sách các Mentor</h1>

<c:set var="mentors" value="${requestScope.mentors}" />

<table>
  <tr>
    <th>Ảnh đại diện</th>
    <th>Họ và tên</th>
    <th>Tên Mentor</th>
    <th>Đánh giá trung bình</th>
    <th>Chi tiết</th> <!-- Thêm cột mới -->
  </tr>
  
  <c:forEach items="${mentors}" var="mentor">
    <tr>
      <td><img src="${mentor.avatar}" class="mentor-avatar" alt="Ảnh đại diện Mentor"></td>
      <td>${mentor.full_name}</td>
      <td>${mentor.mentorName}</td>
      <td>${mentor.getStar()}</td>
      <h2>Kỹ năng</h2>
<c:forEach items="${mentor.listSkills}" var="skill">
  <p>${skill}</p>
</c:forEach>

      <>
      <td> <!-- Thêm nút "View Details" -->
        <form action="MentorProfileServlet" method="post">
          <input type="hidden" name="mentorName" value="${mentor.mentorName}" />
          <input type="submit" value="Xem chi tiết" />
        </form>
      </td>
    </tr>
  </c:forEach>
</table>

</body>
</html>
