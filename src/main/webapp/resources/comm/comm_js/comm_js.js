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

function comm_goodOK(no,id) {
	var ok = confirm('추천하시겠습니까?')
	
	if (ok) {
		alert('추천되었습니다');
		location.href="comm_picture_good?no=" + no + "&id=" + id;
	}
}



function pictureReplyDel(no) {
	
var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_picture_reply_delete?no='+no;
	}
	
	
}

function pictureReplyUpdate(no){
	
	var ok = confirm('수정 하시겠습니까?')
	
	if (ok) {
		
		location.href='comm_picture_reply_update?no='+no;
	}
	
	
	
}

function pictureUpload() {
	/*	var title = document.getElementById('title').value;
	var picture = document.getElementById('picture').value;
	var txt = document.getElementById('txt').value;*/
	
	var title = document.picture_upload.comm_picture_write_name.value;
	var picture = document.picture_upload.comm_picture_name.value;
	var txt = document.picture_upload.comm_picture_txt.value;	
	
	var fileLen = picture.length;
	 
    /** 
     * lastIndexOf('.') 
     * 뒤에서부터 '.'의 위치를 찾기위한 함수
     * 검색 문자의 위치를 반환한다.
     * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
     */
    var lastDot = picture.lastIndexOf('.');
 
    // 확장자 명만 추출한 후 소문자로 변경
    var fileExt = picture.substring(lastDot, fileLen).toLowerCase();

	 
	if (title == "") {
		alert("제목을 입력해주세요");
		
		return false;
		
	}
	else if (fileExt != ".jfif" && fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png" && 
			fileExt != ".gif" &&fileExt != ".bmp" && fileExt != ".tif" && fileExt != ".tiff")
	{
		
		alert("이미지 파일만 등록해주세요");
		
		return false;
	}
	else if (picture == "") {
		alert("사진을 등록해주세요");
	
		return false;	
	}
	
	else if (txt == ""){ 
			alert("내용을 입력해주세요");
			
			return false;
	}
	
	return true;
}	


function reallyGood() {
	
	var ok = confirm('정말 추천하시겠습니까?')
	
	if(ok){
		return true;
	}
	else {
		return false;
	}
}

function reallyNoGood() {
	
	var ok = confirm('추천을 취소 하시겠습니까?')
	
	if(ok){
		return true;
	}
	else {
		return false;
	}
}
	