/**
 * 
 */

//js 준비
document.addEventListener('DOMContentLoaded', function () {
	
	
	
   // console.log(document.getElementById('selectBox'));

   document.getElementById('selectBox').addEventListener('change',function(){

    if(document.getElementById('selectBox').value == "direct"){
        document.getElementById('inputContainer').style.display = 'inline-block';
       
    } else{
        document.getElementById('inputContainer').style.display = 'none';
    }
   // if(document.getElementById('selectBoxDirect').ariaValueMax())

 });
	

document.getElementById('dailyAddBtn').addEventListener('click',function(){

    let newDiv = document.createElement('div');

    let clone = document.getElementById('dailyContent').cloneNode(true);
    
    document.getElementById('dailyContainer').insertAdjacentElement('afterbegin',clone);

   // console.log(clone);

})



// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
if(event.target.classList.contains('dropbtn')){
    console.log(event.target.parentNode.childNodes[3].classList.toggle("show"));
}

  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }

  if(event.target.classList.contains('insert_col_back')){
 createSchedule(event.target);
  }
}


	
});
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
// function doDropdown() {
    
//     document.getElementById("myDropdown").classList.toggle("show");


// }

let daycount = 1;

function createSchedule(a){

   let newDiv =  document.createElement('div');
   newDiv.setAttribute('id','daily_schedule_con');

   ++daycount;

   newDiv.innerHTML = '<div class="dropdown">\
       <button onclick="" class="dropbtn">\
           <img alt="" src="resources/review/img/plus-circle.svg">\
       </button>\
       <div id="myDropdown" class="dropdown-content">\
           <a href="javascript:void(0);" onclick="createSchedule()">앞에 일정추가</a> <a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="#">일정삭제</a>\
       </div>\
   </div>\
   <a href="#"><span>day '+daycount+'</span></a>'
   console.log(newDiv);
   console.log(a.parentNode.parentNode.parentNode);
   //document.getElementById('schedule_inner_nav').inn
//    a.parentNode.parentNode.parentNode.append('afterend',newDiv);
    a.parentNode.parentNode.parentNode.parentNode.append(newDiv);
    


}

