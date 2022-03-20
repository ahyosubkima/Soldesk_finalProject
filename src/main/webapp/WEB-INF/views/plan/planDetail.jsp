<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<h1>${result}</h1>
<div id="p_writeTitle"><h1>여행 플래너 상세</h1></div>
<!-- 일정 기본정보 등록 -->
	<table border="1" id="p_write">

		<tr>
			<td rowspan="3">플래너 표지 사진 업로드 <p> </td>
			<td colspan="2">제목:여기 ${plan.p_title } </td>
		</tr>
		
		<tr>
			<td>출발:  </td>
			<td>인원:  </td>
		</tr>

		<tr>
			<td>장소:  </td>
		</tr>

		<tr>
			<td colspan="3">간단 경로:<div id="">경로보여주는 곳${result}</div> </td>
		</tr>

		<tr>
			<td colspan="3">
					상세: 
			</td>
		</tr>
	</table>




	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteTitle"><span>💰 필요 예산</span></div>
	
		<div id="#p_detailBudgetAll">
	<div id="p_detailBudgetDiv">

	
	<c:set var="title" value="${fn:split(plan.p_setTitle,',') }"></c:set>
	<c:set var="item" value="${fn:split(plan.p_setItem,',') }"></c:set>
	<c:set var="price" value="${fn:split(plan.p_setPrice,',') }"></c:set>
	<table border="1" id="setBudgetTb">
		<tr>
		<c:forEach var="title" items="${title }">
		<td colspan="2" style="height: 70px;"><div id="p_setTitle">${title }</div></td>
	</c:forEach>	
		</tr>
		
		<tr>
		<c:forEach var="item" items="${item }">
		<td style="width: 50px; height:35px; font-size: 12pt;">상품명</td>
		<td>${item }</td>
</c:forEach>	
		</tr>
		
		<tr>
		<c:forEach var="price" items="${price }">
		<td style="width: 50px; height:35px; font-size: 12pt;">금액</td>
		<td>${price }</td>
	</c:forEach>
		</tr>
	</table>
	
	</div>
	</div>
	
	
	
	
	
	
	
	
<!-- 예산결과 보여주는 곳 -->
	<span id="p_openBudget" onclick="p_openBudget()">💲예산결과 ▼</span>
	<div id="#p_detailBudgetAll">
	<div id="p_detailBudgetDiv">
	
	<table border="1" id="p_detailBudget">
			
		<tr>
			<td id="p_writeBudgetWrite"></td>
		</tr>
	</table>
	</div>
	</div>


	
<!-- 자유 한마디 -->
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFree">
		
		<tr>
			<td id="p_writeFreeWrite">${plan.p_freeWrite }</td>
		</tr>
	</table>
	</div>
	


</body>
</html>