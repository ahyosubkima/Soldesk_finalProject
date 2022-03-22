function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}


$(function () {
	//ID 찾기
	
	$("#idSearchBtn").click(function() {
		let dm_email = $('#dm_email1').val();
		$.ajax({
			url : 'member.findId?dm_email='+ dm_email,
			type : 'get',
			success : function(data) {
				console.log(data);							
				
				if (data == "") {
					$("#mail_check").text("등록되지 않은 메일입니다.");
					$("#mail_check").css("color", "red");
				} else {
					$("#mail_check").text("귀하의 아이디는 " + data + "입니다.");
					$("#mail_check").css("color", "blue");
				}
			}, error : function() {
						console.log("실패");
				}
			});
		});
	
	
	
});