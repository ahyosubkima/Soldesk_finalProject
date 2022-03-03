<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#contentTable{
display: grid;
	grid-template-columns: 1fr 1fr 1fr;

}

.itsActive{
background-color: green;
}

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
.selected_btn{

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
  justify-content: center;
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
/* .tab-container__item.active {
  border-bottom: 2px solid #369fff;
} */
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
직접입력 : <input id="headcount_value1" value="1">명
</div>
<button id="headcount_select_btn">선택</button>


</div>
        </article>
        <article id="tab2" class="content-container__content">
          <div class="flex-container" style="text-align: center ;">
          <div class="budget_select_btn" id="budget1">~ 100,000</div>
          <div class="budget_select_btn" id="budget2">~ 300,000</div>
          <div class="budget_select_btn" id="budget3">~ 500,000</div>
          <div class="budget_select_btn" id="budget4">~ 700,000</div>
          <div class="budget_select_btn" id="budget5">~ 1,000,000</div>
          <div>
직접입력 : <input >명
</div>
<button class="selector_btn">선택</button>
          </div>
        </article>
        <article id="tab3" class="content-container__content">
           <div class="flex-container" style="text-align: center ;">
          <div class="theme_select_btn" id="theme1">커플여행</div>
          <div class="theme_select_btn" id="theme2">럭셔리여행</div>
          <div class="theme_select_btn" id="theme3">감성카페찾기</div>
          <div class="theme_select_btn" id="theme4">맛집투어</div>
          <div class="theme_select_btn" id="theme5">비즈니스여행</div>
          </div>
        </article>
        <article id="tab4" class="content-container__content">
          <div class="flex-container" style="text-align: center ;">
          <div class="location_select_btn" id="location1">서울</div>
          <div class="location_select_btn" id="location2">대전</div>
          <div class="location_select_btn" id="location3">대구</div>
          <div class="location_select_btn" id="location4">부산</div>
          <div class="location_select_btn" id="location5">인천</div>
          </div>
        </article>
      </section>
    </div>



<div class="flex-container"  >

<div id="selectCancel" onclick="cancelingSelect()">선택해제</div>
<div class="flex-container" id="choosedVal">
<div id="choosed_head" ></div>
<div id="choosedVal1"></div>
<div id="choosedVal2"></div>
<div id="choosedVal3"></div>

</div>
<h1>AJAX GET TEST</h1>
	Name: <input type="text" id="inputTitle"></input>
	<button id="ajaxCall">호출</button>
</div>

<div >
<button>추천순</button>
<button>신규순</button>

<div class="" id="contentTable">
<c:forEach items="${reviews }" var="reviews">
<div id="contents">
<div><img src="resources/img/sns.png"></div>
$ {reviews.rb_}
${reviews.rb_title }
${reviews.rb_date }
</div>
</c:forEach>

<div>
사진,제목,좋아요,뷰수,댓글수,작성일자, 작성자프사, 작성자 아이디, 검색키워드

</div>
<div id="name">게시글표시2</div>
<div>게시글표시3</div>
</div>

</div>

<div class="flex-container">
<div> <a href="reviewWrite.go">후기쓰기</a> </div>
<div>내후기보기</div>
</div>

</body>
</html>