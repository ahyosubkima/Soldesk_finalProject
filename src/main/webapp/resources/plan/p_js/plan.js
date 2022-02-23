

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


function aaa(){
	$(document).on("click","#p_add", function() {
		
		$("#p_writeDetail").append('<tr><td rowspan="2">지도</td><td>주소:<input></td></tr><tr><td>메뉴: <input></td></tr><tr><td colspan="2">|</td></tr>');

	});
}



$(function() {
	aaa();
 
});










