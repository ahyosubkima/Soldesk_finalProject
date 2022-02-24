

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
		
		$("#eeeg").append('<table border="1">'+
			'<tr><td colspan="2">지도</td><td rowspan="3">➔</td></tr>'+
			'<tr><td>주소</td><td>메뉴</td></tr></table>');
	});
}



function pptest(){
	
	$(document).ready(function() {
		
           $("#p_lastDay").keyup(function() {
        	   
        	   let lastDay = $("#p_lastDay").val(); 
        	   alert(lastDay);  
        	   
        	   if (lastDay == null ) {
        		   for (var i = 1; i <= lastDay; i++) {
        			   $("#p_openDayWrite").append('<section><div>'+i+'일차</div><div id="p_dayWriteDiv"><input id="p_dayWrite" type="button" value="일정추가하기"></div><table id="eeeg" border="1"><tr><td colspan="2">지도</td><td rowspan="3">➔</td></tr><tr><td>주소</td><td>메뉴</td></tr></table></section>');
        		   }
        	   }else {
        		   $("#p_openDayWrite *").remove();
        		   for (var i = 1; i <= lastDay; i++) {
        			   $("#p_openDayWrite").append('<section><div>'+i+'일차</div><div id="p_dayWriteDiv"><input id="p_dayWrite" type="button" value="일정추가하기"></div><table id="eeeg" border="1"><tr><td colspan="2">지도</td><td rowspan="3">➔</td></tr><tr><td>주소</td><td>메뉴</td></tr></table></section>');
        			   /*$("#p_openDayWrite").append('<section><table border="1"><tr><td colspan="2">'+ i +'일차</td><td rowspan="3">➔</td></tr><tr><td colspan="2">지도</td></tr><tr><td>주소</td><td>메뉴</td></tr></table></section>');*/
        		   }
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










