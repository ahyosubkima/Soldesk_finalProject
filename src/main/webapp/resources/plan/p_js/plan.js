

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




/*function dayWrite() {
	
$(document).on("click","#p_dayWrite", function() {

	alert($(this).attr("value"));
	
		$("section").append('<table border="1">'+
			'<tr><td colspan="2">지도</td><td rowspan="3">➔</td></tr>'+
			'<tr><td>주소</td><td>메뉴</td></tr></table>');
	});
}*/


function dayWrite() {
	
	$(document).on("click","#p_dayWrite", function() {

		alert($(this).attr("value"));
		
		$(this).after('<table border="1" id="sese">'+
				'<tr><td colspan="2">지도</td><td rowspan="4">➔</td></tr>'+
				'<tr><td colspan="2">주소</td></tr>'+
				'<tr><td>메뉴</td><td>금액</td></tr></table>');
		});
	}



	

/*
function eeeeeeeee(){
	
	$(document).ready(function() {
		
		$("#p_dayWrite").each(function() {
			$(this).click(function() {
				
				$("section").append('<table border="1">'+
						'<tr><td colspan="2">지도</td><td rowspan="3">➔</td></tr>'+
						'<tr><td>주소</td><td>메뉴</td></tr></table>');
			});
		});
            }
        );
}
*/
	

/*
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
        			   $("#p_openDayWrite").append('<section><table border="1"><tr><td colspan="2">'+ i +'일차</td><td rowspan="3">➔</td></tr><tr><td colspan="2">지도</td></tr><tr><td>주소</td><td>메뉴</td></tr></table></section>');
        		   }
			}
                })
            }
        );
}
*/

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



/* Javascript 샘플 코드 */

$('#aaa').click(function() {
	

var xhr = new XMLHttpRequest();
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'dwA0hhqKA%2BCMyaTqP8IlGmiKAw8jOfSCi6bW%2F0nzRxyJtDcxJ9J5lS8ehBSERa%2BXlHEf4Pi4gUvsQYaDgrRLHQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
queryParams += '&' + encodeURIComponent('areaCode') + '=' + encodeURIComponent('1'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    }
};

xhr.send('');


});













$(function() {
	dayWrite();
	//spptest();
 
});










