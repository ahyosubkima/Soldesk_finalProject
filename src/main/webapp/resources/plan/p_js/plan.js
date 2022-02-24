

function connectAddrSearchEvent() {
	$("#writePlan").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#jm_addr3Input").val(data.zonecode);
				$("#jm_addr1Input").val(data.roadAddress);
			}
		}).open();
	});
}




function dayWrite() {
	
$(document).on("click","#p_dayWrite", function() {
		
		$("#p_dayWriteDiv").append('<tr><td rowspan="2">지도</td><td>주소:<input></td></tr><tr><td>메뉴: <input></td></tr><tr><td colspan="2">|</td></tr>');

	});
}



function pptest(){
	
	$(document).ready(function() {
		
           $("#p_lastDay").keyup(function() {
        	   let lastDay = $("#p_lastDay").val(); 
        	   alert(lastDay);  
        	   
        	   for (var i = 0; i < lastDay; i++) {
        		   $("#p_openDayWrite").append('<table border="1" id="p_test"><tr><td rowspan="2">지도</td><td>주소:<input></td></tr><tr><td>메뉴: <input></td></tr><tr><td colspan="2">|</td></tr></table>');
			}
        	   
        	   
        	   
                })
            }
        );
}


function p_openBudget(){
	
	if(document.getElementById('p_writeBudget').style.display === 'block') {
	      document.getElementById('p_writeBudget').style.display = 'none';
	      document.getElementById('p_openBudget').textContent = '💲예산결과 ▼';
	    } else {
	      document.getElementById('p_writeBudget').style.display = 'block';
	      document.getElementById('p_openBudget').textContent = '💲예산결과 ▲';
	    }
}


function p_openFreeWord(){
	
	if(document.getElementById('p_writeFree').style.display === 'block') {
	      document.getElementById('p_writeFree').style.display = 'none';
	      document.getElementById('p_openFreeWord').textContent = '💪여행 전 한마디 ▼';
	    } else {
	      document.getElementById('p_writeFree').style.display = 'block';
	      document.getElementById('p_openFreeWord').textContent = '💪여행 전 한마디 ▲';
	    }
}

















$(function() {
	dayWrite();
	pptest();
 
});










