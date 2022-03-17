<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<td id="comm_picture_td"><a href="/danim/comm_video_page?pageNum=1">동영상게시판</a></td>
					</tr>
					<tr>
						<td id="comm_picture_td"><a href="/danim/comm_free_page">자유게시판</a></td>
					</tr>
				</table>
			</aside>
		</div>


		<div id="comm_picture_content1122">
		<form action="/danim/comm_free_upload" method="post" enctype="multipart/form-data">
			<table id="comm_free_tbl">
			<tr><td>제목</td><td><input name="cf_write_name"></td></tr>
			<tr><td>첨부파일</td><td><input type="file" name="cf_file_name" value="'basic'"></td></tr>
			<tr><td>내용</td><td><textarea name="cf_txt"></textarea>
			<input name="token"	type="hidden" value="${token }">
			<input type="hidden" name="cf_writer" value="${sessionScope.loginMember.dm_id }">
			</td></tr>	
			<tr><td colspan="2"><button>등록</button></td></tr>
			</table>
		</form>
			
		</div>
	</div>


</body>
</html>