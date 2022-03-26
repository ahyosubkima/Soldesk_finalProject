

function dayImportant(){
	$(document).on("click", "#p_plan", function() {
		
		//확인용
		//alert($(this).text());
		
		let placeName = $(this).text();
		
		$("#p_dayWriteDiv").before('<table id="setBudgetTb" class="setBudgetTb">'+
				'<tr><td colspan="2" style="height: 70px;"><textarea class="setBudgetTxtarea" name="p_setTitle" readonly>' + placeName + '</textarea></td></tr>'+
				'<tr><td style="text-align: right; width: 60px; height:35px;">상품명:</td>'+
				'<td><input name="p_setItem" id="p_setItem" class="p_setItem"></td></tr>'+
				'<tr><td style="text-align: right; width: 60px; height:35px;">금액:</td>'+
				'<td><input type="number" id="p_setPrice" name="p_setPrice" class="p_setPrice"></td></tr><tr><td colspan="2" class="deletePlanBudgetName">❌</td></tr></table>');
	});
}



function addTrans(){
	//교통비 테이블 추가
	$(document).on("click", "#p_addTransportation", function() {
		
		$("#p_dayWriteDiv").before('<table id="setBudgetTb" class="setBudgetTb">'+
				'<tr><td colspan="2" style="height: 70px;"><textarea id="setBudgetTxtarea" class="setBudgetTxtarea" name="p_setTitle" style="width: 180px; height: 60px;" placeholder="교통편 종류를 적어주세요"></textarea></td></tr>'+
				'<tr><td style="text-align: right; width: 60px; height:35px;">편명:</td>'+
				'<td><input name="p_setItem" id="p_setItem" class="p_setItem"></td></tr>'+
				'<tr><td style="text-align: right; width: 60px; height:35px;">금액:</td>'+
				'<td><input type="number" id="p_setPrice" name="p_setPrice" class="p_setPrice"></td></tr><tr><td colspan="2" class="deletePlanBudgetName">❌</td></tr></table>');
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
			let nickname = document.getElementById('p_nickname').value;
			
			let price = 0;
			let sum = 0;
			let onePersonPrice = 0;
			
			
			
			for (var i = 0; i < allPrice.length; i++) {
				
				price = parseInt(allPrice[i].value);
				
				sum += price;
				onePersonPrice = sum / person;
			}
			//확인용
			console.log(nickname)
			console.log(sum)
			console.log(onePersonPrice)
			
			$("#p_writeBudgetWrite").html("<textarea name='p_budget' id='p_budget' readonly>" + nickname + "님,\n이번 여행에 필요한 총 비용은 " + sum.toLocaleString() + "원으로 "+ person +"명이 여행할 경우 1인당 " + onePersonPrice.toLocaleString() + "원 입니다.</textarea>")
		
	});
}



/* 자유 한마디 실시간 글자수세기, 엔터 3줄 제한 */
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



/* 여행 예산 작성 엔터2줄 제한 */
function lineLimit() {
	$(document).on("click", "#setBudgetTxtarea", function() {
	$(this).keydown(function(){
        var b_rows = $(this).val().split('\n').length;
        var b_maxRows = 2;
        if( b_rows > b_maxRows){
            alert('2줄 까지만 작성 가능합니다');
            b_modifiedText = $(this).val().split("\n").slice(0, b_maxRows);
            $(this).val(b_modifiedText.join("\n"));
        }
    });
	});
}
	


/* 상세페이지 한마디 접기 피기 기능 */
function p_openFreeWord(){
	
	if(document.getElementById('p_writeFreeDetail').style.display === 'block') {
	      document.getElementById('p_writeFreeDetail').style.display = 'none';
	      document.getElementById('p_openFreeWord').textContent = '💪여행 전 한마디 ▼';
	    } else {
	      document.getElementById('p_writeFreeDetail').style.display = 'block';
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
			  
			  $("#p_route").append('<div id="mapNameAll"><div id="mapName"><textarea name="p_plan" id="p_plan">' + MapText
					  			+ '</textarea></div>' + MapAddress + '<div class="deletePlanMapName">❌</div></div>');
			  
		  });
		});
}


	
/* 여행플래너 제작 표지이미지 미리보기 */	
function previewImg(){
	$(document).ready(function () {
	document.getElementById("p_titleFiles").onchange = function () {
	    var reader = new FileReader();

	    reader.onload = function (e) {
	        document.getElementById("p_preview").src = e.target.result;
	    };

	    reader.readAsDataURL(this.files[0]);
	};
	});
}


/* 여행 전체일정 부분 삭제 */
function deletePlan() {
	$(document).ready(function () {
		  $(document).on("click", ".deletePlanMapName", function () {
			  if (confirm('정말 삭제하시겠습니까?') == true) {
				  let thisPlan = this.closest('#mapNameAll');
				  thisPlan.remove();
				  alert("삭제 성공!");
			}else {
				return;
			}
		  });
		});
}



/* 여행 예산 부분 삭제 */
function deletePlanBudget() {
	$(document).ready(function () {
		  $(document).on("click", ".deletePlanBudgetName", function () {
			  if (confirm('정말 삭제하시겠습니까?') == true) {
				  let thisBudget = this.closest('#setBudgetTb');
				  thisBudget.remove();
				  alert("삭제 성공!");
			}else {
				return;
			}
		  });
		});
}



/* 작성페이지 null검사 */
function p_submit() {
	$(document).on("click", ".p_submit", function () {

/*	if (!$("#p_title").val()) {
		alert('플래너 제목을 작성해주세요!');
		setTimeout(function() {
			$("#p_title").focus();
		})
		return false;
	}
	if (!$("#p_startDate").val()) {
		alert('출발날짜를 선택해주세요!')
		setTimeout(function() {
			$("#p_startDate").focus();
		})
		return false;
	}
	if (!$("#p_person").val()) {
		alert('여행인원을 작성해주세요!')
		setTimeout(function() {
			$("#p_person").focus();
		})
		return false;
	}
	if (!$("#p_place").val()) {
		alert('여행장소를 작성해주세요!')
		setTimeout(function() {
			$("#p_place").focus();
		})
		return false;
	}
	if (!$("#p_titleFiles").val()) {
		alert('플래너 사진을 업로드해주세요!')
		setTimeout(function() {
			$("#p_titleFiles").focus();
		})
		return false;
	}
	*/
		
		
	if($.contains(document.body, document.getElementById("setBudgetTb"))== false) {
		
		alert('여행 예산을 하나이상 작성해주세요!')
		
		var offset = $("#p_DayWriteAll").offset(); //해당 위치 반환
	
		setTimeout(function() {
			$("html, body").animate({scrollTop: offset.top-280},50);
		});
		return false;
	}else {
		//console.log('aa');
		alert('???????????????')
		
		$('.setBudgetTb').each(function(i,t) {
			
			let txtArea = $(this).find(".setBudgetTxtarea");
			let item = $(this).find(".p_setItem");
			let price = $(this).find(".p_setPrice");
			
			//console.log($(txtArea).val());			
			//console.log($(item).val());			
			//console.log($(price).val());		
			
			var offset = $("#p_DayWriteAll").offset(); //해당 위치 반환
			
			if(!$(txtArea).val()){
				alert('교통편 이름을 작성해주세요');
				$(txtArea).focus();
				return false;
			}
			if(!$(item).val()){
				alert('상품 이름을 작성해주세요');
				$("html, body").animate({scrollTop: offset.top-280},50);
				$(item).focus();
				return false;
			}
			if(!$(price).val()){
				alert('가격을 작성해주세요');
				$("html, body").animate({scrollTop: offset.top-260},50);
				$(price).focus();
				return false;
			}
		});//foreach문 끝
		return false;
	}
	return false;
	
	
		
	/*$.contains(document.body, document.getElementById("p_budget")) == false	*/
	
	 });
}





/* 메인페이지 작성버튼 null검사 */
function p_writesubmit() {
	
	$(document).ready(function () {
	$(document).on("click", "#p_writePlannerBtn", function () {
		
		if ($("#p_days").val() == "") {
			alert('여행 일정을 적어주세요')
			return false;
		}else {
			return true;
		}
	 });
	});
}


/* 하트좋아요 기능 */

function plan_like() {
	
	
	$('.like-container > .feeling_a, .dislike-container  > .feeling_a').on('click', function() {
	    event.preventDefault();
	    $('.active').removeClass('active');
	    $(this).addClass('active');
	});
	
}

















$(function() {
	addTrans();
	qqq();
	dayImportant();
	budgetCalc();
	countTxt();
	previewImg();
	deletePlan();
	lineLimit();
	deletePlanBudget();
	/*p_submit();*/
	p_writesubmit();
	plan_like();
});










