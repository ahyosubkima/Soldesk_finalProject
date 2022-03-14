<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/plan.js" ></script>
<link rel="stylesheet" href="resources/plan/p_css/plan.css">
</head>
<body>
<!-- 플래너 작성 버튼 -->
<c:choose>
<c:when test="${sessionScope.loginMember != null}">
	<form action="plan.writePlanner">
		<table border="1" id="p_mainWrite">
			<tr>
				<td>여행일정<input type="number" name="p_days"> 일 </td>
			</tr>
			<tr>
				<td colspan="2">
					<button>나만의 플래너 제작</button>
					 <!-- input hidden으로 아이디정보 가져가기 -->
					 <input type="hidden" name="p_writer" value="${sessionScope.loginMember.dm_id }">
					 <input type="hidden" name="p_nickname" value="${sessionScope.loginMember.dm_nickname }">
				</td>
			</tr>
		</table>
	</form>
</c:when>
<c:when test="${sessionScope.loginMember == null}">

	<table>
		<tr>
			<td>로그인 먼저 할까요?</td>
		</tr>
	</table>

</c:when>
</c:choose>

<!-- 등록된 플래너 전체 조회-->
	<table id="p_mainDetail">
		<tr>
			<td><a><img id="p_mainPic" src="resources/plan/p_img/test.PNG"></a></td>
			<td><img id="p_mainPic" src="resources/plan/p_img/test.PNG"></td>
			<td><img id="p_mainPic" src="resources/plan/p_img/test.PNG"></td>
			<td><img id="p_mainPic" src="resources/plan/p_img/test.PNG"></td>
		</tr>

		<tr>
			<td align="center">플래너 타이틀1</td>
			<td align="center">플래너 타이틀2</td>
			<td align="center">플래너 타이틀3</td>
			<td align="center">플래너 타이틀4</td>
		</tr>
	</table>


</body>
</html>