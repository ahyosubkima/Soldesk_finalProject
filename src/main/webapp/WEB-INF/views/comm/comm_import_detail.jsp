<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>

					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>
		<div id="comm_picture_content112">
			<div id="content_title_div">
				<h2  class="best_pic2">자유게시판</h2> <img id="sdf_img2" src="resources/comm/comm_img/free4.png">
				</div>
				<hr class="comm_detail_hr2">
			<c:forEach var="i" items="${notification }">
				<table id="comm_picture_detail_tbl2">
					<tr>
						<td id="comm_detail_title" colspan="2">${i.ci_write_name }
						<input name="token" type="hidden" value="${token }">
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">조회수  : ${i.ci_view } |
						작성자 : 관리자 |
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">
						작성일 : <fmt:formatDate value="${i.ci_date }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<c:if test="${i.ci_file_name ne 'basic.jpg' }">
						<td>
						<img id="comm_picture_detail_img2"
							src="resources/comm/file/${i.ci_file_name }"></td>
						</c:if>
						<c:if test="${i.ci_file_name eq 'basic.jpg' }">
						</c:if>
					</tr>
					<tr>
						<td colspan="2" class="comm_picture_detail_td4">
						<pre class="comm_picture_detail_td4">${i.ci_txt }</pre>
						</td>
					</tr>
					<c:if test="${sessionScope.loginMember.dm_nickname eq i.ci_writer || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
						<tr>
							<td colspan="4" style="text-align: right"><button
									style="width: 70px; margin-right: 10px; font-size: 15pt"
									onclick="comm_updateFreeOK(${i.ci_no})">수정</button>
								<button style="width: 70px; font-size: 15pt;"
									onclick="comm_importdelOK(${i.ci_no})">삭제</button></td>
						</tr>
					</c:if>
				</table>

				<table id="comm_picture_detail_reply_title">
					<tr>
						<td>댓글</td>
					</tr>
				</table>

				<form action="comm_import_reply">
					<table id="comm_picture_detail_reply">
					<c:forEach items="${reply }" var="r">
							<tr>
								<td style="text-align: center; width: 150px">${r.cir_owner }<c:if test="${i.ci_writer eq r.cir_owner }">
								<span id="reply_writer">
								&nbsp;&nbsp;작성자&nbsp;&nbsp;</span>
								</c:if>
								</td>
								<td style="text-align: center;">${r.cir_txt }</td>
								<td style="text-align: center;"><fmt:formatDate value="${r.cir_when }" pattern="yyyy-MM-dd"/>
								<c:if
									test="${sessionScope.loginMember.dm_id eq r.cir_owner_id  || sessionScope.loginMember.dm_isAdmin eq 'Y' }">
									
										<button onclick="freeReplyUpdate(${r.cir_no},${param.no})">수정</button>
										<button onclick="freeReplyDel(${r.cir_no})">삭제</button>
								</c:if>
								</td>	
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;">
							<c:if test="${sessionScope.loginMember != null }">
							${sessionScope.loginMember.dm_nickname }
							</c:if>
							<c:if test="${sessionScope.loginMember == null }">
							로그인이 필요합니다.
							</c:if>
								<input name="cir_owner" type="hidden"
								value="${sessionScope.loginMember.dm_nickname }"> <input
								name="cir_owner_id" type="hidden"
								value="${sessionScope.loginMember.dm_id }">
							</td>
							<td style="text-align: center;"><input
								id="comm_picture_detail_replyInput" name="cir_txt"
								class="cfr_txt"> <input type="hidden" name="no"
								value="${i.ci_no }"> <input type="hidden" name="token2"
								value="${token2}"></td>
							<td colspan="2" style="text-align: center;">
							<c:if test="${sessionScope.loginMember != null }">
									<button style="width: 70px; font-size: 15pt;"
										onclick="return freereplyOK()">작성</button>
								</c:if> <c:if test="${sessionScope.loginMember == null }">
									<button style="width: 70px; font-size: 15pt;"
										onclick="return replyNoOK()">작성</button>
								</c:if></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>