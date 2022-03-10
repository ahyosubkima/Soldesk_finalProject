<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.profile_image {
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.loginMember.dm_photo != null}">
		<img class="profile_image" src="${sessionScope.loginMember.dm_photo}">
	</c:when>
	<c:otherwise>
		<img class="profile_image" src="resources/asset/member/img_member/basic_profile.png">
	</c:otherwise>
</c:choose>

 <form action="member.delete" onclick="deleteCheck()">
	<input type="text" placeholder="아이디" name="dm_id" value="${sessionScope.loginMember.dm_id}"> 
	<input type="text" placeholder="비밀번호" name="dm_pw" value="${sessionScope.loginMember.dm_pw}">
	<button>회원 탈퇴</button>
</form>
</body>
</html>