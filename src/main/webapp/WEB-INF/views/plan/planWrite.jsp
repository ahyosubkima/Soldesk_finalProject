<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/plan/p_js/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=690dce1d74d365eaed8c4188052a77a1&libraries=services"></script>
<script type="text/javascript" src="resources/plan/p_js/plan_map.js"></script>
<script type="text/javascript" src="resources/plan/p_js/plan.js"></script>


<link rel="stylesheet" href="resources/plan/p_css/plan_map.css">
<link rel="stylesheet" href="resources/plan/p_css/plan.css">
</head>
<body>

<div id="p_writeTitle"><h1>여행 플래너 제작하기</h1></div>

<!-- 일정 기본정보 등록 -->
	<table border="1" id="p_write">

		<tr>
			<td rowspan="3">플래너 표지 사진 업로드 <p><input type="file"></td>
			<td colspan="2">제목: <input></td>
		</tr>
		
		<tr>
			<td>출발: <input type="date"></td>
			<td>일정: <input type="number" min="1">박
					<input type="number" min="1" id="p_lastDay">일
			</td>
		</tr>

		<tr>
			<td>장소: <input></td>
			<td>인원: <input type="number"></td>
		</tr>

		<tr>
			<td colspan="3">간단 경로: </td>
		</tr>

		<tr>
			<td colspan="3">
			지도?
			</td>
		</tr>
	</table>



 
	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteAll"><span>📅일정 작성</span></div>
	<div id="p_openDayWrite">
	
	<c:forEach var="p" begin="1" end="${param.p_days}">
		<div>${p }일차</div>
		<div id="p_dayWriteDiv"><input id="p_dayWrite" type="button" value="일정추가하기"></div>
		<table border="1" id="eeeg">
		<tr>
			<td colspan="2">지도</td>
			<td rowspan="3">➔</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>메뉴</td>
		</tr>
		</table>
	</c:forEach>


	</div>
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 예산결과 보여주는 곳 -->
	<div id="p_BudgetAll">
	<span id="p_openBudget" onclick="p_openBudget()">💲예산결과 ▼</span>
	<table border="1" id="p_writeBudget">
			
		<tr>
			<td id="p_writeBudgetWrite">OO님,<p>여행에 필요한 최소 비용은 00,000원으로 0명이 여행할 경우 1인당 0,000원입니다.</td>
		</tr>
	</table>
	</div>


	
<!-- 자유 한마디 -->
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFree">
		
		<tr>
			<td id="p_writeFreeWrite">작성하는 곳 input or textarea (100글자 제한두기)</td>
		</tr>
	</table>
	</div>
	
		<div id="p_writeBtn"><button>플래너 등록</button></div>
	





</body>
</html>