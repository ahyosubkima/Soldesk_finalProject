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

  <link rel="stylesheet" href="resources/comm/comm_css/comm_picture.css">
<script type="text/javascript" src="resources/comm/comm_js/comm_js.js"></script>
  <script>
	function modalOpen() {
		const body = document.querySelector('body');
		body.style.overflow = 'hidden'
		document.querySelector('.modal_wrap').style.display = 'flex';
		document.querySelector('.modal_background').style.display = 'block';

	}

	function modalClose() {
		const body = document.querySelector('body');
		body.style.overflow = 'auto';
		document.querySelector('.modal_wrap').style.display = 'none';
		document.querySelector('.modal_background').style.display = 'none';
	}
</script>

</head>
<body>
	<header>
		<div class="logo">
			<img src="resources/asset/index/img/logo.png" />
		</div>

		<div class="nav_wrap">
			<ul class="nav">
				<li><a href="planMain">계획 짜기</a></li>
				<li><a href="review.go">여행 후기</a></li>
				<li><a href="/danim/comm_picture">커뮤니티</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</div>
		<div class="btns_wrap">
			<ul class="btns">
				<li><a onclick="modalOpen()" class="loginBtn">로그인</a></li>
				<li><a href="#" class="joinBtn">회원가입</a></li>
			</ul>
		</div>

		<div class="modal_background"></div>
		<div class="modal_wrap">
			<div class="modal_header">
				<div class="text">
					<span>로그인</span>
				</div>
				<div class="closeBtn">
					<a onclick="modalClose()" class="modal_close">✖</a>
				</div>
			</div>
			<div class="modal_content">
				<form action="#" method="post" name="loginForm">
				<input type="text" class="userId" name="userId" placeholder="ID"
					required> 
				<input type="text" class="userPw" name="userPw"
					placeholder="PASSWORD" required>
				<a onclick="#" class="modal_Login">로그인</a>
				</form>
			</div>
			<hr>
			<div class="modal_footer">
			
			</div>
		</div>
	</header>

	<div>
		<jsp:include page="${contentPage}"></jsp:include>
	</div>
	<footer class="footer">
		<div class="footer_wrap">
			<div class="footer_column">

				<div class="footer_title">
					<h2>다님</h2>
				</div>

				<ul>
					<li><a href="">계획짜기</a></li>
					<li><a href="">여행후기</a></li>
					<li><a href="">이벤트</a></li>
					<li><a href="">후기</a></li>
				</ul>
			</div>
			<div class="footer_column">

				<div class="footer_title">
					<h2>대충</h2>
				</div>

				<ul>
					<li><a href="">하위메뉴1</a></li>
					<li><a href="">하위메뉴2</a></li>
					<li><a href="">하위메뉴3</a></li>
					<li><a href="">하위메뉴4</a></li>
				</ul>
			</div>
			<div class="footer_column">

				<div class="footer_title">
					<h2>대충</h2>
				</div>

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
