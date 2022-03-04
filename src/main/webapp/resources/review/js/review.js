/**
 * 
 */


 let rb_budget = "";
 let rb_theme = "";
 let rb_location = "";
 let rb_headNum = "";

// js준비
document.addEventListener('DOMContentLoaded', function () {


  

  document.querySelectorAll('.budget_select_btn, .theme_select_btn, .location_select_btn').forEach(function(target,curin) {


    //console.log(target,curin);

    target.addEventListener('click',function(){

      console.log('체에크');

      if(target.classList.contains('itsActive')){

        target.classList.remove('itsActive')


        if(target.classList.contains('budget_select_btn')){
          rb_budget ="";
       //  console.log(document.getElementById('choosedVal').querySelector('.budget_selected_btn'));
        // document.getElementById('choosedVal').querySelector('.budget_selected_btn').remove();
        // document.getElementById('choosedVal').querySelector('.budget_selected_btn').remove();

        }else if(target.classList.contains('theme_select_btn')){
          rb_theme ="";
        }else if(target.classList.contains('location_select_btn')){
          rb_location ="";
          document.getElementById('choosedVal').querySelector('.location_selected_btn').remove();
        }
        callAjax();
      }else{
         if(this.classList.contains('budget_select_btn')){
  let budgetsActive = document.getElementById('tab2').querySelectorAll('.itsActive');

  for(let i of budgetsActive){
    i.classList.remove('itsActive');
  }
}
else if(this.classList.contains('theme_select_btn')){
  let themesActive = document.getElementById('tab3').querySelectorAll('.itsActive');

  for(let i of themesActive){
    i.classList.remove('itsActive');
  }
}
else if(this.classList.contains('location_select_btn')){
  let locationsActive = document.getElementById('tab4').querySelectorAll('.itsActive');

  for(let i of locationsActive){
    i.classList.remove('itsActive');
  }
}

        target.classList.add('itsActive');
      
 document.querySelectorAll('.itsActive').forEach(function(db){

  console.log(db.classList.contains('location_select_btn'));

  


  if(db.classList.contains('location_select_btn')){
    
    rb_location = db.textContent;
    console.log(rb_location);

    let idVal = db.getAttribute('id');
    let word = rb_location;
    let newDiv = document.createElement('div');
    newDiv.classList.add('location_selected_btn')
    newDiv.append(word);
    newDiv.insertAdjacentHTML('beforeend', '<span class="deleteBtn">삭제버튼</span>');

    if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length == 0 && idVal.indexOf('location')==0){


         document.getElementById('choosedVal').appendChild(newDiv);
      
      
       }else if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length  >= 1 && idVal.indexOf('location')==0){
      
         document.querySelector('.location_selected_btn').remove();
      
         document.getElementById('choosedVal').appendChild(newDiv);
       }

    //document.getElementById('choosedVal').appendChild(newDiv);

  }else if(db.classList.contains('budget_select_btn')){
    //rb_budget = db.textContent;
    //console.log(db.textContent.substring(2, db.textContent.length));
    let delComma = db.textContent.replaceAll(",","");
    console.log(delComma);
    rb_budget =delComma.substring(2, db.textContent.length);
  }else if(db.classList.contains('theme_select_btn')){
    rb_theme = db.textContent;
  }

 
 

 });

 console.log(rb_budget,rb_location,rb_theme)
 callAjax();
//  let bbs= Array.from(document.querySelectorAll('.itsActive'));

//  console.log(bbs);


      }


})
});
    

  

	/* button이 클릭되었을때 이벤트 */
	document.getElementById("ajaxCall").addEventListener('click', () => {
		/* textBox에 작성된 name 데이터를 가져옴 */
		var inputTitle = document.getElementById("inputTitle").value;
		/* 통신에 사용 될 XMLHttpRequest 객체 정의 */
		httpRequest = new XMLHttpRequest();
		/* httpRequest의 readyState가 변화했을때 함수 실행 */
	    httpRequest.onreadystatechange = function() {
	    	/* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 */
		    if (httpRequest.readyState === XMLHttpRequest.DONE) {
			      if (httpRequest.status === 200) {
			    	var result = httpRequest.response;
            console.log(result);
            console.log(result.reviewTitles[0].rb_title);
            //let df = JSON.parse(result).rb_title
             // console.log(df);
            

			        // document.getElementById("name").innerText = result.rb_title;
			        // document.getElementById("age").innerText = result.age;
			      } else {
			        alert('Request Error!');
			      }
		    }
	    };
	    /* Get 방식으로 name 파라미터와 함께 요청 */
	    httpRequest.open('GET', 'http://localhost/danim/getTitleByJSON?rb_title=' + inputTitle);
	    /* Response Type을 Json으로 사전 정의 */
	    httpRequest.responseType = "json";
	    /* 정의된 서버에 요청을 전송 */
	    httpRequest.send();
	});

	  //인원수 슬라이더 value표시
let slider = document.getElementById("headcount");
let output = document.getElementById("headcount_value");

//output.innerHTML = slider.value;


slider.oninput = function() {
    output.innerHTML = this.value;
    document.getElementById("headcount_value1").value = this.value;

   // document.getElementById("choosed_head").innerHTML = this.value +'명';
    

}

document.getElementById('headcount_select_btn').addEventListener('click',function(){

  

let newDiv = document.createElement('div')
newDiv.append(document.getElementById('headcount_value1').value +'명');
newDiv.classList.add('selected_headcount');
newDiv.insertAdjacentHTML('beforeend', '<span class="deleteBtn">삭제버튼</span>');

console.log(document.getElementById('choosedVal').querySelectorAll('.selected_headcount'));

if(document.getElementById('choosedVal').querySelectorAll('.selected_headcount').length >= 1){

  document.querySelector('.selected_headcount').remove();

  document.getElementById('choosedVal').appendChild(newDiv);

  

  console.log(rb_headNum);
  rb_headNum = document.getElementById("headcount_value1").value;

  eraseJSTL();
  callAjax();

}else{

  document.getElementById('choosedVal').appendChild(newDiv);

rb_headNum = document.getElementById("headcount_value1").value;

console.log(rb_headNum);

eraseJSTL();
callAjax();


}

})

//탭메뉴

       const tabItem = document.querySelectorAll(".tab-container__item");
const tabContent = document.querySelectorAll(".content-container__content");

let cc = tabItem.forEach(function(item){

     item.addEventListener("click", tabHandler);
});

function tabHandler(item) {
  const tabTarget = item.currentTarget;
 
  const target = tabTarget.dataset.tab;

  // tabItem.forEach((title) => {
  //   title.classList.remove("active");
  // });
  tabContent.forEach(function(content) {
    content.classList.remove("target");
  });
  document.querySelector("#"+target).classList.add("target");
  // tabTarget.classList.add("active");
}


// 선택메뉴생성


// document.querySelectorAll('.location_select_btn, .budget_select_btn, .theme_select_btn').forEach(function(aaa){

//   aaa.addEventListener("click",function(){
//     console.log(aaa.innerHTML);
//     let idVal = aaa.getAttribute('id');
//     let word = aaa.innerHTML;
//     let newDiv = document.createElement('div');

//     //카테고리별 클래스 부여
//     if(idVal.indexOf('budget')==0){
//       console.log('예산')
//       newDiv.classList.add('budget_selected_btn')
//       newDiv.append(word);
//       newDiv.insertAdjacentHTML('beforeend', '<span class="deleteBtn">삭제버튼</span>')
//       console.log(newDiv);
//     }
//     else if(idVal.indexOf('theme')==0){
//       console.log('테마')
//       newDiv.classList.add('theme_selected_btn')
//       newDiv.append(word);
//       newDiv.insertAdjacentHTML('beforeend', '<span class="deleteBtn">삭제버튼</span>')
//     }
//     else if(idVal.indexOf('location')==0){
//       console.log('지역')
//       newDiv.classList.add('location_selected_btn')
//       newDiv.append(word);
//       newDiv.insertAdjacentHTML('beforeend', '<span class="deleteBtn">삭제버튼</span>')
//     }
 

//     //클래스, id 를 이용하여 선택항목에 선택요소 표시

// if(document.getElementById('choosedVal').querySelectorAll('.budget_selected_btn').length == 0 && idVal.indexOf('budget')==0){
 
//   document.getElementById('choosedVal').appendChild(newDiv);

// }else if(document.getElementById('choosedVal').querySelectorAll('.budget_selected_btn').length >=1 && idVal.indexOf('budget')==0){
//   document.querySelector('.budget_selected_btn').remove();
//   document.getElementById('choosedVal').appendChild(newDiv);

// }else if(document.getElementById('choosedVal').querySelectorAll('.theme_selected_btn').length == 0 && idVal.indexOf('theme')==0){

//   document.getElementById('choosedVal').appendChild(newDiv);


// }else if(document.getElementById('choosedVal').querySelectorAll('.theme_selected_btn').length  >= 1 && idVal.indexOf('theme')==0){

//   document.querySelector('.theme_selected_btn').remove();

//   document.getElementById('choosedVal').appendChild(newDiv);


// }
// else if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length == 0 && idVal.indexOf('location')==0){


//   document.getElementById('choosedVal').appendChild(newDiv);


// }else if(document.getElementById('choosedVal').querySelectorAll('.location_selected_btn').length  >= 1 && idVal.indexOf('location')==0){

//   document.querySelector('.location_selected_btn').remove();

//   document.getElementById('choosedVal').appendChild(newDiv);


// }

  
//  })

// });

////////////선택메뉴선택종료.///
	  

    var tag = {};
    var counter = 0;

    // 태그를 추가한다.
    function addTag(value) {
      tag[counter] = value; // 태그를 Object 안에 추가
      counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
    }

    // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag() {
      return Object.values(tag)
        .filter(function (word) {
          return word !== "";
        });
    }

    $("#tag")
      .on("keyup", function (e) {
        var self = $(this);
        console.log("keypress");

        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {

          var tagValue = self.val(); // 값 가져오기

          // 값이 없으면 동작 안합니다.
          if (tagValue !== "") {

            // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
            var result = Object.values(tag)
              .filter(function (word) {
                return word === tagValue;
              })

            // 태그 중복 검사
            if (result.length == 0) {
              $("#tag-list")
                .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
              addTag(tagValue);
              self.val("");
            } else {
              alert("태그값이 중복됩니다.");
            }
          }
          e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
      });

    // 삭제 버튼
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document)
      .on("click", ".del-btn", function (e) {
        var index = $(this)
          .attr("idx");
        tag[index] = "";
        $(this)
          .parent()
          .remove();
      });
  })
  
  function createDiv() {
	let aa = $("#dailyDummy").clone();

  
  // 4. <body>에 1에서 만든 <div> element 붙이기
  
  aa.appendTo('#dailyDetail');
} 


// jstl 초기 불러온값 삭제
function eraseJSTL(){
document.getElementById('contentTable').innerHTML = "" ;

}
// 검색필터선택해제
function cancelingSelect(){
document.getElementById('choosedVal').innerHTML = "" ;

}

function callAjax(){
  httpRequest = new XMLHttpRequest();
  /* httpRequest의 readyState가 변화했을때 함수 실행 */
    httpRequest.onreadystatechange = function() {
      /* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 */
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
          if (httpRequest.status === 200) {
          let result = httpRequest.response;
          console.log(result);
         // console.log(result.reviewTitles[0].rb_title);
          //let df = JSON.parse(result).rb_title
           // console.log(df);

              //console.log(result.reviews);

              console.log('찌역 : '+rb_location)
              console.log('뗴마 : '+rb_theme)
              console.log('예산 : '+rb_budget)
              console.log('헤드넘 : '+rb_headNum)

              getReviews(result);

          } else {
            alert('Request Error!');
          }
      }
    };
    /* Get 방식으로 name 파라미터와 함께 요청 */
    httpRequest.open('GET', 'http://localhost/danim/getfilterdByJSON?rb_location='+rb_location+'&rb_budget='+rb_budget+'&rb_theme='+rb_theme+'&rb_headNum='+rb_headNum);

    /* Response Type을 Json으로 사전 정의 */
    httpRequest.responseType = "json";
    /* 정의된 서버에 요청을 전송 */
    httpRequest.send();
}

function getReviews(result){
 // console.log(result.reviews.forEach());
  result.reviews.forEach(function(i, indexNum){
    
  
    console.log(i.rb_title);

    var d1 = document.getElementById('contentTable');
    d1.insertAdjacentHTML('afterbegin', '<div>'+i.rb_title+'</div>');


     });

     document.querySelectorAll('.deleteBtn').forEach(function(i){

      i.addEventListener('click',function deSelect(){
        console.log(i.parentNode);
       if(i.parentNode.classList.contains('selected_headcount')){
         i.parentNode.remove();
         rb_headNum ="";
         callAjax();

       }else if(i.parentNode.classList.contains('budget_selected_btn')){
         i.parentNode.remove();
         document.querySelector('.budget_select_btn').classList.remove('itsActive');
        rb_budget ="";
        callAjax();
       }else if(i.parentNode.classList.contains('theme_selected_btn')){
        i.parentNode.remove();
        document.querySelector('.theme_select_btn').classList.remove('itsActive');
       rb_theme ="";
       callAjax();
      }else if(i.parentNode.classList.contains('location_selected_btn')){
        i.parentNode.remove();
        document.querySelector('.location_select_btn').classList.remove('itsActive');
       rb_location ="";
       callAjax();
      }
        
        
         // console.log(this.parent());
      })

     })

};