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
<script type="text/javascript" src="resources/asset/index/js/jquery.js"></script>

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
			<a href="index"><img src="resources/asset/index/img/logo.png"/></a>
		</div>

		<div class="nav_wrap">
			<ul class="nav">
				<li><a href="planMain">계획 짜기</a></li>
				<li><a href="review.go">여행 후기</a></li>
				<li><a href="/danim/comm_picture_page">커뮤니티</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${sessionScope.loginMember != null}">
				<div>

					<table>
						<tr>
							<td>${sessionScope.loginMember.dm_nickname}님 환영합니다.</td>
						</tr>
						<tr>
							<td><button onclick="location.href='member.logout'">로그아웃</button></td>
							<td><button onclick="location.href='member.myPage'">마이페이지</button>
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
						<input type="text" placeholder="아이디" name="dm_id"> 
						<input type="password" placeholder="비밀번호" name="dm_pw">
						<button>로그인</button>
					</form>
					<hr>
					<a>아이디/비밀번호를 잊어버리셨나요?</a>
				</div>

				<div class="form registerForm">
					<form action="member.register" method="post" name="registerForm">
						<h3>회원가입</h3>
						<input type="text" placeholder="아이디" name="dm_id" id="dm_id" class="reg_id" required>
						<div class="check_fnt" id="id_check"></div> 
						<input type="password" placeholder="비밀번호" name="dm_pw" id="dm_pw" class="reg_pw" required>
						<div class="check_fnt" id="pw_check1"></div>
						<input type="password" placeholder="비밀번호 확인"  id="dm_pwCheck" class="reg_pwCheck">
						<div class="check_fnt" id="pw_check2"></div>
						<input type="text" placeholder="닉네임" name="dm_nickname" id = "dm_nickname" class="reg_nick" required> 
						<div class="check_fnt" id="nick_check"></div> 
						<input type="text" placeholder="이메일" name="dm_email" id = "dm_email" class="reg_mail" required>
						<div class="check_fnt" id="mail_check"></div>
						<input type="text" name="dm_isAdmin" value="N">
						<button id="reg_submit">회원가입</button>
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
	<script>
	
	const idJ = /^[a-z0-9]{4,12}$/;
	
	
	$("#dm_id").blur(function() {
		// id = "id_reg" / name = "userId"
		let dm_id = $('#dm_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member.idCheck?dm_id='+ dm_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						$("#id_check").css("margin-top", "-18px");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(dm_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#id_check").css('margin-top', '0px');
							$("#reg_submit").attr("disabled", false);
				
						} else if(dm_id == ""){
							$('#id_check').text('아이디를 입력해주세요 :)');
							$("#id_check").css("margin-top", "-18px");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							$('#id_check').text("아이디는 영어 소문자와 숫자 4~12자리만 가능합니다");
							$("#id_check").css("margin-top", "-18px");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		const pwJ = /^[A-Za-z0-9]{4,12}$/;
		const pw1 = $('#dm_pw').val();
		const pw2 = $('#dm_pwCheck').val();
		
		 /* $('#dm_pw').blur(function pwCheck() {
			if(pwJ.test(pw1)) {
				$("#pw_check1").text("");
				$("#pw_check1").css('margin-top', '0px');
				$("#reg_submit").attr("disabled", false);
				
			} else if(pw1 == ""){
				$('#pw_check1').text('비밀번호를 입력해주세요');
				$("#pw_check1").css("margin-top", "-18px");
				$('#pw_check1').css('color', 'red');
				$("#reg_submit").attr("disabled", true);				
				
			} else {
				$('#pw_check1').text("영어 대소문자와 숫자로 4~12자리 비밀번호를 입력해주세요");
				$("#pw_check1").css("margin-top", "-18px");
				$('#pw_check1').css('color', 'red');
				$("#reg_submit").attr("disabled", true);
			}
		}) */
		
		/* $('#dm_pwCheck').blur(function isPwSame() {
			if(pw1 == pw2) {
				$("#pw_check2").text("");
				$("#pw_check2").css('margin-top', '0px');
				$("#reg_submit").attr("disabled", false);
			} else {
				$('#pw_check2').text('비밀번호가 일치하지 않습니다');
				$("#pw_check2").css("margin-top", "-18px");
				$('#pw_check2').css('color', 'red');
				$("#reg_submit").attr("disabled", true);
			}
		}) */
		
		/* $("#dm_nickname").blur(function() {
			// id = "id_reg" / name = "userId"
			let dm_nickname = $('#dm_nickname').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/member.nickCheck?dm_nickname='+ dm_nickname,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#nick_check").text("사용중인 아이디입니다");
							$("#nick_check").css("color", "red");
							$("#nick_check").css("margin-top", "-18px");
							$("#reg_submit").attr("disabled", true);
						} else {
							
							if(nickJ.test(dm_nickname)){
								// 0 : 아이디 길이 / 문자열 검사
								$("#nick_check").text("");
								$("#nick_check").css('margin-top', '0px');
								$("#reg_submit").attr("disabled", false);
					
							} else if(dm_nickname == ""){
								$('#nick_check').text('아이디를 입력해주세요 :)');
								$("#nick_check").css("margin-top", "-18px");
								$('#nick_check').css('color', 'red');
								$("#reg_submit").attr("disabled", true);				
								
							} else {
								$('#nick_check').text("아이디는 영어 소문자와 숫자 4~12자리만 가능합니다");
								$("#nick_check").css("margin-top", "-18px");
								$('#nick_check').css('color', 'red');
								$("#reg_submit").attr("disabled", true);
							}
							
						}
					}, error : function() {
							console.log("실패");
					}
				});
			}); */
		
		
	</script>
</body>
</html>
