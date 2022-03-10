<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="resources/plan/p_js/jquery.js" ></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10c7423289ef4af1c8687b735db21075&libraries=services"></script>

<script type="text/javascript" src="resources/plan/p_js/plan_map.js" ></script>
<script type="text/javascript" src="resources/plan/p_js/plan.js" ></script>

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
			<td colspan="3">
				<input placeholder="입력해주세요" id="p_search"><input type="button" id="p_searchBtn" value="검색">
			<div id="map" style="width:800px;height:300px;"></div>
			<div style="font-size: 20pt; text-align: center; margin-top: 50px;">📅 여행 일정</div>
			</td>
			
		</tr>
		
		<tr>
			<td colspan="3"><div id="p_route"></div>
			 <div id="i_am_test">그랜드 하얏트 리젠시 나하 오키나와 주차장 별관 </div>
			</td>
		</tr>
		
	</table>
 
	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteTitle"><span>💲여행 예산</span><button id="dBtn" type="button">일정 저장</button></div>
	<div id="p_openDayWrite">
			<div id="confirmContent">
		<div id="p_DayWriteAll" >
		<div id="p_dayWriteDiv">
		
		
		<table border="1" id="sese">
		<tr>
		<td colspan="2">하얏트 리젠시 나하 오키나와 리젠시 클럽 라운지</td>
		</tr>
		
		<tr>
		<td style="width: 50px; font-size: 12pt;">상품명</td>
		<td><input style="width: 80px;"></td>
		</tr>
		
		<tr>
		<td style="width: 50px; font-size: 12pt;">금액</td>
		<td><input type="number" style="width: 80px;" id="qqe"></td>
		</tr>
		</table>
		
		<table border="1" id="sese">
		<tr>
		<td colspan="2">아쿠아 리조트 클럽 사이판</td>
		</tr>
		
		<tr>
		<td style="width: 50px; font-size: 12pt;">상품명</td>
		<td><input style="width: 80px;"></td>
		</tr>
		
		<tr>
		<td style="width: 50px; font-size: 12pt;">금액</td>
		<td><input type="number" style="width: 80px;" id="qqe"></td>
		</tr>
		</table>
		
		<table>
		<tr>
		<td id="showw">총금액</td>
		</tr>

		
		</table>
<script type="text/javascript">

	$(document).on("click", "#qqe", function () {
		
		
		
		$(this).keyup(function () {
			
			let num = $(this).val();
			alert(num)
			
		})
		
		
		
		
	})

		
		
</script>
		
		</div>
		</div>

			</div>

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

<input id="aaa" value="ddd" type="button">

<div id="ccity">
ㅈㅈ

</div>



</body>
</html>