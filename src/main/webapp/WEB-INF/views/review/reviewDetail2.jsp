<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="resources/review/js/reviewDetail.js"></script>
<style>
.totalRoute_wrapper{

	margin-top: 20px;
	margin-bottom: 20px ;
	text-align: center;
}

.uninInfo_content{
margin-left: 10px;
margin-right: 10px;

}

.unitInfo{
	border: 2px solid transparent;
    border-radius: 20px;
    background-image: linear-gradient(#ffffff, #ffffff), linear-gradient(to bottom right, #38CEB5, #6D1E91);
    background-origin: border-box;
    background-clip: content-box, border-box;
	text-align: center;
	margin-right: 10px;
}

.content_wrapper{
	margin-top: 30px;
}
.titleBox{
	text-align: center;
	margin-bottom: 20px;
}

.totalReview{
	text-align: center;
}

.dailySelected{
	display: none;
}

.dailySelected.activate{
	display: block;
}


.daySelector_wrapper{
 width: 80%;
 text-align: center;
}

textarea{
	width: 100%;
	resize: none;
}

.dailyBox{
	display: none;
	text-align: center;
}

.dailyBox.activate{
	display: block;
}

.daily_schedule.active{

	background-color: red;
}

#daily_schedule_con{
width: 25%;
}

.axis{
	width: 15%;
}

.cell{
	width: 25%;
}

#schedule_inner_nav>a {
	border: 1px solid black;
}
/* Dropdown Button */
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: #3e8e41;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}

td, tr {
	border: 1px solid black;
}
/* div{
	border: 1px solid red;
} */



.flex-container {
	display: flex;
	justify-content: center;
}
</style>
<!-- <script type="text/javascript" src="resources/review/js/reviewWrite.js"></script> -->
<script type="text/javascript">
let map, infoWindow, marker, searchBox, input, poly;

let destination = [];

function initMap() {

	let coordinate	 = document.getElementById("coordinate").textContent;
	console.log(coordinate);
	let splitedcoordinate = coordinate.split("|");
	console.log(splitedcoordinate);
	console.log(splitedcoordinate[0]);
	let spilted = splitedcoordinate[0];
	let parsed = JSON.parse(spilted);
	console.log(parsed);
  map = new google.maps.Map(document.getElementById("map"), {
    center: parsed,
    zoom: 12,
  });

  //폴리라인 다시그리기

  let rootCoordinates = [];

  for (let index = 0; index < splitedcoordinate.length-1; index++) {
	  let each = splitedcoordinate[index];

	  let eachParsing = JSON.parse(each);

	  rootCoordinates.push(eachParsing);
	  
  }
  console.log(rootCoordinates);

   const rootPath = new google.maps.Polyline({
     path: rootCoordinates,
     geodesic: true,
     strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
   });

  rootPath.setMap(map);

  //폴리라인 끝
 
  //마커추가하기

  rootCoordinates.forEach(function(each,curIdx){

	let locationNum = curIdx+1;

	  const marker = new google.maps.Marker({
		position: each,
		map: map,
		label:'#'+locationNum,
	  });
  })
  
  
}

</script>
</head>

<body>

	<div class="content_wrapper">
		<div class="titleBox"> <h2>${result.rb_title}</h2> </div>

		<div class="flex-container">

			<div class="unitInfo">
				<div class="uninInfo_content">#인원 🏃 : ${result.rb_headNum} 명</div>
			</div>
			<div class="unitInfo">
				<div class="uninInfo_content">#비용 💸 : <fmt:formatNumber value="${result.rb_budget}" type="currency"></fmt:formatNumber> 이하</div>

			</div>

			<div class="unitInfo">
				<div class="uninInfo_content">#테마 🎨: ${result.rb_theme}</div>

			</div>

			<div class="unitInfo">
				<div class="uninInfo_content">#지역 🌏: ${result.rb_location}</div>
			</div>
			<div class="unitInfo">
				<div class="uninInfo_content">#여행일정 📅 : ${result.rb_totalday} 일</div>
			</div>

		</div>

			<span id="coordinate" style="display: none;"> ${result.rb_coordinate} </span>
			</div>
		</div>
		<div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">여행순서 표시 지도 🛬</div>
	<div id="map" style=" height: 400px; border: 2px solid #38CEB5;"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	 <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=places&v=weekly&region=KR&language=ko"
		async></script> 
		<div>
			<div class="totalRoute_wrapper">
			<div>총 여행 방문지</div>
			<c:set var="route" value="${result.rb_totalroute }"></c:set>
			<div><c:out value="${fn:replace(route,',','->') }"></c:out> </div>
		</div>
			
		<div> <div>후기사진</div>
				<!-- ,로 잘라낸 값을 imgArr에 저장 -->
				<c:set var="imgArr" value="${fn:split(result.rb_img, ',')}"></c:set>
				<c:forEach items="${imgArr}" var="img">
					<img class="img_box" src="resources/review/img/${img}" alt="이미지위치">
					
				</c:forEach>
			</div>
			
		</div>
	</div>
	
	<!-- The div element for the map -->
	
	


	<div id="schedule" style="display: flex;">
		<div style="width: 10%;  ">
			<a href="javascript:void(0);" onclick="veiwPrevDay(this)">&lt;-</a>
		</div>
		<div class="daySelector_wrapper" id="dayselWrap"></div>
		<div style="width: 10%;  ">
			<a href="javascript:void(0);" onclick="veiwNextDay(this)">-&gt;</a>
		</div>
		
	</div>
	<div class="dailyBox" id="day1" data-day="1" style="display: block;">
		일정표시 d1
		<div class="scehduleBox">
		${result.rb_d1Schedule}
		</div>
		<div class="dailyText">
		<div>1일차 간단후기</div>
		${result.rb_d1Text}
		</div>
	</div>
	<div class="dailyBox" id="day2" data-day="2">
		일정표시 d2
		<div class="scehduleBox">
			${result.rb_d2Schedule}
			</div>
			<div class="dailyText">
			<div>2일차 간단후기</div>
			${result.rb_d2Text}
			</div>
	</div>
	<div class="dailyBox"  id="day3" data-day="3">
		일정표시 d3
		<div class="scehduleBox">
			${result.rb_d3Schedule}
			</div>
			<div class="dailyText">
			<div>3일차 간단후기</div>
			${result.rb_d3Text}
			</div>
	</div>
	<div class="dailyBox" id="day4" data-day="4">
		일정표시 d4
		<div class="scehduleBox">
			${result.rb_d4Schedule}
			</div>
			<div class="dailyText">
			<div>4일차 간단후기</div>
			${result.rb_d4Text}
			</div>
	</div>
	<div class="dailyBox" id="day5" data-day="5">
		일정표시 d5
		<div class="scehduleBox">
			${result.rb_d5Schedule}
			</div>
			<div class="dailyText">
			<div>5일차 간단후기</div>
			${result.rb_d5Text}
			</div>
	</div>
	<div class="dailyBox" id="day6" data-day="6">
		일정표시 d6
		<div class="scehduleBox">
			${result.rb_d6Schedule}
			</div>
			<div class="dailyText">
			<div>6일차 간단후기</div>
			${result.rb_d6Text}
			</div>
	</div>
	<div class="dailyBox" id="day7" data-day="7">
		일정표시 d7
		<div class="scehduleBox">
			${result.rb_d7Schedule}
			</div>
			<div class="dailyText">
			<div>7일차 간단후기</div>
			${result.rb_d7Text}
			</div>
	</div>
	<div class="dailyBox" id="day8" data-day="8">
		일정표시 d8
		<div class="scehduleBox">
			${result.rb_d8Schedule}
			</div>
			<div class="dailyText">
			<div>8일차 간단후기</div>
			${result.rb_d8Text}
			</div>
	</div>
	<div class="dailyBox" id="day9" data-day="9">
		일정표시 d9
		<div class="scehduleBox">
			${result.rb_d9Schedule}
			</div>
			<div class="dailyText">
			<div>9일차 간단후기</div>
			${result.rb_d9Text}
			</div>
	</div>
	<div class="dailyBox" id="day10" data-day="10">
		일정표시 10
		<div class="scehduleBox">
			${result.rb_d10Schedule}
			</div>
			<div class="dailyText">
			<div>10일차 간단후기</div>
			${result.rb_d10Text}
			</div>
	</div>

	<div class="totalReview">총 후기

		<div>${result.rb_text}</div>
	</div>

	<input type="text" id="totalday" value="${result.rb_totalday}" hidden>



</body>

</html>