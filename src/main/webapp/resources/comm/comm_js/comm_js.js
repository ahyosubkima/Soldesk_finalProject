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
function comm_VideodelOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_delete?pageNum=1&no='+no;
	}
	
}

function comm_VideoupdateOK(no) {
	var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_update?no='+no;
	}
}
function comm_FreedelOK(no) {
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_free_delete?pageNum=1&no='+no;
	}
	
}


function comm_updateFreeOK(no) {
	var ok = confirm('정말 수정하시겠습니까?')
	
	if (ok) {
		location.href='comm_free_update?no='+no;
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
	
var ok = confirm('정말 삭제하시겠습니까?!!')
	
	if (ok) {
		location.href='comm_picture_reply_delete?no='+no;
	}
	
	
}

function pictureReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");

	}
	
	location.href='comm_picture_reply_update?no='+no+"&newReply="+txt+"&cpr_no="+r_no;
}

function videoReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");
		
	}
	
	location.href='comm_video_reply_update?no='+no+"&newReply="+txt+"&cvr_no="+r_no;
}
function freeReplyUpdate(r_no,no)
{
	var ok = confirm('수정 하시겠습니까?!?!?!?!!')
	
	if (ok) {
		
		var txt = prompt("수정할 내용 입력");
		
	}
	
	location.href='comm_free_reply_update?no='+no+"&newReply="+txt+"&cfr_no="+r_no;
}

function videoReplyDel(no) {
	
	var ok = confirm('정말 삭제하시겠습니까?')
	
	if (ok) {
		location.href='comm_video_reply_delete?no='+no;
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

function videoUpload() {
	/*	var title = document.getElementById('title').value;
	var picture = document.getElementById('picture').value;
	var txt = document.getElementById('txt').value;*/
	
	var title = document.picture_upload.cv_write_name.value;
	var video = document.picture_upload.cv_name.value;
	var txt = document.picture_upload.cv_txt.value;	
	
	var fileLen = video.length;
	
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
	else if (fileExt != ".mp4" && fileExt != ".m4v" && fileExt != ".avi" && fileExt != ".wmv" && 
			fileExt != ".mwa" &&fileExt != ".asf" && fileExt != ".mkv" && fileExt != ".mpg" && fileExt != ".mov" && fileExt != ".webm"
				&& fileExt != ".3gp" && fileExt != ".3g2" && fileExt != ".mpeg" && fileExt != ".ts")
	{
		
		alert("동영상 파일만 등록해주세요");
		
		return false;
	}
	else if (video == "") {
		alert("영상을 등록해주세요");
		
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

function replyOK(){
	
	
	var txt = document.getElementsByClassName('cpr_txt')[0].value;
	
	if (txt == "") {
		alert('댓글을 입력해주세요');
		return false;
	}
	else{
		return true;
		
	}
	}
function replyNoOK(){
	alert('로그인 후 이용해주세요')
	return false;
}

function videoreplyOK(){
	
	
	var txt = document.getElementsByClassName('cvr_txt')[0].value;
	
	if (txt == "") {
		alert('댓글을 입력해주세요');
		return false;
	}
	else{
		return true;
		
	}
}


function replyNoOK(){
	alert('로그인 후 이용해주세요')
	return false;
}
	