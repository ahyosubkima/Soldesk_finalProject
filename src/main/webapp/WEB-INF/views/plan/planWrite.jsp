<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=690dce1d74d365eaed8c4188052a77a1&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/plan/p_js/jquery.js"></script>
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
			<td rowspan="2">플래너 표지 사진 업로드 <p><input type="file"></td>
			<td colspan="2">제목: <input></td>
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
	<div class="map_wrap" style="height:500px;">
    <div id="map" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>


			</td>
		</tr>
	</table>


<!-- 일정 상세등록 -->
	<c:forEach var="p" begin="1" end="${param.p_days}">
		<table border="1" id="p_writeDetail">
			<tr>
				<td>DAY${p}</td>
				<td><button id="p_add">추가하기</button></td>
			</tr>
			
			<tr>
				<td rowspan="2">지도</td>
				<td>주소:<input></td>
			</tr>
			
			<tr>
				<td>메뉴: <input></td>
			</tr>
			
			<tr>
				<td colspan="2">|</td>
			</tr>

		</table>
	</c:forEach> 
	
	<!-- 예산결과 보여주는 곳 -->
	<table border="1" id="p_writeBudget">
		<tr>
			<td id="p_writeSubTitle">💲예산 계산 결과</td>
		</tr>	
		<tr>
			<td id="p_writeBudgetWrite">OO님,<p>여행에 필요한 최소 비용은 00,000원으로 0명이 여행할 경우 1인당 0,000원입니다.</td>
		</tr>
	</table>
	
	<!-- 자유 한마디 -->
	<table border="1" id="p_writeFree">
		<tr>
			<td id="p_writeSubTitle">💪여행 전 한마디</td>
		</tr>	
		
		<tr>
			<td id="p_writeFreeWrite">작성하는 곳 input or textarea (100글자 제한두기)</td>
		</tr>
	</table>
	
	
		<div id="p_writeBtn"><button>플래너 등록</button></div>
	





</body>
</html>