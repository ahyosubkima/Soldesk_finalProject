/**
 * 
 */

//js 준비
document.addEventListener('DOMContentLoaded', function () {
	
	
	// console.log(document.getElementById('totalday').value);

    let totalday = document.getElementById('totalday').value;

    for (let index = 1; index <= totalday; index++) {
        
        let newDiv = document.createElement('div');

        let theday = "selecDay"+ index;

        newDiv.innerText = "day"+index;

        newDiv.classList.add('dailySelected');
        newDiv.setAttribute('id',theday);
        newDiv.setAttribute('data-day',index);

        document.getElementById('dayselWrap').insertAdjacentElement("beforeend",newDiv);
    }

    document.getElementById('selecDay1').style.display ="block";
    document.getElementById('selecDay1').classList.add('activate');
    document.getElementById('day1').classList.add('activate');
	
	
})

function veiwPrevDay(target){


    console.log(document.querySelector('.dailySelected.activate'));
  if( document.querySelector('.dailySelected.activate').getAttribute('data-day') == 1) {
      alert('일정 첫 날입니다');
      return false;
  }
  else{
        //날짜저장
    let prevday =document.querySelector('.dailySelected.activate').getAttribute('data-day')-1;
        //액티브해제
        document.querySelector('.dailySelected.activate').style.display = 'none';
        document.querySelector('.dailySelected.activate').classList.remove('activate');
        document.querySelector('.dailyBox.activate').style.display = 'none';
        document.querySelector('.dailyBox.activate').classList.remove('activate');

        //액티브설정
        console.log(document.getElementById('selecDay'+prevday));
        document.getElementById('selecDay'+prevday).classList.add('activate');
        document.getElementById('selecDay'+prevday).style.display ='block';
        document.getElementById('day'+prevday).classList.add('activate');
        document.getElementById('day'+prevday).style.display ='block';

    }



}

function veiwNextDay(target){

    let totalday = document.getElementById('totalday').value;

    if( document.querySelector('.dailySelected.activate').getAttribute('data-day') == totalday) {
        alert('일정 마지막 날입니다');
        return false;
    }
    else{
        //날짜저장
        let nextday =parseInt(document.querySelector('.dailySelected.activate').getAttribute('data-day'))+1;
        //액티브해제
        document.querySelector('.dailySelected.activate').style.display = 'none';
        document.querySelector('.dailySelected.activate').classList.remove('activate');
        document.querySelector('.dailyBox.activate').style.display = 'none';
        document.querySelector('.dailyBox.activate').classList.remove('activate');

        //액티브설정
        console.log(nextday);
        console.log(document.getElementById('selecDay'+nextday));
        document.getElementById('selecDay'+nextday).classList.add('activate');
        document.getElementById('selecDay'+nextday).style.display ='block';
        document.getElementById('day'+nextday).classList.add('activate');
        document.getElementById('day'+nextday).style.display = 'block';
        


    }

}
