<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{

border: 1px solid red;
}

.flex-container{
display: flex;
justify-content: center;


}


#
</style>
<script type="text/javascript" src="resources/review/js/reviewWrite.js"></script>
</head>

<body>

<div class="content_wrapper">
<div> 후기쓰기 페이지</div>

<div class="flex-container">

<div> 
<select id="selectBox">
<option selected="selected" disabled="disabled">인원</option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
<option>9</option>
<option>10</option>
<option value="direct">직접입력</option>

</select> 
<span id="inputContainer" style="display: none;">
<input id="selectBoxDirect" name="selectBoxDirect" > 명
</span>
</div>

<div>
<select id="selectBox2">
<option selected="selected" disabled="disabled">비용</option>
<option>~ 100,000</option>
<option>~ 300,000</option>
<option>~ 500,000</option>
<option>~ 700,000</option>
<option>~ 1,000,000</option>

</select> 

</div>

<div>
<select id="selectBox3">
<option selected="selected" disabled="disabled">테마</option>
<option>커플여행</option>
<option>럭셔리여행</option>
<option>감성카페찾기</option>
<option>맛집투어</option>
<option>비즈니스여행</option>

</select> 

</div>

<div>
<select id="selectBox4">
<option selected="selected" disabled="disabled">지역</option>
<option>서울</option>
<option>대전</option>
<option>대구</option>
<option>부산</option>
<option>인천</option>

</select> 

</div>

 </div>

<div class="flex-container">
<div>화살표&lt;</div>
<div id="dailyContainer" style="display: flex;">
<div id="dailyContent">
데이(변수) <span id="dailyAddBtn"> <img alt="" src="resources/review/img/plus-circle.svg"></span>
<div>
일정표시
</div>

</div>
</div>
<div>화살표&gt;</div>
</div>

<div> 경로표시 지도</div>
<div>
 요약페이지
<div>경로</div>
<div>비용</div>
<div>후기</div>

</div>
<div>댓글</div>

</div>



</body>
</html>