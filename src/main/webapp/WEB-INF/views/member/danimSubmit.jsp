<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form action="account.join" method="post" enctype="multipart/form-data"
		name="registerForm">
		<div class="row_group">
			<div class="register_row">
				<h3 class="register_title">
					<label for="input_id">아이디</label> 
				</h3>
				<input type="text" class="input_id" name="dm_id"
					id="input_id" maxlength="20">
			</div>
			<div class="register_row">
				<h3 class="register_title">
					<label for="input_pw">비밀번호</label> 
				</h3>
				<input type="text" class="input_pw" name="dm_pw"
					id="input_pw" maxlength="20">
			</div>
			<div class="register_row">
				<h3 class="register_title">
					<label for="input_pw2">비밀번호 확인</label> 
				</h3>
				<input type="text" class="input_pw2" name="dm_id"
					id="input_pw2" maxlength="20">
			</div>
		</div>
		<div class="row_group">
			<div class="register_row">
				<h3 class="register_title">
					<label for="input_name">이름</label> 
				</h3>
				<input type="text" class="input_name" name="dm_name"
					id="input_name" maxlength="20">
			</div>
			<div class="register_row">
				<h3 class="register_title">
					<label for="input_nick">닉네임</label> 
				</h3>
				<input type="text" class="input_nick" name="dm_nickname"
					id="input_nick" maxlength="20">
			</div>
		</div>


	</form>
</body>
</html>