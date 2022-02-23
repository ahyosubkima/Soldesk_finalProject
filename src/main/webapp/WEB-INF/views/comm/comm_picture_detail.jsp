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
<table>
<tr>
<td>제목</td><td>${picture.comm_picture_write_name }</td>
</tr>
<tr>
<td>조회수</td><td>${picture.comm_picture_view }</td><td>추천수</td><td>${picture.comm_picture_good }</td>
</tr>
<tr>
<td>작성일</td><td>${picture.comm_picture_date }</td><td>작성자</td><td>${picture.comm_picture_writer }</td>
</tr>
<tr>
<td>사진</td><td><img src="resources/comm/file/${picture.comm_picture_name }"></td>
</tr>
<tr>
<td>내용</td><td>${picture.comm_picture_txt }</td>
</tr>
<tr><td><button>삭제</button></td></tr>
</table>

</div>
</div>
</body>
</html>