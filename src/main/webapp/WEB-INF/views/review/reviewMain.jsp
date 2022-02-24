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

.selector_btn{

border-radius: 2em;
padding: 5px;
margin-right: 5px;
border: 1px solid gray;


}
.selector_unit{

border-radius: 2em;
padding: 5px;
margin-right: 5px;
border: 1px solid gray;


}

.bb {
  transition: max-height 0.5s ease-out;
	height: 0;
  max-height: 0;
  overflow: hidden;
}

.aa {
  max-height: 600px;
}


ul,
li {
  margin: 0;
  padding: 0;
  list-style: none;
}
.container {
  margin: 0 auto;
}
.tab-container {
  display: flex;
}
.tab-container__item {
  cursor: pointer;
}
.tab-container__item:hover {
  background-color: #369fff;
  transition: background-color 0.4s ease-in-out;
}
.tab-container__item:hover .tab-container__item--title {
  color: #fff;
  transition: color 0.4s ease-in-out;
}
.tab-container__item.active {
  border-bottom: 2px solid #369fff;
}
.tab-container__item.active .tab-container__item--title {
  color: #369fff;
}
.tab-container__item.active:hover {
  background-color: #369fff;
  transition: background-color 0.4s ease-in-out;
}
.tab-container__item.active:hover .tab-container__item--title {
  color: #fff;
  transition: color 0.4s ease-in-out;
}
.tab-container__item--title {
  display: inline-block;
  color: #999;
  font-weight: 700;
  text-decoration: none;
  margin: 15px;
}
.content-container {
  padding: 10px;
}
.content-container__content {
  display: none;
}
.content-container__content.target {
  display: block;
}

</style>
<script type="text/javascript" src="resources/review/js/jquery.js"></script>
<script type="text/javascript" src="resources/review/js/review.js"></script>
<script type="text/javascript">
</script>
</head>
<body>


<div class="flex-container" >
<div class="selector_unit" id="toggle_membercount">#인원수</div>
<div class="selector_unit" >#예산</div>
<div class="selector_unit">#테마</div>
<div class="selector_unit">#지역</div>

</div>

<!-- 인원수 선택 -->
<!-- <div class="aa flex-container bb" style="text-align: center ;" id="qqq">

<div>
인원수
<input type="range" id="headcount" min="1" max="10" value="1" step="1" >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
직접입력 : <input >명
</div>

</div> -->

 <div class="container">
      <ul class="tab-container">
        <li class="tab-container__item active" data-tab="tab1">
        <div class="selector_unit" >#인원수</div>
        </li>
        <li class="tab-container__item" data-tab="tab2">
          <div class="selector_unit" >#예산</div>
        </li>
        <li class="tab-container__item" data-tab="tab3">
          <div class="selector_unit" >#테마</div>
        </li>
        <li class="tab-container__item" data-tab="tab4">
          <div class="selector_unit" >#지역</div>
        </li>
      </ul>
     
      <section class="content-container">
        <article id="tab1" class="content-container__content">
         <div class="flex-container" style="text-align: center ;">
<div>
인원수
<input type="range" id="headcount" min="1" max="10" value="1" step="1" >
  <span id="headcount_value"></span><span>명</span>
</div>

<div>
직접입력 : <input >명
</div>

</div>
        </article>
        <article id="tab2" class="content-container__content">
          <div class="flex-container" style="text-align: center ;">
          <div class="selector_btn" >예산1</div>
          <div class="selector_btn" >예산2</div>
          <div class="selector_btn" >예산3</div>
          <div class="selector_btn" >예산4</div>
          <div class="selector_btn" >예산5</div>
          <div>
직접입력 : <input >명
</div>
          </div>
        </article>
        <article id="tab3" class="content-container__content">
           <div class="flex-container" style="text-align: center ;">
          <div class="selector_btn" >테마1</div>
          <div class="selector_btn" >테마2</div>
          <div class="selector_btn" >테마3</div>
          <div class="selector_btn" >테마4</div>
          <div class="selector_btn" >테마5</div>
          </div>
        </article>
        <article id="tab4" class="content-container__content">
          <div class="flex-container" style="text-align: center ;">
          <div class="selector_btn" >지역1</div>
          <div class="selector_btn" >지역2</div>
          <div class="selector_btn" >지역3</div>
          <div class="selector_btn" >지역4</div>
          <div class="selector_btn" >지역5</div>
          </div>
        </article>
      </section>
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