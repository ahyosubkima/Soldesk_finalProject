<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/asset/index/css/home.css" />
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<style>

.my_profile {
	display: flex;
	justify-content: center;
	margin-top: 100px;
	height: 100vh;
}

.profile_image {
	width: 200px;
	height: 150px;
	object-fit: cover;
	align-items: center;
	top: 35%;
}

.my_info {
	height: 300px;
	margin-left: 50px;
	display: flex;
	flex-direction: column;
}
</style>

</head>
<body>
	<section class="my_profile">
		<div class="my_imgBx">
			<c:choose>
				<c:when test="${sessionScope.loginMember.dm_photo != null}">
					<img class="profile_image"
						src="${sessionScope.loginMember.dm_photo}">
				</c:when>
				<c:otherwise>
					<img class="profile_image"
						src="resources/asset/member/img_member_basic/basic_profile.png">
				</c:otherwise>
			</c:choose>
		</div>
		<form action="member.updateInfo" name="member_form" method="post" >
		<div class="my_info">
			<label for="dm_id">아이디</label> 
			<input type="text" name="dm_id" value="${sessionScope.loginMember.dm_id}" readonly>
			<label for="dm_pw">비밀번호</label>
			<input type="password" name="dm_pw" value="${sessionScope.loginMember.dm_pw}"> 
			<label for="dm_nickname">닉네임</label> 
			<input type="text" name="dm_nickname" value="${sessionScope.loginMember.dm_nickname}" >
			<label for="dm_email">이메일</label> <input type="text" name="dm_email" value="${sessionScope.loginMember.dm_email}" readonly>
			<input type="hidden" name="dm_isAdmin" value="N">
			<button>수정 확인</button>
		</div>
		</form>
	</section>
	
	
</body>
</html>