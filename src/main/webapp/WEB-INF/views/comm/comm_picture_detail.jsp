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
	<div id="comm_picture_detail_area">
		<div id="comm_menu1122">
			<aside id="comm_menu_side">
				<table id="comm_picture_tbl">
					<tr>
						<td id="comm_picture_td_title">커뮤니티</td>
					</tr>
					<tr>

						<td id="comm_picture_td"><a href="/danim/comm_picture_page?pageNum=1">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">영상게시판</a></td>

					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page?pageNum=1">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>
		<div id="comm_picture_content112">
		<div id="content_title_div">
				<h2  class="best_pic2">사진게시판</h2> <img id="sdf_img2" src="resources/comm/comm_img/photo.png">
				</div>
				<hr class="comm_detail_hr">
			<c:forEach var="picture" items="${picture }">
				<table id="comm_picture_detail_tbl">
					<tr>
						<td id="comm_detail_title" colspan="2">${picture.comm_picture_write_name }
						<input name="token" type="hidden" value="${token }">
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">조회수  : ${picture.comm_picture_view } |
						추천수 : ${picture.comm_picture_good } |
						작성자 : ${picture.comm_picture_writer } |
						</td>
					</tr>
					<tr>
						<td id="comm_picture_detail_td2">
						작성일 : <fmt:formatDate value="${picture.comm_picture_date }" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td colspan="2"><img id="comm_picture_detail_img"
							src="resources/comm/file/${picture.comm_picture_name }"></td>
					</tr>
					<tr>
						<td colspan="2" class="comm_picture_detail_td3">${picture.comm_picture_txt }</td>
					</tr>
					<c:if
						test="${sessionScope.loginMember.dm_nickname eq picture.comm_picture_writer || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
						<tr>
							<td colspan="2" style="text-align: right"><button
									style="width: 70px; margin-right: 10px; font-size: 15pt"
									onclick="comm_updateOK(${picture.comm_picture_no})">수정</button>
								<button style="width: 70px; font-size: 15pt;"
									onclick="comm_delOK(${picture.comm_picture_no})">삭제</button></td>
						</tr>
					</c:if>
					
					<c:if
						test="${sessionScope.loginMember.dm_nickname ne picture.comm_picture_writer && sessionScope.loginMember != null && checked.cpg_good eq null or checked.cpg_good == 0 }">
						<form action="comm_picture_good">
							<table style="padding-left: 72%; padding-top: 10px;">
								<tr>
									<td colspan="2" style="text-align: right;"><input
										name="no" type="hidden" value="${picture.comm_picture_no }">
										<input name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }">
										<input name="token2"  value="${token2 }" type="hidden">
										<button class="comm_heart_btn"	onclick="return reallyGood();"><img  class="comm_heart_img" src="resources/comm/comm_img/heart.png"></button></td>
								</tr>
							</table>
						</form>

					</c:if>
					<c:if
						test="${sessionScope.loginMember.dm_nickname ne picture.comm_picture_writer && sessionScope.loginMember != null && checked.cpg_good == 1 }">
						<form action="comm_picture_Nogood">
							<table style="padding-left: 72%; padding-top: 10px;">
								<tr>
									<td colspan="2" style="text-align: right;"><input
										name="no" type="hidden" value="${picture.comm_picture_no }">
										<input name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }">
										<input name="token2"  value="${token2 }" type="hidden">
										<button class="comm_heart_btn"
											onclick="return reallyNoGood();"><img class="comm_heart_img" src="resources/comm/comm_img/heart2.png"></button></td>
								</tr>
							</table>
						</form>
					</c:if>

				</table>
				<hr class="comm_detail_hr">
				<button id="list_btn" onclick="window.history.back()">목록</button>
				<table id="comm_picture_detail_reply_title">
					<tr>
						<td>댓글</td>
					</tr>
				</table>

				<form action="comm_picture_reply">
					<table id="comm_picture_detail_reply">
						<c:forEach items="${reply }" var="r">
							<tr>
								<td style="text-align: center; width: 150px;">${r.cpr_owner }<c:if test="${picture.comm_picture_writer eq r.cpr_owner }">
								<span id="reply_writer">
								&nbsp;&nbsp;작성자&nbsp;&nbsp;</span>
								</c:if></td>
								<td style="text-align: center;">${r.cpr_txt }</td>
								<td style="text-align: center;"><fmt:formatDate value="${r.cpr_when }" pattern="yyyy-MM-dd"/>
								<c:if
									test="${sessionScope.loginMember.dm_id eq r.cpr_owner_id  || sessionScope.loginMember.dm_isAdmin eq 'Y'}">
									
										<button onclick="pictureReplyUpdate(${r.cpr_no},${param.no })">수정</button>
										<button onclick="pictureReplyDel(${r.cpr_no})">삭제</button>
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
								<input name="cpr_owner" type="hidden"
								value="${sessionScope.loginMember.dm_nickname }"> <input
								name="cpr_owner_id" type="hidden"
								value="${sessionScope.loginMember.dm_id }">
							</td>
							<td style="text-align: center;"><input
								id="comm_picture_detail_replyInput" name="cpr_txt"
								class="cpr_txt"> 
								<input
								type="hidden" name="no" value="${picture.comm_picture_no }">
								<input type="hidden" name="token2" value="${token2}"></td>
							<td colspan="2" style="text-align: center;">
							<c:if test="${sessionScope.loginMember != null }">
							<button
									style="width: 70px; font-size: 15pt;" onclick="return replyOK()">작성</button>
									</c:if>
									
							<c:if test="${sessionScope.loginMember == null }">
							<button
									style="width: 70px; font-size: 15pt;" onclick="return replyNoOK()">작성</button>
									</c:if>
									</td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>