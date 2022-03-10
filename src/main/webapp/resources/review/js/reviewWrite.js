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
	
});

