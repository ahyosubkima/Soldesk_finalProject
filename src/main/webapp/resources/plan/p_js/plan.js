

function dayImportant(){
	$(document).on("click", "#i_am_test", function() {
		
		//확인용
		//alert($(this).text());
		
		let placeName = $(this).text();
		
		$("#p_dayWriteDiv").before('<table border="1" id="setBudgetTb">'+
				'<tr><td colspan="2" style="height: 70px;"><textarea name="p_setTitle">' + placeName + '</textarea></td></tr>'+
				'<tr><td style="width: 50px; height:35px;">상품명:</td>'+
				'<td><input style="width: 130px;" name="p_setItem"></td></tr>'+
				'<tr><td style="width: 50px; height:35px;">금액:</td>'+
				'<td><input type="number" style="width: 130px;" id="p_setPrice" name="p_setPrice" class="p_setPrice"></td></tr></table>');
	});
}



function addTrans(){
	//교통비 테이블 추가
	$(document).on("click", "#p_addTransportation", function() {
		
		$("#p_dayWriteDiv").before('<table border="1" id="setBudgetTb">'+
				'<tr><td colspan="2" style="height: 70px;"><textarea id="setBudgetTxtarea" name="p_setTitle" style="width: 180px; height: 60px;" placeholder="교통편을 적어주세요"></textarea></td></tr>'+
				'<tr><td style="width: 50px; height:35px;">내용명:</td>'+
				'<td><input style="width: 130px;" name="p_setItem"></td></tr>'+
				'<tr><td style="width: 50px; height:35px;">금액:</td>'+
				'<td><input type="number" style="width: 130px;" id="p_setPrice" name="p_setPrice" class="p_setPrice"></td></tr></table>');
	});
	//세줄 이상 금지
	$(document).on("keydown", "#setBudgetTxtarea", function() {
		var rows = $('#setBudgetTxtarea').val().split('\n').length;
		var maxRows = 3;
		if( rows > maxRows){
			alert('3줄 까지만 작성 가능합니다');
			modifiedText = $('#setBudgetTxtarea').val().split("\n").slice(0, maxRows);
			$('#setBudgetTxtarea').val(modifiedText.join("\n"));
		}
	});
}



/* 여행 예산 계산 */
function budgetCalc(){
	
	$(document).on("click", "#p_openBudget", function() {
	
		const allPrice = document.querySelectorAll(".p_setPrice");
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
		
		$("#p_writeBudgetWrite").html("<textarea name='p_budget' id='p_budget' readonly>" + nickname + "님,\n이번 여행에 필요한 총 비용은 " + sum.toLocaleString() + "원으로 "+ person +"명이 여행할 경우 1인당" + onePersonPrice.toLocaleString() + "원 입니다.</textarea>")
		
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



/* 접기 피기 기능 */
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




function qqq() {
	
	$(document).ready(function () {
		  $(document).on("click", ".p_markerInfo", function () {
			  let MapText = this.innerText;
			  let MapAddress = $(".p_markerInfo").val();
			  //let MapAddress = $("#infoo").val();
			  
			  alert("주소:" + MapAddress);
			  alert("JS에서 이름:" + MapText);
			  
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
	addTrans()
	qqq();
	dayImportant();
	budgetCalc();
	countTxt();
});










