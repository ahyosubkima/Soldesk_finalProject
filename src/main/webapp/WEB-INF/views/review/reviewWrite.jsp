<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/review/js/jquery.js"></script>
<style>
.preview{

width: 200px;
height: 100px;

}

textarea{
	width: 100%;
	resize: none;
}

.dailyBox{
	display: none;
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
<script type="text/javascript" src="resources/review/js/reviewWrite.js"></script>
<script type="text/javascript">
let map, infoWindow, marker, searchBox, input, poly;

let destination = [];

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.555946, lng: 126.972317 },
    zoom: 12,
  });

  
 
  const service = new google.maps.places.PlacesService(map);
  //   // We add a DOM event here to show an alert if the DIV containing the
  //   // map is clicked.
  map.addListener('click', function(event) {
	console.log(event.placeId);

	if(event.placeId){

		service.getDetails({placeId: event.placeId}, function(place, status){
			console.log(place.name);

			//데스티네이션에 넣음
			destination.push(place.name);
			document.getElementById('allSchedule').innerHTML = destination.join('->');

			//서버제출용
 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);

		})
	}else{
		
		let lat =event.latLng.lat();
		let lng =event.latLng.lng();

		let latlng = {
    lat: parseFloat(lat),
    lng: parseFloat(lng),
  };
		
  const geocoder = new google.maps.Geocoder();

  geocoder
    .geocode({ location: latlng })
    .then((response) => {
		console.log(response.results[0].formatted_address);
		

		//데스티네이션에 넣음
		destination.push(response.results[0].formatted_address);
		document.getElementById('allSchedule').innerHTML = destination.join('->');

		 //서버제출용
		 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
	})
	}

  });




  infoWindow = new google.maps.InfoWindow();
  marker  = new google.maps.Marker();
 

  // 내위치 찾기

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
          infoWindow.setContent("나의 위치");
          infoWindow.open(map);
          marker.setPosition(pos);
          marker.setMap(map);
		  marker.addListener('click',function(){
			  marker.setMap(null);
		  })
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

  

  //장소검색시작
  input = document.getElementById('pac-input');
  searchBox = new google.maps.places.SearchBox(input);

  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
  });

  
  let searchMarkers = [];

  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();
	console.log(places);
    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    searchMarkers.forEach((marker) => {
      marker.setMap(null);
    });
    searchMarkers = [];

    // For each place, get the icon, name and location.
    const bounds = new google.maps.LatLngBounds();

    places.forEach((place) => {
      if (!place.geometry || !place.geometry.location) {
        console.log("Returned place contains no geometry");
        return;
      }

      const icon = {
        url: place.icon,
        size: new google.maps.Size(10, 10),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(10, 10),
      };

      // Create a marker for each place.
      searchMarkers.push(
      new google.maps.Marker({
          map,
          icon,
          title: place.name,
          position: place.geometry.location,
        })

		///////////////////////////////////////
      );


	


      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });

	//검색마커에 리스너 추가, 클릭가능하게
    searchMarkers.forEach((marker, curindx) => {
	 	//console.log(marker);
			console.log(curindx);
 	marker.addListener('click', function(){
		 console.log(this.title);

		 //데스티네이션에위치넣음
		 destination.push(this.title);
		 document.getElementById('allSchedule').innerHTML = destination.join('->');

		 //서버제출용
		 document.getElementsByName('totalRoute')[0].value = destination;
		console.log(document.getElementsByName('totalRoute')[0].value);
	 });
	 	marker.addListener('click', addLatLng);

      });

    map.fitBounds(bounds);
  });


//장소검색끝

//폴리라인 시작

//서버에 좌표보내기용변수
let coordinate = "";

poly = new google.maps.Polyline({
    strokeColor: "#000000",
    strokeOpacity: 1.0,
    strokeWeight: 3,
  });
  poly.setMap(map);
let markers =[];
marker = new google.maps.Marker();

  // add event listener for click event
  document.getElementById("remove-line").addEventListener("click", removeLine);
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(document.getElementById("remove-line"));

  //일정삭제 기능
  function removeLine() {
	  console.log(markers);
	  for (let i = 0; i < markers.length; i++) {
		  markers[i].setMap(null);
		}
		markers = [];
		destination = [];
		console.log(markers);
		poly.setMap(null);
		poly.getPath().clear();
		console.log(poly.getPath());
		console.log(destination);

		//div삭제

		document.querySelectorAll('.scehduleBox').forEach(function(eachBox){

			eachBox.innerHTML ="";

		})


		
		// 제출용 정보삭제
		document.getElementsByName('totalRoute')[0].value = "";

		document.querySelectorAll('.dScedule').forEach(function(each){
			console.log(each);
			each.value ="";
		})
		
		console.log(document.getElementById('coordinate'));
		document.getElementById('coordinate').value ="" ;
		
	}
 
  // Add a listener for the click event
 map.addListener("click", addLatLng);


// Handles click events on a map, and adds a new point to the Polyline.
function addLatLng(event) {
	poly.setMap(map);
  const path = poly.getPath();
	console.log(path);
	console.log(poly);
	console.log(event.latLng.lat());
	console.log(event.latLng.lng());


	coordinate += '{ "lat": '+event.latLng.lat()+', "lng": '+event.latLng.lng()+'} |';

	
	console.log(coordinate);
	document.getElementById('coordinate').value = coordinate;
  // Because path is an MVCArray, we can simply append a new coordinate
  // and it will automatically appear.
  path.push(event.latLng);
  //console.log(event.latLng);
  // Add a new marker at the new plotted point on the polyline.
  let destinationNum = path.getLength()-1;
   let dds =  new google.maps.Marker({
    position: event.latLng,
    title: "#" + path.getLength(),
    map: map,
	label: "#" + path.getLength(),
  });

  
  //우클릭시 일정에추가
  dds.addListener('rightclick',function(){
		  console.log(dds.title);
		  console.log(destination[destinationNum]);
		  
		  let rcdestination = dds.title+destination[destinationNum];

	let selectDay =	  document.querySelector('.daily_schedule.active').getAttribute('data-day');

	let dayfinder = 'day'+selectDay;

	let targetScedule = document.getElementById(dayfinder).querySelector('.scehduleBox');
	console.log(targetScedule);

	let newDiv = document.createElement('div');

	newDiv.setAttribute('id', 'scheduled'+ dds.title);
	newDiv.innerHTML = rcdestination;


	if(document.getElementById('scheduled'+ dds.title)){

		alert('이미 추가된 일정입니다.');
	}
	else{
	targetScedule.insertAdjacentElement('beforeend',newDiv);

	console.log(dayfinder);
	console.log(document.querySelector('input#'+dayfinder));
	document.querySelector('input#'+dayfinder).value += rcdestination+',';

}


})
markers.push(dds);
console.log(destination);

//   marker.setPosition(event.latLng);
//   marker.setTitle("#" + path.getLength());
//   marker.setMap(map);
//   marker.setLabel("#" + path.getLength());

//   markers.push(marker);
//   console.log(markers);
}

//폴리라인 끝

  

  
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
	<form name="form" action="/danim/reviewinsert.do" method="post" enctype="multipart/form-data">
	<div class="content_wrapper">
		<div>후기쓰기 페이지</div>

		<div><input type="text" name="title" placeholder="제목을 입력해주세요"></div>
			좌표히든<input type="text" name ="coordinate" id="coordinate" value="">

			<button>제출</button>

		

		
		<div class="flex-container">
					
			<div>
				<select name="headNum" id="selectBox">
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
					id="selectBoxDirect" name="selectBoxDirect" type="number"> 명
				</span>
			</div>

			<div>
				<select name="budget" id="selectBox2">
					<option selected="selected" disabled="disabled">비용</option>
					<option value="100000" >~ 100,000</option>
					<option value="300000">~ 300,000</option>
					<option value="500000">~ 500,000</option>
					<option value="700000">~ 700,000</option>
					<option value="1000000">~ 1,000,000</option>

				</select>

			</div>

			<div>
				<select name="theme" id="selectBox3">
					<option selected="selected" disabled="disabled">테마</option>
					<option>커플여행</option>
					<option>럭셔리여행</option>
					<option>감성카페찾기</option>
					<option>맛집투어</option>
					<option>비즈니스여행</option>

				</select>

			</div>

			<div>
				<select name="location" id="selectBox4">
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
		</div>

		

	</div>



	<h3>여행spot 지도</h3>
	<!-- The div element for the map -->
	 <input
      id="pac-input"
      class="controls"
      type="text"
      placeholder="Search Box"
	  style="width: 40%;"
    />
	<input id="remove-line" type="button" value="일정삭제" />

		<div id="map" style="height: 200px"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHwlLJC7x2AYE7IuJZCOkKJ1KRSBgCmoY&callback=initMap&libraries=places&v=weekly&region=KR&language=ko"
		async></script> 
<div id="allSchedule_wrapper"> 모든일정
<div id="allSchedule"></div>
</div>
	<div id="schedule">
		<div id="schedule_inner_nav" style="display: flex;" >
			<div style="width: 15%;  ">
				<!-- <a>모든경로보기</a> -->
				 <a href="javascript:void(0);" onclick="movePrevD()" id="prevbtn" >prev</a>
			</div>
			<div style="width: 10%; position: absolute; right: 0; ">
			<a href="javascript:void(0);" onclick="moveNextD()" id="nextbtn"> next</a>
			</div>
			<div id="daily_schedule_con" class="daily_schedule active" data-day="1"><div class="dropdown">
					<button type="button" onclick="" class="dropbtn">
						<img alt="" src="resources/review/img/plus-circle.svg">
					</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="javascript:void(0);" onclick="deleteDay(this)">일정
							삭제</a>
					</div>
				</div>
				<a href="javascript:void(0);" onclick="activateDay(this)"><span>day 1</span></a>
			</div>
		</div>
	</div>
	<div class="dailyBox" id="day1" data-day="1" style="display: block;">
		일정표시 d1
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d1Schedule" id="day1" value="">
		<textarea name="d1Text" id="d1Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day2" data-day="2">
		일정표시 d2
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d2Schedule" id="day2" value="">
		<textarea name="d2Text" id="d2Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox"  id="day3" data-day="3">
		일정표시 d3
		<div class="scehduleBox"></div> 
		<input class="dScedule" type="text" name="d3Schedule" id="day3" value="">
		<textarea name="d3Text" id="d3Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day4" data-day="4">
		일정표시 d4
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d4Schedule" id="day4" value="">
		<textarea name="d4Text" id="d4Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day5" data-day="5">
		일정표시 d5
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d5Schedule" id="day5" value="">
		<textarea name="d5Text" id="d5Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day6" data-day="6">
		일정표시 d6
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d6Schedule" id="day6" value="">
		<textarea name="d6Text" id="d6Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day7" data-day="7">
		일정표시 d7
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d7Schedule" id="day7" value="">
		<textarea name="d7Text" id="d7Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day8" data-day="8">
		일정표시 d8
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d8Schedule" id="day8" value="">
		<textarea name="d8Text" id="d8Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day9" data-day="9">
		일정표시 d9
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d9Schedule" id="day9" value="">
		<textarea name="d9Text" id="d9Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>
	<div class="dailyBox" id="day10" data-day="10">
		일정표시 10
		<div class="scehduleBox"></div>
		<input class="dScedule" type="text" name="d10Schedule" id="day10" value="">
		<textarea name="d10Text" id="d10Text" cols="30" rows="10" maxlength="200"></textarea>
	</div>

<div>여행총후기<p><textarea name="totalText" id="totalText" cols="30" rows="10" maxlength="499"></textarea></div>
	
		<div>전체경로히든<input type="text" name="totalRoute" id="" value="">
		작성자히든<input type="text" name="writer" id="writer" value="${param.writer}"></div>

	<!-- 총 여행사진 -->
	<div id="d1Img_container"></div>
	<input type="file" multiple="multiple" name="d1Img" id="d1Img" onchange="showPreview(event);">
	<input type="text" name="totalday" id="totalday" value="1"> 히든토탈데이

</form>

</body>

</html>