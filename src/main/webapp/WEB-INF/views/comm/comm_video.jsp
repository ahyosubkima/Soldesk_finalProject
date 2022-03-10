<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		window.onpageshow = function(event) {
			if (event.persisted
					|| (window.performance && window.performance.navigation.type == 2)) {
				let pgn = $("#pgn").val();
				if (pgn != "") {
					location.href = "/danim/comm_video_page?pageNum=" + pgn;
				} else {
					location.href = "/danim/comm_video_page";
				}
			}
		}
	});
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
						<td id="comm_picture_td"><a href="/danim/comm_picture_page">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">동영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_picture_content112">

			<form action="comm_video_search">
				<table id="comm_picture_searchTbl">
					<tr>
						<td><select name="search_option">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="txt">내용</option>
						</select> <input name="search_input">
						<input type="hidden" value="1" name="pageNum">
							<button id="comm_picture_searchBtn">검색</button></td>
					</tr>
				</table>
			</form>

			<c:if test="${param.search_input eq null }">
				<h2 id="">베스트 영상</h2>
				<div style="border: 1px solid; width: 1600px; float: left;">
					<c:forEach var="g" items="${good_videos }" varStatus="status">
						<table class="comm_picture_bestTbl2" style="">
							<tr>
								<td><video id="comm_picture_best_img"
									src="resources/comm/file/${g.cv_name }"
									onclick="location.href='comm_video_detail?no=${g.cv_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}'"></video></td>
							</tr>
							<tr>
								<td id="comm_picture_best_writer">${g.cv_write_name }<span
									style="float: right;">-${g.cv_writer }님</span></td>
							</tr>


						</table>
					</c:forEach>


				</div>
			</c:if>
			<div style="border: 1px solid; width: 1600px; float: left;">
				<h2
					<c:if test="${param.search_input eq null }">id="comm_picture_content_title2"</c:if>>영상
					게시판</h2>
				<c:if test="${videos != null }">
					<c:forEach var="p" items="${videos }" varStatus="status">
						<table class="comm_picture_bestTbl2" style="">
							<tr>
								<td><video id="comm_picture_best_img"
									src="resources/comm/file/${p.cv_name }"
									onclick="location.href='comm_video_detail?no=${p.cv_no }&t=${sessionScope.token }&id=${sessionScope.loginMember.dm_id}'"></video></td>
							</tr>
							<tr>
								<td id="comm_picture_best_writer">${p.cv_write_name }<span
									style="float: right;">-${p.cv_writer }님</span></td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
				<c:if test="${empty videos }">
					<table class="comm_picture_bestTbl2" style="padding-top: 20pt;">
						<tr>
							<td id="comm_empty_write">등록된 영상이 없습니다.</td>
						</tr>
					</table>
				</c:if>



			</div>
			<c:if test="${sessionScope.loginMember != null}">
				<input type="button" id="comm_picture_writeBtn" value="글쓰기"
					onclick="location.href='/danim/comm_video_write'">
			</c:if>
			<c:if test="${pageMaker != null && not empty videos }">
			<div id="paging_div">
			 <!-- 이전페이지 버튼 -->    
 			   <table id="paging_Tbl">
 			   <tr>
 			   <td><c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="/danim/comm_video_page?pageNum=${pageMaker.startPage-1}">Previous</a></li>
                </c:if></td>
				   <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <td class="paging_Tbl_td"><a href="/danim/comm_video_page?pageNum=${num }">[${num}]</a></td>
                </c:forEach>
                <td> <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="/danim/comm_video_page?pageNum=${pageMaker.endPage + 1 }">Next</a></li>
                </c:if>  </td>
                </tr>
                </table>
                </div>
				</c:if>
				<c:if test="${pageMakerTitle != null && not empty videos }">
			<div id="paging_div">
			 <!-- 이전페이지 버튼 -->    
 			   <table id="paging_Tbl">
 			   <tr>
 			   <td><c:if test="${pageMakerTitle.prev}">
                    <li class="pageInfo_btn previous"><a href="/danim/comm_video_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.startPage-1}&search_option=${sessionScope.search_option}">Previous</a></li>
                </c:if></td>
				   <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMakerTitle.startPage}" end="${pageMakerTitle.endPage}">
                    <td class="paging_Tbl_td"><a href="/danim/comm_video_search?search_input=${param.search_input }&pageNum=${num }&search_option=${sessionScope.search_option}">[${num}]</a></td>
                </c:forEach>
                <td> <c:if test="${pageMakerTitle.next}">
                    <li class="pageInfo_btn next"><a href="/danim/comm_video_search?search_input=${param.search_input }&pageNum=${pageMakerTitle.endPage + 1 }&search_option=${sessionScope.search_option}">Next</a></li>
                </c:if>  </td>
                			</tr>
                		</table>
                	</div>
                </c:if>
		</div>
	</div>


</body>
</html>