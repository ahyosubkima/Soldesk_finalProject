<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>다님 :: Home</title>
<link rel="stylesheet" href="resources/asset/index/css/home.css" />
<link rel="stylesheet" href="resources/asset/index/css/style.css" />
<link rel="stylesheet" href="resources/asset/index/css/carousel.css" />
</head>
<body>
	<header>
		<div class="logo">
			<img src="resources/asset/index/img/logo.png" />
		</div>
		<ul class="nav">
			<li><a href="planMain">계획 짜기</a></li>
			<li><a href="#">여행 후기</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">이벤트</a></li>
		</ul>
		<ul class="btns">
			<li><a href="#" class="loginBtn">로그인</a></li>
			<li><a href="#" class="joinBtn">회원가입</a></li>
		</ul>
	</header>
	<div>
		<jsp:include page="${contentPage}"></jsp:include>
	</div>
	<footer class="footer">
		<div class="footer_wrap">
			<div class="footer_column">
				<div class="footer_title"><h2>다님</h2></div>
				<ul>
					<li><a href="">계획짜기</a></li>
					<li><a href="">여행후기</a></li>
					<li><a href="">이벤트</a></li>
					<li><a href="">후기</a></li>
				</ul>
			</div>
			<div class="footer_column">
				<div class="footer_title"><h2>대충</h2></div>
				<ul>
					<li><a href="">하위메뉴1</a></li>
					<li><a href="">하위메뉴2</a></li>
					<li><a href="">하위메뉴3</a></li>
					<li><a href="">하위메뉴4</a></li>
				</ul>
			</div>
			<div class="footer_column">
				<div class="footer_title"><h2>대충</h2></div>
				<ul>
					<li><a href="">하위메뉴1</a></li>
					<li><a href="">하위메뉴2</a></li>
					<li><a href="">하위메뉴3</a></li>
					<li><a href="">하위메뉴4</a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>
