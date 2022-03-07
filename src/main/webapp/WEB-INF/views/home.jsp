<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>다님 :: 즐거운 여행</title>
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
			<a href="index"><img src="resources/asset/index/img/logo.png" /></a>
		</div>

		<div class="nav_wrap">
			<ul class="nav">
				<li><a href="planMain">계획 짜기</a></li>
				<li><a href="review.go">여행 후기</a></li>
				<li><a href="/danim/comm_picture">커뮤니티</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${sessionScope.loginMember != null}">
				<div>
					<table>
						<tr>
							<td>${sessionScope.loginMember.dm_nickname}님환영합니다.</td>
						</tr>
						<tr>
							<td><button onclick="location.href='member.logout'">로그아웃</button></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<div class="btns_wrap">
					<ul class="btns">
						<li><a onclick="modalOpen()" class="loginBtn">로그인</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="modal_background"></div>
		
		<div class="modal_wrap">
			 <div class="modal_header">
				<a onclick="modalClose()" class="modal_close">✖</a>
			</div> 
			<div class="modal_content">
				<div class="modalBx login">
					<h2>아이디가 있으신가요?</h2>
					<button class="modal_loginBtn">로그인</button>
				</div>
				<div class="modalBx register">
					<h2>아이디가 없으신가요?</h2>
					<button class="registerBtn">회원가입</button>
				</div>
				
			</div>
			<div class="formBx">
				<div class="form loginForm">
					<form action="member.login" method="post" name="loginForm">
						<h3>로그인</h3>
						<input type="text" placeholder="아이디" name="dm_id"> <input
							type="text" placeholder="비밀번호" name="dm_pw">
						<button>로그인</button>
					</form>
				</div>

				<div class="form registerForm">
					<form action="member.register" method="post" name="registerForm">
						<h3>회원가입</h3>
						<input type="text" placeholder="아이디" name="dm_id"> <input
							type="text" placeholder="비밀번호" name="dm_pw"> <input
							type="text" placeholder="비밀번호 확인" name="dm_pw">
						<button>회원가입</button>
					</form>
				</div>
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
	<script>
		const modal_loginBtn = document.querySelector('.modal_loginBtn');
		const registerBtn = document.querySelector('.registerBtn');
		const formBx = document.querySelector('.formBx');

		registerBtn.onclick = function() {
			formBx.classList.add('active');
		}

		modal_loginBtn.onclick = function() {
			formBx.classList.remove('active');
		}
	</script>
</body>
</html>
