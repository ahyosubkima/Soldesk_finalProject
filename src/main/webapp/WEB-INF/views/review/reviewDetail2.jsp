<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="resources/review/js/jquery.js"></script> -->
<style>
textarea{
	width: 100%;
	resize: none;
}

.dailyBox{
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

div {
	border: 1px solid red;
}

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

//   const flightPlanCoordinates = [
//     { lat: 37.772, lng: -122.214 },
//     { lat: 21.291, lng: -157.821 },
//     { lat: -18.142, lng: 178.431 },
//     { lat: -27.467, lng: 153.027 },
//   ];
   const rootPath = new google.maps.Polyline({
     path: rootCoordinates,
     geodesic: true,
     strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
   });

  rootPath.setMap(map);
 
  //마커추가하기

  rootCoordinates.forEach(function(each,curIdx){

	let locationNum = curIdx+1;

	  const marker = new google.maps.Marker({
		position: each,
		map: map,
		label:'#'+locationNum,
	  });
  })
  
 
 // const service = new google.maps.places.PlacesService(map);
  //   // We add a DOM event here to show an alert if the DIV containing the
  //   // map is clicked.

 // infoWindow = new google.maps.InfoWindow();
 // marker  = new google.maps.Marker();
 

  // 내위치 찾기

  

  //장소검색시작
 
//장소검색끝

//폴리라인 시작

// poly = new google.maps.Polyline({
//     strokeColor: "#000000",
//     strokeOpacity: 1.0,
//     strokeWeight: 3,
//   });
//   poly.setMap(map);
// let markers =[];
// marker = new google.maps.Marker();

  // add event listener for click event
 

// Handles click events on a map, and adds a new point to the Polyline.

//폴리라인 끝

  

  
}

</script>
</head>

<body>

	<div class="content_wrapper">
		<div> Title : ${result.rb_title} </div>

		<div class="flex-container">

			<div>
				인원 : ${result.rb_headNum}
			</div>
			<div>
				비용 : ${result.rb_budget} 이하

			</div>

			<div>
				테마 : ${result.rb_theme}

			</div>

			<div>
				지역 : ${result.rb_location}
			</div>

		</div>

		<div class="flex-container">
			<span id="coordinate"> ${result.rb_coordinate} </div>
			<div id="dailyContainer" style="display: flex;">
				<div id="dailyContent">
					데이(변수) <span id="dailyAddBtn"> <img alt=""
						src="resources/review/img/plus-circle.svg"></span>
					

				</div>
			</div>
			<div>화살표&gt;</div>
		</div>

		<div>경로표시 지도</div>
		<div>
			요약페이지
			<div>경로</div>
			<div>비용</div>
			<div>후기</div>

		</div>
		<div>댓글</div>

	</div>



	<h3>My Google Maps Demo</h3>
	<!-- The div element for the map -->
	
	<div id="map" style="height: 200px"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	 <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=places&v=weekly&region=KR&language=ko"
		async></script> 


	<div id="schedule">
		<!-- <div id="schedule_inner_nav" style="display: flex;" >
			<div style="width: 15%;  ">
				<a>모든경로보기</a> <a href="javascript:void(0);" onclick="movePrevD()" id="prevbtn" da>prev</a>
			</div>
			<div style="width: 10%; position: absolute; right: 0; ">
			<a href="javascript:void(0);" onclick="moveNextD()" id="nextbtn"> next</a>
			</div>
			<div id="daily_schedule_con" class="daily_schedule active" data-day="1"><div class="dropdown">
					<button onclick="" class="dropbtn">
						<img alt="" src="resources/review/img/plus-circle.svg">
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="javascript:void(0);" onclick="deleteDay(this)">일정
							삭제</a>
					</div>
				</div>
				<a href="javascript:void(0);" onclick="activateDay(this)"><span>day 1</span></a>
			</div>
		</div> -->
	</div>
	<div class="dailyBox" id="day1" data-day="1" style="display: block;">
		일정표시 d1
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day2" data-day="2">
		일정표시 d2
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox"  id="day3" data-day="3">
		일정표시 d3
		<div class="scehduleBox"></div> 
		<input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day4" data-day="4">
		일정표시 d4
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day5" data-day="5">
		일정표시 d5
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day6" data-day="6">
		일정표시 d6
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day7" data-day="7">
		일정표시 d7
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day8" data-day="8">
		일정표시 d8
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day9" data-day="9">
		일정표시 d9
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>
	<div class="dailyBox" id="day10" data-day="10">
		일정표시 10
		<div class="scehduleBox"></div>
		 <input type="file" multiple="multiple">
		<textarea name="" id="" cols="30" rows="10"></textarea>
	</div>



</body>

</html>