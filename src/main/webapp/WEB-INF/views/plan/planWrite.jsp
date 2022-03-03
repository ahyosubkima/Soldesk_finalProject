<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="resources/plan/p_js/jQuery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10c7423289ef4af1c8687b735db21075&libraries=services"></script>

<script type="text/javascript" src="resources/plan/p_js/plan_map.js"></script>
<script type="text/javascript" src="resources/plan/p_js/plan.js"></script>

<link rel="stylesheet" href="resources/plan/p_css/plan.css">
</head>
<body>

<div id="p_writeTitle"><h1>여행 플래너 제작하기</h1></div>

<!-- 일정 기본정보 등록 -->
<form action="plan.detailPlanner" name="planWrite" method="post" enctype="multipart/form-data">
	<table border="1" id="p_write">
	            <!-- 아이디정보 가져가기 -->
		<tr><td><input type="hidden" name="p_writer" value="login값넣기"></td></tr>

		<tr>
			<td rowspan="3">플래너 표지 사진 업로드 <p><input type="file" name="p_TitleFile"></td>
			<td colspan="2">제목: <input name="p_title"></td>
		</tr>
		
		<tr>
			<td>출발: <input type="date" name="p_startDate"></td>
			<td>인원: <input type="number" name="p_person"></td>
		</tr>

		<tr>
			<td>장소: <input name="p_place"></td>
		</tr>

		<tr>
			<td colspan="3">간단 경로:<div id="p_route">경로보여주는 곳</div> </td>
		</tr>

		<tr>
			<td colspan="3">
				<input placeholder="입력해주세요" id="p_search"><input type="button" id="p_searchBtn" value="검색">
			<div id="map" style="width:800px;height:400px;"></div>
			
			
			
			</td>
		</tr>
	</table>



 
	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteTitle"><span>📅일정 작성</span></div>
	<div id="p_openDayWrite">
	
	<c:forEach var="p" begin="1" end="${param.p_days}">
		<div id="p_DayWriteAll">
		<div>${p }일차</div>
		<div id="p_dayWriteDiv">
		<input id="p_dayWrite"  type="button" value="일정추가">
		<input id="p_dayHidden" class="egeg" type="hidden" value="${p }">
		</div>
		</div>
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
			<td id="p_writeFreeWrite"><input name="p_freeWrite"></td>
		</tr>
	</table>
	</div>
	
	<div id="p_regOk"><input type="submit" value="플래너 등록"></div> 
	
</form> 




</body>
</html>