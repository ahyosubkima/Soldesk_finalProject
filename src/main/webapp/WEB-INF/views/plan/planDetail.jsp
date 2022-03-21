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
<div id="p_writeTitle"><h1>여행 플래너 상세</h1></div>

<!-- 일전 기본정보 -->
<table id="p_write">
		<tr>
			<td rowspan="3" style="width: 300px; text-align: center;">
				<img src="resources/plan/p_file/${plan.p_titleFile }" id="p_detailFile">
			</td>
			<td colspan="2"><h3>플래너 제목</h3><div style="margin-top: 10px;">${plan.p_title }</div></td>
		</tr>
		
		<tr>
			<td style="width: 250px;"><h3>출발 날짜</h3>
				<div style="margin-top: 10px;">
				<fmt:formatDate value="${plan.p_startDate }" pattern="yyyy년 MM월 dd일"/>
					&nbsp;&nbsp;${plan.p_days }박${plan.p_days+1}일
				</div>     
			</td>
			<td><h3>여행 인원</h3><div style="margin-top: 10px;">${plan.p_person }&nbsp;명</div> </td>
		</tr>
		
		<tr>
			<td colspan="2"><h3>여행 장소</h3><div style="margin-top: 10px;">${plan.p_place }</div></td>
		</tr>
</table>



<!-- 여행 전체일정 -->
<div style="margin: auto; width: 800px; text-align: center; font-size: 20pt; margin-top: 60px;">📅 여행 전체일정</div>
<div style="margin: auto; width: 800px; margin-top: 20px;">
	<table>
		<tr>
			<c:set var="plan" value="${fn:split(plan.p_plan,',') }"></c:set>
			<c:forEach var="plan" items="${plan }">
			<td colspan="2">
			<div id="mapName">${plan }</div>
			</td>
			</c:forEach>
		</tr>
	</table>
</div>


	
<!-- 필요 예산 상세 -->
<div id="p_DayWriteTitle"><span>💰 여행 예산</span></div>
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





	
	
<!-- 예산 결과 보여주는 곳 -->
	<div id="p_DayWriteTitle">💲예산 결과</div>
	<table border="1" id="p_detailBudgetDetail">
		<tr>
			<td id="p_writeBudgetWrite"><textarea id="p_budget">${plan.p_budget }</textarea></td>
		</tr>
	</table>


	
<!-- 자유 한마디 -->
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFreeDetail">
		
		<tr>
			<td id="p_writeFreeWriteDetail">${plan.p_freeWrite }</td>
		</tr>
	</table>
	</div>
	


</body>
</html>