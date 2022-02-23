<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<tr><td id="comm_picture_td_title">커뮤니티</td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_picture">사진게시판</a></td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_video">동영상게시판</a></td></tr>
<tr><td id="comm_picture_td"><a href="/danim/comm_free">자유게시판</a></td></tr>
</table>
</aside>
</div>


<div id="comm_picture_content112">
<form action="comm_picture_upload" method="post" enctype="multipart/form-data">
<table>
<tr>
<td>제목</td><td><input name="comm_picture_write_name"></td>
</tr>
<tr>
<td>사진</td><td><input type="file" name="comm_picture_name"></td>
</tr>
<tr>
<td>내용</td><td><textarea id="comm_picture_write_txt" name="comm_picture_txt"></textarea></td>
</tr>
<tr><td><button>작성</button></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>