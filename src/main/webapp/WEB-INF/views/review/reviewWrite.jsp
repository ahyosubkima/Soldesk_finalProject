<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/review/js/jquery.js"></script>
<script type="text/javascript" src="resources/review/js/review.js"></script>
</head>
<body>

<div>후기 쓰기 페이지</div>

<div>
<div>
인원수
<input type="range" id="headcount" min="1" max="10" step="1" oninput="rangeout.value=this.value" >

</div>

 <input type='button'
         value='createDiv'
         onclick='createDiv()'/>
         
         <div id="dailyDummy" style="border: 1px solid;">
         aa
         </div>
         
         <div id="dailyDetail"></div>

<div style="margin-top:40px; margin-left:40px;" class="content">
        <div style="display: flex;">
            <h1 style="width: 150px; margin-right:30px;">태그 입력</h1>
            <input type="text" id="tag" size="20" placeholder="태그입력" />
        </div>

        <ul id="tag-list">
        </ul>

    </div>
</div>



</body>
</html>