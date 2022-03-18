<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

						<td id="comm_picture_td"><a href="/danim/comm_picture_page">사진게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a
							href="/danim/comm_video_page?pageNum=1">동영상게시판</a></td>

					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>
		<div id="comm_picture_content112">
			<c:forEach var="f" items="${free }">
				<table id="comm_picture_detail_tbl" style="border: 1px solid black;">
					<tr>
						<td colspan="1" id="comm_picture_detail_td2">제목</td>
						<td colspan="3">${f.cf_write_name }<input name="token"
							type="hidden" value="${token }"></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td id="comm_picture_detail_td">${f.cf_view }</td>
						<td id="comm_picture_detail_td2">추천수</td>
						<td>${f.cf_good }</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>내용</td>
						<c:if test="${f.cf_file_name ne 'basic.jpg' }">
						<td>
						<img id="comm_picture_detail_img"
							src="resources/comm/file/${f.cf_file_name }"></td>
						<td colspan="2">${f.cf_txt }</td>
						</c:if>
						<c:if test="${f.cf_file_name eq 'basic.jpg' }">
						<td  id="cf_txt" colspan="3">${f.cf_txt }</td>
						</c:if>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${f.cf_date }</td>
						<td>작성자</td>
						<td>${f.cf_writer }</td>
					</tr>
					<c:if test="${sessionScope.loginMember.dm_id eq f.cf_writer}">
						<tr>
							<td colspan="4" style="text-align: right"><button
									style="width: 70px; margin-right: 10px; font-size: 15pt"
									onclick="comm_updateFreeOK(${f.cf_no})">수정</button>
								<button style="width: 70px; font-size: 15pt;"
									onclick="comm_FreedelOK(${f.cf_no})">삭제</button></td>
						</tr>
					</c:if>

					<c:if
						test="${sessionScope.loginMember.dm_id ne f.cf_writer && sessionScope.loginMember != null && checked.cfg_good eq null or checked.cfg_good == 0 }">
						<form action="comm_free_good">
							<table style="padding-left: 75%;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
										name="no" type="hidden" value="${f.cf_no }"> <input
										name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }"> <input
										name="token2" value="${token2 }" type="hidden">
										<button class="comm_heart_btn" onclick="return reallyGood();">
											<img class="comm_heart_img"
												src="resources/comm/comm_img/heart.png">
										</button></td>
								</tr>
							</table>
						</form>

					</c:if>
					<c:if
						test="${sessionScope.loginMember.dm_id ne f.cf_writer && sessionScope.loginMember != null && checked.cfg_good == 1 }">
						<form action="comm_free_Nogood">
							<table style="padding-left: 77%; padding-top: 10px;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
										name="no" type="hidden" value="${f.cf_no }"> <input
										name="id" type="hidden"
										value="${sessionScope.loginMember.dm_id }"> <input
										name="token2" value="${token2 }" type="hidden">
										<button class="comm_heart_btn"
											onclick="return reallyNoGood();">
											<img class="comm_heart_img"
												src="resources/comm/comm_img/heart2.png">
										</button></td>
								</tr>
							</table>
						</form>
					</c:if>

				</table>

				<table id="comm_picture_detail_reply_title">
					<tr>
						<td>댓글</td>
					</tr>
				</table>

				<form action="comm_free_reply">
					<table id="comm_picture_detail_reply">
						<c:forEach items="${reply }" var="r">
							<tr>
								<td style="text-align: center;">${r.cfr_when }</td>
								<td style="text-align: center;">${r.cfr_txt }</td>
								<td style="text-align: center;">${r.cfr_owner }
								<c:if test="${f.cf_writer eq r.cfr_owner_id }">
								&nbsp;&nbsp;<span id="reply_writer"><img id="crown_img" src="resources/comm/comm_img/crown.png">작성자</span>
								</c:if>
								</td>
								<c:if
									test="${sessionScope.loginMember.dm_id eq r.cfr_owner_id }">
									<td style="text-align: center;">
										<button  onclick="freeReplyUpdate(${r.cfr_no},${param.no}">수정</button>
										<button onclick="pictureReplyDel(${r.cfr_no})">삭제</button></td>
								</c:if>
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;">${sessionScope.loginMember.dm_nickname }
								<input name="cfr_owner" type="hidden"
								value="${sessionScope.loginMember.dm_nickname }"> <input
								name="cfr_owner_id" type="hidden"
								value="${sessionScope.loginMember.dm_id }">
							</td>
							<td style="text-align: center;"><input
								id="comm_picture_detail_replyInput" name="cfr_txt"> <input
								type="hidden" name="no" value="${f.cf_no }">
								<input type="hidden" name="token2" value="${token2}"></td>
							<td colspan="2" style="text-align: center;"><button
									style="width: 70px; font-size: 15pt;">작성</button></td>
						</tr>
					</table>
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>