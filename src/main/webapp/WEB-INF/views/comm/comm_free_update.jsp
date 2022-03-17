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
			<form action="comm_free_update_do" method="post"
					enctype="multipart/form-data">
				<table id="comm_picture_detail_tbl" style="border: 1px solid black;">
					<tr>
						<td colspan="1" id="comm_picture_detail_td2">제목</td>
						<td colspan="3"><input name="cf_write_name"
							value="${f.cf_write_name }"> <input name="token"
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
							<td><img id="comm_picture_detail_img"
								src="resources/comm/file/${f.cf_file_name }">
								<input type="hidden" name="oldFile" value="${f.cf_file_name }">
								<input type="file" name="newFile">
								</td>
							<td colspan="2"><textarea name="cf_txt">${f.cf_txt }</textarea></td>
						</c:if>
						<c:if test="${f.cf_file_name eq 'basic.jpg' }">
							<td id="cf_txt" colspan="2"><textarea name="cf_txt">${f.cf_txt }</textarea>
							</td>
							<td>첨부파일<input type="hidden" name="oldFile" value="${f.cf_file_name }">
								<input type="file" name="newFile"></td>
						</c:if>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${f.cf_date }</td>
						<td>작성자</td>
						<td>${f.cf_writer }
						<input type="hidden"
								value="${f.cf_no }" name="cf_no"></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: right"><button
								style="width: 70px; margin-right: 10px; font-size: 15pt">수정</button></td>
					</tr>
				</table>
		</form>
			</c:forEach>

		</div>
	</div>
</body>
</html>