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
<form action="plan.writeReg" name="planWrite" method="post" enctype="multipart/form-data" >
	<table border="1" id="p_write">
	            <!-- 아이디정보 -->
		<tr><td><input type="hidden" name="p_writer" value="${param.p_writer }">
		<tr><td><input type="hidden" id="p_nickname" name="p_nickname" value="${param.p_nickname }">
				<input type="hidden" name="token" value="${token }"></td></tr>

		<tr>
			<td rowspan="3">플래너 표지 사진 업로드 <p><input type="file" name="p_titleFile"></td>
			<td colspan="2">제목: <input name="p_title"></td>
		</tr>
		
		<tr>
			<td>출발: <input type="date" name="p_startDate"></td>
			<td>인원: <input type="number" name="p_person" id="p_person"></td>
		</tr>

		<tr>
			<td>장소: <input name="p_place"></td>
		</tr>

		<tr>
			<td colspan="3">
				<input placeholder="입력해주세요" id="p_search"><input type="button" id="p_searchBtn" value="검색">
			<div id="map" style="width:800px;height:300px;"></div>
			<div style="font-size: 20pt; text-align: center; margin-top: 50px;">📅 여행 전체일정</div>
			</td>
			
		</tr>
		
		<tr>
			<td colspan="3"><div id="p_route"></div>
			 <div id="i_am_test">그랜드 하얏트 리젠시 나하 오키나와 주차장 별관 </div>
			</td>
		</tr>
		
	</table>
 
	
<!-- 일정 상세등록 -->
	<div id="p_DayWriteTitle"><span>💰여행 예산</span><button id="dBtn" type="button">일정 저장</button></div>
	<div style="margin: auto;text-align: center;"> ❗ 여행 전체일정에서 비용이 필요한 일정을 선택 후 작성해주세요<p>(일정을 클릭시 자동으로 작성란이 생성됩니다.)</div>
	<div style="margin: auto;text-align: center;"><button id="p_addTransportation" type="button">🚗교통비 추가</button></div>
	<div id="p_openDayWrite">
			<div id="confirmContent">
		<div id="p_DayWriteAll" >
		<div id="p_dayWriteDiv">
		
		
		<table border="1" id="setBudgetTb">
		<tr>
		<td colspan="2" style="height: 70px;"><div id="p_setTitle" class="p_setTitle">하얏트 리젠시 나하 오키나와 리젠시 클럽 라운지</div></td>
		</tr>
		
		<tr>
		<td style="width: 50px; height:35px; font-size: 12pt;">상품명</td>
		<td><input class="p_setItem" name="p_setItem" style="width: 130px;"></td>
		</tr>
		
		<tr>
		<td style="width: 50px; height:35px; font-size: 12pt;">금액</td>
		<td><input type="number" style="width: 130px;" name="p_setPrice" id="p_setPrice" class="p_setPrice"></td>
		</tr>
		</table>
		
		<table border="1" id="setBudgetTb">
		<tr>
		<td colspan="2" style="width:50px "><div id="p_setTitle" class="p_setTitle">아쿠아 리조트 클럽 사이판</div></td>
		</tr>
		
		<tr>
		<td style="width: 40px; height:35px; font-size: 12pt;">상품명</td>
		<td><input class="p_setItem" name="p_setItem" style="width: 80px;"></td>
		</tr>
		
		<tr>
		<td style="width: 40px; height:35px; font-size: 12pt;">금액</td>
		<td><input type="number" style="width: 80px;" id="p_setPrice" name="p_setPrice" class="p_setPrice"></td>
		</tr>
		</table>
		
		
		</div>
		</div>

			</div>

	</div>


<!-- 예산결과 보여주는 곳 -->
	<div id="p_BudgetAll">
	<span id="p_openBudget" onclick="budgetCalc()">💲계산하기</span>
	<table border="1" id="p_writeBudget">
			
		<tr>
			<td id="p_writeBudgetWrite" style="text-align: center;"> 계산하기 버튼을 눌러주세요.</td>
		</tr>
	</table>
	</div>


	
<!-- 자유 한마디 -->
	<div id="p_FreeWordAll">
	<span id="p_openFreeWord" onclick="p_openFreeWord()">💪여행 전 한마디 ▼</span>
	<table border="1" id="p_writeFree">
		
		<tr>
			<td id="p_writeFreeWrite"><textarea id="p_freeWrite" name="p_freeWrite" placeholder="자유롭게 작성해주세요 (100자 이내)" maxlength="100"></textarea>
									<input type="text" placeholder="( / 100)" id="textLengthCheck" readonly/></td>
		</tr>
	</table>
	</div>
	
	<div id="p_regOk">
	
	<input type="submit" value="플래너 등록">
	</div> 
	
</form> 



</body>
</html>