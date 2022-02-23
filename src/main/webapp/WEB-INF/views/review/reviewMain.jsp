<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

div{

border: 1px solid red;
}

.flex-container{
display: flex;
justify-content: center;


}

.selector_unit{

border-radius: 2em;
padding: 5px;
margin-right: 5px;
border: 1px solid gray;


}

.section {
  overflow: hidden;
  transition: max-height 0.5s ease-out;
  height: auto;
  max-height: 600px;
}

.section.collapsed {
  max-height: 0;
}
.section2 {
  overflow: hidden;
  transition: max-height 0.5s ease-out;
  height: auto;
  max-height: 600px;
}

.section2.collapsed {
  max-height: 0;
}




</style>
<script type="text/javascript" src="resources/review/js/jquery.js"></script>
<script type="text/javascript" src="resources/review/js/review.js"></script>
<script type="text/javascript">
</script>
</head>
<body>


<div class="flex-container" >
<div class="selector_unit" id="toggle_membercount" value="1">#인원수</div>
<div class="selector_unit" value="2">#예산</div>
<div class="selector_unit"value="3">#테마</div>
<div class="selector_unit"value="4">#지역</div>

</div>

<!-- 인원수 선택 -->
<div class="section collapsible flex-container" style="text-align: center; visibility: hidden;">

<div>
인원수
<input type="range" id="headcount" min="1" max="10" value="1" step="1" >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
직접입력 : <input >명
</div>

</div>
<div class="section collapsible2 flex-container" style="text-align: center; visibility: hidden;">

<div>
aaaaa
<input type="range" id="headcount" min="1" max="10" value="1" step="1" >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
aaaa : <input >명
</div>

</div>
<div class="section collapsible3 flex-container" style="text-align: center; visibility: hidden;">

<div>
bbb
<input type="range" id="headcount" min="1" max="10" value="1" step="1"  >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
bbb : <input >명
</div>

</div>
<div class="section collapsible4 flex-container" style="text-align: center; visibility: hidden;">

<div>
ccc
<input type="range" id="headcount" min="1" max="10" value="1" step="1" >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
ccc : <input >명
</div>

</div>


<div class="flex-container">

<div >선택시 선택된목록표시창</div>
<div>선택해제</div>
<div>1인</div>
<div>20만원이하</div>
<div>맛집투어</div>
<div>서울</div>

</div>

<div >
<button>추천순</button>
<button>신규순</button>

<div class="flex-container">
<c:forEach items="${reviews }" var="reviews">
<div>
${reviews.rb_title }
${reviews.rb_date }
</div>
</c:forEach>

<div>
사진,제목,좋아요,뷰수,댓글수,작성일자, 작성자프사, 작성자 아이디, 검색키워드

</div>
<div>게시글표시2</div>
<div>게시글표시3</div>
</div>

</div>

<div class="flex-container">
<div> <a href="reviewWrite.go">후기쓰기</a> </div>
<div>내후기보기</div>
</div>

</body>
</html>