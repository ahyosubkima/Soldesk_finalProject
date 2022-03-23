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
	<form action="plan.writePlanner">
		<table id="p_mainWrite">
		<tr><td><h3>🏃‍♂️플래너 작성🏃‍♀️</h3></td></tr>
		
			<tr>
				<td>총 몇일 여행하시나요?&nbsp;&nbsp;<input type="number" name="p_days" id="p_days"> 일 </td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="p_writePlannerBtn" class="p_writePlannerBtn">나만의 플래너 제작</button>
					 <!-- input hidden으로 아이디정보 가져가기 -->
					 <input type="hidden" name="p_writer" value="${sessionScope.loginMember.dm_id }">
					 <input type="hidden" name="p_nickname" value="${sessionScope.loginMember.dm_nickname }">
				</td>
			</tr>
		</table>
	</form>


<!-- 페이징-->
<c:if test="${pageMaker != null }">
<div id="p_pagingDiv">
		<!-- 이전페이지 버튼 -->
	<table id="p_pagingTbl">
		<tr>
			<td><c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a
					href="/danim/plan.page?pageNum=${pageMaker.startPage-1}"> &lt;이전 </a></li>
				</c:if></td>
				
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
				<td><a
					href="/danim/plan.page?pageNum=${num }">&nbsp;${num}&nbsp;&nbsp;|&nbsp;</a></td>
			</c:forEach>
				<td><c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="/danim/plan.page?pageNum=${pageMaker.endPage + 1 }">다음&gt;</a></li>
					</c:if></td>
		</tr>
	</table>
</div>
</c:if>



<!-- 검색기능 -->
<form action="plan.search">
<div id="" style="text-align: center;">
			<table id="" style="margin: auto; margin-bottom: 30px;">
				<tr>
					<td style="height: 25px; background-color: transparent;"></td>
				</tr>
				
				<tr>
				<td align="center" colspan="3"><select id="" name="p_searchSelect">
							<option value="p_searchAll">전체</option>
							<option value="p_searchTitle">여행제목</option>
							<option value="p_searchPlace">여행장소</option>
					</select> <input id="" name="n_searchWrite">
						<button>검색</button></td>
				</tr>
			</table>
</div>
</form>





<!-- 등록된 플래너 전체 조회-->
	<div id="p_mainDetailDiv">
			<c:forEach var="p" items="${plans }" varStatus="status">
		 <table id="p_mainDetail"> 
			 <tr>
					<td><div style="text-align: center;"><a href="plan.detailPlanner?p_no=${p.p_no }">
						<img id="p_mainPic"src="resources/plan/p_file/${p.p_titleFile }"></a></div></td>
				</tr>
				<tr>
					<td align="center">${p. p_title}</td>
				</tr>  
		 </table> 
			</c:forEach>
	</div>







</body>
</html>