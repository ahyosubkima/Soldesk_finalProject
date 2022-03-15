<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<script type="text/javascript" src="resources/review/js/reviewWrite.js"></script>
<script type="text/javascript">
let map, infoWindow, marker;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 6,
  });
  infoWindow = new google.maps.InfoWindow();
  marker  = new google.maps.Marker();

  const locationButton = document.createElement("button");

  locationButton.textContent = "현재위치로";
  locationButton.classList.add("custom-map-control-button");
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
  locationButton.addEventListener("click", () => {
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
        	console.log(position);
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };

          infoWindow.setPosition(pos);
          infoWindow.setContent("Location found.");
          infoWindow.open(map);
          marker.setPosition(pos);
          marker.setMap(map);
          map.setCenter(pos);
          map.setZoom(12);
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

</script>
</head>

<body>

	<div class="content_wrapper">
		<div>후기쓰기 페이지</div>

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

				</select> <span id="inputContainer" style="display: none;"> <input
					id="selectBoxDirect" name="selectBoxDirect"> 명
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
					데이(변수) <span id="dailyAddBtn"> <img alt=""
						src="resources/review/img/plus-circle.svg"></span>
					<div>
						일정표시 <input type="file" multiple="multiple">
					</div>

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



	<!-- <h3>My Google Maps Demo</h3>
	The div element for the map
	<div id="map" style="height: 200px"></div>

	Async script executes immediately and must be after any DOM elements used in callback.
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=&v=weekly&region=KR&language=ko"
		async></script> -->


	<div id="schedule">
		<div id="schedule_inner_nav" style="display: flex;" >
			<div style="width: 15%;  ">
				<a>모든경로보기</a> <a>prev</a>
			</div>
			<div id="daily_schedule_con" >
				<div class="dropdown">
					<button onclick="" class="dropbtn">
						<img alt="" src="resources/review/img/plus-circle.svg">
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="javascript:void(0);" onclick="createSchedule(this)">앞에 일정추가</a> <a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="#">일정
							삭제</a>
					</div>
				</div>
				<a href="#"><span>day 1</span></a>
			</div>
			<!-- <div id="daily_schedule_con"  >
				<div class="dropdown">
					<button onclick="doDropdown()" class="dropbtn">
						<img alt="" src="resources/review/img/plus-circle.svg">
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="#">앞에 일정추가</a> <a href="#">앞에 일정추가</a> <a href="#">일정
							삭제</a>
					</div>
				</div>
				<a href="#"><span>day 1</span></a>
			</div>
			<div id="daily_schedule_con" >
				<div class="dropdown">
					<button onclick="doDropdown()" class="dropbtn">
						<img alt="" src="resources/review/img/plus-circle.svg">
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="#">앞에 일정추가</a> <a href="#">앞에 일정추가</a> <a href="#">일정
							삭제</a>
					</div>
				</div>
				<a href="#"><span>day 1</span></a>
			</div> -->
			<div style="width: 10%; position: absolute; right: 0; ">
			<a> next</a>
			</div>
		</div>
	</div>


	<div class="weekcalendar" style="height: 700px;">
		<table style="width: 100%; height: 100%; border-spacing: 0;">
			<tbody>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">00:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
					<td id="schedule-1-2" class="cell"></td>
					<td id="schedule-2-2" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">01:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">02:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">03:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
					<td id="schedule-1-2" class="cell"></td>
					<td id="schedule-2-2" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
					<td id="schedule-1-11" class="cell"></td>
					<td id="schedule-2-11" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">04:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
					<td id="schedule-1-2" class="cell"></td>
					<td id="schedule-2-2" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
					<td id="schedule-1-11" class="cell"></td>
					<td id="schedule-2-11" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">05:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
					<td id="schedule-1-2" class="cell"></td>
					<td id="schedule-2-2" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
					<td id="schedule-1-11" class="cell"></td>
					<td id="schedule-2-11" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">06:00
							AM</span></td>
					<td id="schedule-0-0" class="cell active"></td>
					<td id="schedule-1-0" class="cell"></td>
					<td id="schedule-2-0" class="cell">
						<!-- <div
							class="ui-widget-content ui-resizable event event-category-0 ui-draggable ui-draggable-handle"
							style="overflow: visible; position: absolute; width: 275px; height: 121px; margin: 2px 0 0 5px;">
							<a class="delete"></a><i class="more-data"></i>
							<div
								style="overflow: hidden; position: relative; width: 100%; height: 100%;">
								<div class="ev-info-wrap">
									<div class="ev-info-content event-category-0">
										<div class="ev-info-header event-category-0">
											<div class="ev-name ev-spot-type-00">
												<a class="ev-spot-name">인천국제공항 (Incheon International
													Airport, ICN)</a><span class="lower">인천공항 제1여객터미널</span>
											</div>
										</div>
										<div class="ev-more">
											<span class="note_count_text">0</span>
										</div>
									</div>
								</div>
								<div class="edit-height"></div>
								<a class="sort-tooltip" data-container="body"
									data-original-title="명소 박스를 누르면 좌측 명소리스트가 거리순으로 정렬됩니다."><i
									class="fa fa-info-circle"></i></a>
							</div>
							<div class="ui-resizable-handle ui-resizable-s"
								style="z-index: 90;"></div>
						</div> -->
					</td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-1" class="cell active"></td>
					<td id="schedule-1-1" class="cell"></td>
					<td id="schedule-2-1" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">07:00</span></td>
					<td id="schedule-0-2" class="cell active"></td>
					<td id="schedule-1-2" class="cell"></td>
					<td id="schedule-2-2" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-3" class="cell active"></td>
					<td id="schedule-1-3" class="cell"></td>
					<td id="schedule-2-3" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">08:00</span></td>
					<td id="schedule-0-4" class="cell active"></td>
					<td id="schedule-1-4" class="cell"></td>
					<td id="schedule-2-4" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-5" class="cell active"></td>
					<td id="schedule-1-5" class="cell"></td>
					<td id="schedule-2-5" class="cell">
						<!-- <div
							class="btn-direction direction-button-view">
							<span class="distance">438.27km</span>
							<div class="direction-a">
								<div class="arrow-line" style="height: 69px"></div>
								<div class="arrow-tri"></div>
							</div>
							<a id="search_directions_btn" data-id="schedule-2-5"><span>길찾기</span></a>
						</div> -->
					</td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">09:00</span></td>
					<td id="schedule-0-6" class="cell active"></td>
					<td id="schedule-1-6" class="cell"></td>
					<td id="schedule-2-6" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-7" class="cell active"></td>
					<td id="schedule-1-7" class="cell"></td>
					<td id="schedule-2-7" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">10:00</span></td>
					<td id="schedule-0-8" class="cell active"></td>
					<td id="schedule-1-8" class="cell"></td>
					<td id="schedule-2-8" class="cell">
						<!-- <div
							class="ui-widget-content ui-resizable event event-category-0 ui-draggable ui-draggable-handle"
							style="overflow: visible; position: absolute; width: 275px; height: 146px; margin: 2px 0 0 5px;">
							<a class="delete"></a><i class="more-data"></i>
							<div
								style="overflow: hidden; position: relative; width: 100%; height: 100%;">
								<div class="ev-info-wrap">
									<div class="ev-info-content event-category-0">
										<div class="ev-info-header event-category-0">
											<div class="ev-name ev-spot-type-00">
												<a class="ev-spot-name">제주국제공항 (Jeju International
													Airport)</a><span class="lower">제주도의 관문</span>
											</div>
										</div>
										<div class="ev-more">
											<span class="note_count_text">0</span>
										</div>
									</div>
								</div>
								<div class="edit-height"></div>
								<a class="sort-tooltip" data-container="body"
									data-original-title="명소 박스를 누르면 좌측 명소리스트가 거리순으로 정렬됩니다."><i
									class="fa fa-info-circle"></i></a>
							</div>
							<div class="ui-resizable-handle ui-resizable-s"
								style="z-index: 90;"></div>
						</div> -->
					</td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-9" class="cell active"></td>
					<td id="schedule-1-9" class="cell"></td>
					<td id="schedule-2-9" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">11:00</span></td>
					<td id="schedule-0-10" class="cell active"></td>
					<td id="schedule-1-10" class="cell"></td>
					<td id="schedule-2-10" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-11" class="cell active"></td>
					<td id="schedule-1-11" class="cell"></td>
					<td id="schedule-2-11" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">12:00
							PM</span></td>
					<td id="schedule-0-12" class="cell active"></td>
					<td id="schedule-1-12" class="cell"></td>
					<td id="schedule-2-12" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-13" class="cell active"></td>
					<td id="schedule-1-13" class="cell"></td>
					<td id="schedule-2-13" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">01:00</span></td>
					<td id="schedule-0-14" class="cell active"></td>
					<td id="schedule-1-14" class="cell"></td>
					<td id="schedule-2-14" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-15" class="cell active"></td>
					<td id="schedule-1-15" class="cell"></td>
					<td id="schedule-2-15" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">02:00</span></td>
					<td id="schedule-0-16" class="cell active"></td>
					<td id="schedule-1-16" class="cell"></td>
					<td id="schedule-2-16" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-17" class="cell active"></td>
					<td id="schedule-1-17" class="cell"></td>
					<td id="schedule-2-17" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">03:00</span></td>
					<td id="schedule-0-18" class="cell active"></td>
					<td id="schedule-1-18" class="cell"></td>
					<td id="schedule-2-18" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-19" class="cell active"></td>
					<td id="schedule-1-19" class="cell"></td>
					<td id="schedule-2-19" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">04:00</span></td>
					<td id="schedule-0-20" class="cell active"></td>
					<td id="schedule-1-20" class="cell"></td>
					<td id="schedule-2-20" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-21" class="cell active"></td>
					<td id="schedule-1-21" class="cell"></td>
					<td id="schedule-2-21" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">05:00</span></td>
					<td id="schedule-0-22" class="cell active"></td>
					<td id="schedule-1-22" class="cell"></td>
					<td id="schedule-2-22" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-23" class="cell active"></td>
					<td id="schedule-1-23" class="cell"></td>
					<td id="schedule-2-23" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">06:00</span></td>
					<td id="schedule-0-24" class="cell active"></td>
					<td id="schedule-1-24" class="cell"></td>
					<td id="schedule-2-24" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-25" class="cell active"></td>
					<td id="schedule-1-25" class="cell"></td>
					<td id="schedule-2-25" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">07:00</span></td>
					<td id="schedule-0-26" class="cell active"></td>
					<td id="schedule-1-26" class="cell"></td>
					<td id="schedule-2-26" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-27" class="cell active"></td>
					<td id="schedule-1-27" class="cell"></td>
					<td id="schedule-2-27" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">08:00</span></td>
					<td id="schedule-0-28" class="cell active"></td>
					<td id="schedule-1-28" class="cell"></td>
					<td id="schedule-2-28" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-29" class="cell active"></td>
					<td id="schedule-1-29" class="cell"></td>
					<td id="schedule-2-29" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">09:00</span></td>
					<td id="schedule-0-30" class="cell active"></td>
					<td id="schedule-1-30" class="cell"></td>
					<td id="schedule-2-30" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-31" class="cell active"></td>
					<td id="schedule-1-31" class="cell"></td>
					<td id="schedule-2-31" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">10:00</span></td>
					<td id="schedule-0-32" class="cell active"></td>
					<td id="schedule-1-32" class="cell"></td>
					<td id="schedule-2-32" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-33" class="cell active"></td>
					<td id="schedule-1-33" class="cell"></td>
					<td id="schedule-2-33" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">11:00</span></td>
					<td id="schedule-0-34" class="cell active"></td>
					<td id="schedule-1-34" class="cell"></td>
					<td id="schedule-2-34" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-35" class="cell active"></td>
					<td id="schedule-1-35" class="cell"></td>
					<td id="schedule-2-35" class="cell"></td>
				</tr>
				<tr>
					<td class="axis" rowspan="2"><span class="time-label">12:00
							AM</span></td>
					<td id="schedule-0-36" class="cell active"></td>
					<td id="schedule-1-36" class="cell"></td>
					<td id="schedule-2-36" class="cell"></td>
				</tr>
				<tr>
					<td class="hidden"></td>
					<td id="schedule-0-37" class="cell active"></td>
					<td id="schedule-1-37" class="cell"></td>
					<td id="schedule-2-37" class="cell"></td>
				</tr>
			</tbody>
		</table>
	</div>


</body>

</html>