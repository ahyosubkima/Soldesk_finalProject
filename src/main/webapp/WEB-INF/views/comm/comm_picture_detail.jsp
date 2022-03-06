<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>

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
			<c:forEach var="picture" items="${picture }">
				<table id="comm_picture_detail_tbl" style="border: 1px solid black;">
					<tr>
						<td colspan="1" id="comm_picture_detail_td2">제목</td>
						<td colspan="3">${picture.comm_picture_write_name }<input
							name="token" type="hidden" value="${token }"></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td id="comm_picture_detail_td">${picture.comm_picture_view }</td>
						<td id="comm_picture_detail_td2">추천수</td>
						<td>${picture.comm_picture_good }</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>내용</td>
						<td><img id="comm_picture_detail_img"
							src="resources/comm/file/${picture.comm_picture_name }"></td>
						<td colspan="2">${picture.comm_picture_txt }</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${picture.comm_picture_date }</td>
						<td>작성자</td>
						<td>${picture.comm_picture_writer }</td>
					</tr>
					<c:if
						test="${sessionScope.loginMember.dm_name eq picture.comm_picture_writer}">
						<tr>
							<td colspan="4" style="text-align: right"><button
									style="width: 70px; margin-right: 10px; font-size: 15pt"
									onclick="comm_updateOK(${picture.comm_picture_no})">수정</button>
								<button style="width: 70px; font-size: 15pt;"
									onclick="comm_delOK(${picture.comm_picture_no})">삭제</button></td>
						</tr>
					</c:if>
					<c:if
						test="${sessionScope.loginMember.dm_name ne picture.comm_picture_writer && sessionScope.loginMember != null && checked.cpg_good eq null or checked.cpg_good == 0 }">
						<form action="comm_picture_good">
							<table style="padding-left: 75%;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
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
						test="${sessionScope.loginMember.dm_name ne picture.comm_picture_writer && sessionScope.loginMember != null && checked.cpg_good == 1 }">
						<form action="comm_picture_Nogood">
							<table style="padding-left: 77%; padding-top: 10px;">
								<tr>
									<td colspan="4" style="text-align: right;"><input
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

				<table id="comm_picture_detail_reply_title">
					<tr>
						<td>댓글</td>
					</tr>
				</table>

				<form action="comm_picture_reply">
					<table id="comm_picture_detail_reply">
						<c:forEach items="${reply }" var="r">
							<tr>
								<td style="text-align: center;">${r.cpr_when }</td>
								<td style="text-align: center;">${r.cpr_txt }</td>
								<td style="text-align: center;">${r.cpr_owner }</td>
								<c:if
									test="${sessionScope.loginMember.dm_id eq r.cpr_owner_id }">
									<td style="text-align: center;"><button>수정</button>
										<button onclick="pictureReplyDel(${r.cpr_no})">삭제</button></td>
								</c:if>
							</tr>
						</c:forEach>
						<tr>
							<td style="text-align: center;">${sessionScope.loginMember.dm_nickname }
								<input name="cpr_owner" type="hidden"
								value="${sessionScope.loginMember.dm_nickname }"> <input
								name="cpr_owner_id" type="hidden"
								value="${sessionScope.loginMember.dm_id }">
							</td>
							<td style="text-align: center;"><input
								id="comm_picture_detail_replyInput" name="cpr_txt"> <input
								type="hidden" name="no" value="${picture.comm_picture_no }">
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