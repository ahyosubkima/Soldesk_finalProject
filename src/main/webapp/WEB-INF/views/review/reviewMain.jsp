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


</style>
</head>
<body>


<div class="flex-container" >
<div>#인원수</div>
<div>#예산</div>
<div>#테마</div>
<div>#지역</div>

</div>

<div style="text-align: center;">숨겨진 선택창</div>

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