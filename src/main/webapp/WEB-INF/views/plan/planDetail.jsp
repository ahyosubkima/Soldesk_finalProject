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

<div id="p_writeTitle"><h1>여행 플래너 상세</h1></div>

<!-- 일정 기본정보 등록 -->
	<table border="1" id="p_write">

		<tr>
			<td rowspan="3">플래너 표지 사진 업로드 <p> </td>
			<td colspan="2">제목:  </td>
		</tr>
		
		<tr>
			<td>출발:  </td>
			<td>인원:  </td>
		</tr>

		<tr>
			<td>장소:  </td>
		</tr>

		<tr>
			<td colspan="3">간단 경로:<div id="">경로보여주는 곳</div> </td>
		</tr>

		<tr>
			<td colspan="3">
					상세보여주기			
			</td>
		</tr>
	</table>



 
	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteTitle"><span>📅일정 작성</span></div>
	<div id="p_openDayWrite">
	



	</div>
	
	
	
	
	
	
	
	
<!-- 예산결과 보여주는 곳 -->
	<div id="p_BudgetAll">
	<span id="p_openBudget" onclick="p_openBudget()">💲예산결과 ▼</span>
	<table border="1" id="p_writeBudget">
			
		<tr>
			<td id="p_writeBudgetWrite"></td>
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
	


</body>
</html>