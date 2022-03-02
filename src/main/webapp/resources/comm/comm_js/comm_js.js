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
		alert('추천되었습니다');
		location.href='comm_picture_good?no='+no;
	}
}

function pictureReplyDel(no) {
	
var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_reply_delete?no='+no;
	}
	
	
}

function pictureReplyUpdate(no){
	
	var ok = confirn('수정 하시겠습니까?')
	
	if (ok) {
		
		location.href='comm_picture_reply_update?no='+no;
	}
	
	
	
}