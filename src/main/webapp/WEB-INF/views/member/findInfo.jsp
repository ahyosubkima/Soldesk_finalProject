<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다님 :: 회원 정보 찾기</title>
<script type="text/javascript" src="resources/asset/index/js/jquery.js"></script>
</head>
<body>
<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
			<div id="searchI">
				<div class="form-group">
						<h3>가입하실때 입력한 이메일을 입력해주세요</h3>
						<label class="font-weight-bold text-white" for="dm_email">이메일</label>
						<div>
							
							<input type="text" class="form-control" id="dm_email1" name="dm_email">
							<div class="check_fnt" id="mail_check"></div>
						</div>
					</div>
				
					<div class="form-group">
						<button id="idSearchBtn"  class="btn btn-primary btn-block">확인</button>
					</div>
				</div>
			</div>
				
				<div id="searchP" style="display: none;">
					<div class="form-group">
					<h3>가입하실때 입력한 아이디와 이메일을 입력해주세요</h3>
						<label class="font-weight-bold text-white" for="dm_id">아이디</label>
						<div>
							<input type="text" class="form-control" id="dm_id" name="dm_id">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="dm_email">이메일</label>
						<div>
							<input type="email" class="form-control" id="dm_email2"	name="dm_email">
						</div>
					</div>
					<div class="form-group">
						<button id="pwSearchBtn" class="btn btn-primary btn-block">확인</button>
					</div>
				</div>
			</div>
	</div>
	
	<script type="text/javascript" src="resources/asset/index/js/find.js"></script>
	
</body>
</html>