<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/plan/p_css/plan.css">
</head>
<body>

	<!-- 플래너 작성 페이지로 넘어가는 버튼 -->
	<form action="plan.writePlanner">
		<table border="1" id="p_mainWrite">
			<tr>
				<td>여행일정<input type="number" name="p_days"> 일 </td>
			</tr>
			<tr>
				<td colspan="2">
					<button>나만의 플래너 제작</button>
					 <!-- input hidden으로 아이디정보 가져가기 -->
					 <input type="hidden" value="">
				</td>
			</tr>
		</table>
	</form>


	<!-- 등록된 플래너 전체를 볼 수 있는 곳 -->
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