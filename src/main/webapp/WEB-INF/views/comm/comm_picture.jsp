<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	window.onpageshow = function(event) {
		if (event.persisted
				|| (window.performance && window.performance.navigation.type == 2)) {
						location.href = "/danim/comm_picture";
		}
	} 
</script>

</head>
<body>


	<div id="comm_picture_area">
		<div id="comm_menu112">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_picture">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video">동영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_picture_content112">

			<form action="comm_picture_search">
				<table id="comm_picture_searchTbl">
					<tr>
						<td><select name="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input">
						<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>

			<c:if test="${param.search_input eq null }">
			<h2 id="">베스트 사진</h2>
			<div style="border: 1px solid; width: 1600px; float: left;">
				<c:forEach var="g" items="${good_pictures }" varStatus="status">
					<table class="comm_picture_bestTbl2" style="">
						<tr>
							<td><img id="comm_picture_best_img"
								src="resources/comm/file/${g.comm_picture_name }"
								onclick="location.href='comm_picture_detail?no=${g.comm_picture_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}'"></img></td>
						</tr>
						<tr>
							<td id="comm_picture_best_writer">${g.comm_picture_write_name }<span
								style="float: right;">-${g.comm_picture_writer }님</span></td>
						</tr>


					</table>
				</c:forEach>


			</div>
			</c:if>

			<div style="border: 1px solid; width: 1600px; float: left;">
			<h2 <c:if test="${param.search_input eq null }">id="comm_picture_content_title2"</c:if>>사진 게시판</h2>
				<c:forEach var="p" items="${pictures }" varStatus="status">
					<table class="comm_picture_bestTbl2" style="">
						<tr>
							<td><img id="comm_picture_best_img"
								src="resources/comm/file/${p.comm_picture_name }"
								onclick="location.href='comm_picture_detail?no=${p.comm_picture_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}'"></img></td>
						</tr>
						<tr>
							<td id="comm_picture_best_writer">${p.comm_picture_write_name }<span
								style="float: right;">-${p.comm_picture_writer }님</span></td>
						</tr>


					</table>
				</c:forEach>


			</div>
			<c:if test="${sessionScope.loginMember != null}">
			<input type="button" id="comm_picture_writeBtn" value="글쓰기"
				onclick="location.href='/danim/comm_picture_write'">
			</c:if>
		</div>
	</div>


</body>
</html>