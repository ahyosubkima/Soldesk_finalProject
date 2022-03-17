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

    // 드롭버튼클릭했을때
if(event.target.classList.contains('dropbtn')){
    console.log(event.target.parentNode.childNodes[3].classList.toggle("show"));
}

// Close the dropdown menu if the user clicks outside of it
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

  //뒤에일정추가
  if(event.target.classList.contains('insert_col_back')){
      if(event.target.parentNode.parentNode.parentNode.nextElementSibling){
          alert('다음일정이 이미 존재합니다.');
          return false;
      }
 createSchedule(event.target);
 document.querySelector('.daily_schedule.active').nextElementSibling.classList.add('active') ;
 document.querySelector('.daily_schedule.active').classList.remove('active') ;
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

    ++daycount;
   let newDiv =  document.createElement('div');
   newDiv.setAttribute('id','daily_schedule_con');
   newDiv.classList.add('daily_schedule');
   
   newDiv.setAttribute('data-day',daycount);

   newDiv.innerHTML = '<div class="dropdown">\
       <button onclick="" class="dropbtn">\
           <img alt="" src="resources/review/img/plus-circle.svg">\
       </button>\
       <div id="myDropdown" class="dropdown-content">\
           <a href="javascript:void(0);" class="insert_col_back">뒤에 일정추가</a> <a href="#" onclick="deleteDay(this)">일정삭제</a>\
       </div>\
   </div>\
   <a href="javascript:void(0);" onclick="activateDay(this)"><span>day '+daycount+'</span></a>'
   console.log(newDiv);
   console.log(a.parentNode.parentNode.parentNode);
   //document.getElementById('schedule_inner_nav').inn
//    a.parentNode.parentNode.parentNode.append('afterend',newDiv);
console.log(a);
    a.parentNode.parentNode.parentNode.parentNode.append(newDiv);
    
    console.log(document.getElementById('schedule_inner_nav').childNodes);
    console.log(document.querySelectorAll('.daily_schedule'));
    
    
    if(daycount >3){
        //console.log(document.querySelectorAll('.daily_schedule')[0]);
        document.querySelectorAll('.daily_schedule')[daycount-4].style.display = 'none';
    }


}

function moveNextD(){
    if(document.querySelector('.daily_schedule.active').nextElementSibling == null){
       result = confirm('마지막 일정입니다. 일정을 추가할까요?');
       if(result == true){
           console.log(document.querySelector('.daily_schedule.active').childNodes[0]);
        console.log(document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3]);
        backwardBtn = document.querySelector('.daily_schedule.active').childNodes[0].childNodes[3].childNodes[3];
           createSchedule(backwardBtn);
        }
        else{
            return false;
        }
    }
    else if(document.querySelector('.daily_schedule.active').nextElementSibling.style.display =='none'){
        console.log('여곳이요');
        document.querySelector('.daily_schedule.active').previousElementSibling.previousElementSibling.style.display = 'none';

        document.querySelector('.daily_schedule.active').nextElementSibling.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;
        document.querySelector('.daily_schedule.active').style.display ='block';

        
    }
    else{
        console.log('이곳으로');
        document.querySelector('.daily_schedule.active').nextElementSibling.classList.add('active') ;
        document.querySelector('.daily_schedule.active').classList.remove('active') ;

    }

}

function activateDay(e){
    document.querySelector('.daily_schedule.active').classList.remove('active');
    e.parentNode.classList.add('active');
}

function movePrevD(){
    if(document.querySelector('.daily_schedule.active').getAttribute('data-day') == 1){
        alert('첫번째 일정입니다.');
    } else{
        console.log('여기');
        console.log(document.querySelector('.daily_schedule.active').previousElementSibling);
        document.querySelector('.daily_schedule.active').previousElementSibling.classList.add('active');
        document.querySelector('.daily_schedule.active').nextElementSibling.classList.remove('active') ;
        if(document.querySelector('.daily_schedule.active').style.display == 'none'){
            document.querySelector('.daily_schedule.active').style.display = 'block';
            document.querySelector('.daily_schedule.active').nextElementSibling.nextElementSibling.nextElementSibling.style.display = 'none';
        }
    }
}

function deleteDay(e){
    if(document.querySelectorAll('.daily_schedule').length ==1){
        alert('최소 1일 일정필요');
        return false;
    }
    else{
        if(document.querySelector('.daily_schedule.active') == null){

            e.parentNode.parentNode.parentNode.previousElementSibling.classList.add('active');
        }
        e.parentNode.parentNode.parentNode.remove();
        --daycount;
        document.querySelectorAll('.daily_schedule').forEach(function reset(i, curidx){
                console.log(i, curidx);
               i.setAttribute('data-day',curidx+1);
               let dayNum = curidx +1;
               i.childNodes[2].firstChild.textContent = 'day ' + dayNum;
                
        })
        
    }
}

