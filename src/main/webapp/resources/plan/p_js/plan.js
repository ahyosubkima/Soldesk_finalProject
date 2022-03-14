

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


function dayImportant(){
	$(document).on("click", "#i_am_test", function() {
		
		//확인용
		//alert($(this).text());
		
		let placeName = $(this).text();
		
		$("#p_dayWriteDiv").before('<table border="1" id="sese">'+
				'<tr><td colspan="2">' + placeName + '</td></tr>'+
				'<tr><td>상품명:</td><td><input></td></tr>'+
				'<tr><td>금액:</td><td><input id="qqe" class="qqe"></td></tr></table>');
		
	});
}


function eses(){
	
	$(document).on("click", "#p_openBudget", function() {
	
		const allPrice = document.querySelectorAll(".qqe");
		const person =  document.getElementById('p_person').value;
		let price = 0;
		let sum = 0;
		let onePersonPrice = 0;
		
		let nickname = document.getElementById('p_nickname').value;
		
		
		for (var i = 0; i < allPrice.length; i++) {
			
			price = parseInt(allPrice[i].value);
			
			sum += price;
			onePersonPrice = sum / person;
			
			
		}
		//확인용
		console.log(p_nickname)
		console.log(sum)
		console.log(onePersonPrice)
		
		
		$("#p_writeBudgetWrite").html("<div id='p_budget'>" + nickname + "님,<p>이번 여행에 필요한 총 비용은 " + sum.toLocaleString() + "원으로 "+ person +"명이 여행할 경우 1인당" + onePersonPrice.toLocaleString() + "원 입니다.</div>")
		

	});
	
}


/* 실시간 글자수세기, 엔터 3줄 제한 */
function countTxt() {
	//글자수세기
	$("#p_freeWrite").keyup(function(e) {
	    console.log("키업!");
		var content = $(this).val();
		$("#textLengthCheck").val("(" + content.length + "/ 100)"); //실시간 글자수 카운팅
		if (content.length > 100) {
			alert("최대 100자까지만 입력 가능합니다.");
			$(this).val(content.substring(0, 100));
			$('#textLengthCheck').html("(100 / 최대 100자)");
		}
	//엔터 3줄 제한
		$('#p_freeWrite').keydown(function(){
            var rows = $('#p_freeWrite').val().split('\n').length;
            var maxRows = 3;
            if( rows > maxRows){
                alert('3줄 까지만 작성 가능합니다');
                modifiedText = $('#p_freeWrite').val().split("\n").slice(0, maxRows);
                $('#p_freeWrite').val(modifiedText.join("\n"));
            }
        });
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



/*
function p_openBudget(){
	
	if(document.getElementById('p_writeBudget').style.display === 'block') {
	      document.getElementById('p_writeBudget').style.display = 'none';
	      document.getElementById('p_openBudget').textContent = '💲계산결과 확인';
	    } else {
	      document.getElementById('p_writeBudget').style.display = 'block';
	      document.getElementById('p_openBudget').textContent = '💲계산결과 확인';
	    }
}
*/

function p_openFreeWord(){
	
	if(document.getElementById('p_writeFree').style.display === 'block') {
	      document.getElementById('p_writeFree').style.display = 'none';
	      document.getElementById('p_openFreeWord').textContent = '💪여행 전 한마디 ▼';
	    } else {
	      document.getElementById('p_writeFree').style.display = 'block';
	      document.getElementById('p_openFreeWord').textContent = '💪여행 전 한마디 ▲';
	    }
}






function ddd() {
	
	$('#aaa').click(function() {
		
		var xhr = new XMLHttpRequest();
		var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'YG3fNZlTK7RjxGU107s%2FAbCq%2Bc6PRrZXwZwR22ThIebtO3TUg9elZHoNM%2FqND5eQbIndczcgu%2FOGOn6lRY9hDw%3D%3D'; /*Service Key*/

		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
		queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
		xhr.open('GET', url + queryParams);
		
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    	p_allDomestic(this);
		    }
		};

		xhr.send('');
	});
	
	function p_allDomestic(xml){
		
		//alert('확인용');
		var i;
		var xmlDoc = xml.responseXML;
		
        
        var AllCity = "";
        var cityName = xmlDoc.getElementsByTagName("name");
        var cities = "";
        
        for (i = 0; i < cityName.length; i++) { 
        alert(cityName[i].firstChild.data);
/*        	if (i != 0) { 
        		AllCity += ", "; 
        	}
           AllCity += cityName[i].firstChild.data;*/
        
        cities = cityName[i].firstChild.data
        document.getElementById("ccity").innerHTML = '<button>'+cityName[i].firstChild.data+'</button>';
        }
		
	}
}




function qqq() {
	
	$(document).ready(function () {
		  $(document).on("click", "#p_markerInfo", function () {
			  let MapText = document.getElementById('p_markerInfo').innerText;
			  let MapAddress = $("#infoo").val();
			  
			  alert(MapAddress)
			  alert(MapText);
			  
			  $("#p_route").append('<div id="i_am_test_all"><div id="i_am_test">' + MapText
					  			+ '</div>' + MapAddress + '</div>');
		  });
		});
}



$(function(){

	$("#dBtn").click(function(){
	let aa = $("#p_openDayWrite").html();
	console.log(aa);
	});
	});









$(function() {
	dayWrite();
	ddd();
	qqq();
	dayImportant();
	eses();
	countTxt();
 
});










