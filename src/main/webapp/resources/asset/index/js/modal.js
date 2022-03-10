
function modalOpen() {
	const body = document.querySelector('body');
	body.style.overflow = 'hidden'
	document.querySelector('.modal_wrap').style.display = 'flex';
	document.querySelector('.modal_background').style.display = 'block';

}

function modalClose() {
	const body = document.querySelector('body');
	body.style.overflow = 'auto';
	document.querySelector('.modal_wrap').style.display = 'none';
	document.querySelector('.modal_background').style.display = 'none';
}

const modal_loginBtn = document.querySelector('.modal_loginBtn');
const registerBtn = document.querySelector('.registerBtn');
const formBx = document.querySelector('.formBx');


registerBtn.onclick = function() {
	formBx.classList.add('active');
}

modal_loginBtn.onclick = function() {
	formBx.classList.remove('active');
}