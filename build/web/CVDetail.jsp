<%-- 
    Document   : CVDetail
    Created on : May 21, 2024, 2:33:59 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết CV của Mentor</title>
<style>
  /* Thêm một số kiểu cơ bản (tùy chọn) */
  .mentor-avatar {
    width: 300px;
    height: 300px;
    object-fit: cover; /* Điều chỉnh kích thước hình ảnh để vừa khít */
  }
</style>
</head>
<body>

<h1>Chi tiết CV của Mentor</h1>

<c:set var="mentor" value="${requestScope.mentor}" />

<div>
  <img src="${mentor.avatar}" class="mentor-avatar" alt="Ảnh đại diện Mentor">
  <h2>${mentor.fullName}</h2>
 
  <p>Email: ${mentor.gmail}</p>
  <p>Địa chỉ: ${mentor.address}</p>
  <p>Số điện thoại: ${mentor.phone}</p>
  <p>Ngày sinh: ${mentor.dob}</p>
  <p>Nghề nghiệp: ${mentor.profession}</p>
  <p>Giới thiệu về nghề nghiệp: ${mentor.professionIntro}</p>
  <p>Mô tả về thành tựu: ${mentor.achievementDescription}</p>
  <p>Mô tả về dịch vụ: ${mentor.service_description}</p>
</div>

<h2>Kỹ năng</h2>
<c:forEach items="${mentor.listSkills}" var="skill">
  <p>${skill}</p>
</c:forEach>

<h2>Phản hồi</h2>
<c:forEach items="${mentor.feedBacks}" var="feedback">
  <div>
    <p>Người gửi: ${feedback.menteeName}</p>
    <p>Nội dung: ${feedback.comment}</p>
    <p>Đánh giá: ${feedback.star}</p>
    <p>Thời gian: ${feedback.timeFeedBack}</p>
    <p>--------------------------------------</p>
  </div>
</c:forEach>

</body>
</html>
