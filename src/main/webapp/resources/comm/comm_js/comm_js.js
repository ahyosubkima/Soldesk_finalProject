function comm_delOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_delete?no='+no;
	}
	
}

function comm_updateOK(no) {
var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_update?no='+no;
	}
}

function comm_goodOK(no) {
	var ok = confirm('추천하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_good?no='+no;
	}
}