/* trim  */
if (typeof String.trim == 'undefined') {
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s$)/g, '')
	};
}


/* 약관 */
var btnFormNext = document.getElementById('btnTermsNext');
if (btnFormNext) {
	btnFormNext.addEventListener('click', chkTerms);
}

function chkTerms() {
	var frm = document.getElementById('formTerms');

	var locationTerm = frm.querySelector('input[name="agreeLocation"]');
	var mustTerms = frm.querySelectorAll('input[name="agreeMust"]');
	var mustLength = mustTerms.length;
	var cntMustChecked = 0;

	for (var i = 0; i < mustLength; i++) {
		if (mustTerms[i].checked == true) {
			cntMustChecked++;
		}
	}

	if (cntMustChecked < mustLength) {
		alert('필수 약관은 반드시 동의가 필요합니다.');

		return false;
	}

	location.href = 'join-form?l=' + locationTerm.checked;
}


/* 회원가입 */
var btnJoinConfirm = document.getElementById('joinFormConfirm');
var btnChkTel = document.getElementById('btnChkTel');
var btnChkNik = document.getElementById('btnChkNik');

if (btnJoinConfirm) {
	btnJoinConfirm.addEventListener('click', chkJoinForm);
}

if (btnChkTel) {
	var frm = document.getElementById('joinForm');
	btnChkTel.addEventListener('click', function() { chkTel(frm) });
}

if (btnChkNik) {
	var frm = document.getElementById('joinForm');
	btnChkTel.addEventListener('click', function() { chkNik(frm) });
}

function chkJoinForm() {
	var frm = document.getElementById('joinForm');

	if (frm.userName.value === '') {
		alert('이름을 입력해주세요');

		return false;
	}

	if (frm.pw.value === '') {
		alert('비밀번호를 입력해주세요');

		return false;
	}

	if (frm.pw.value !== frm.rePw.value) {
		alert('비밀번호를 확인해주세요');

		return false;
	}

}

function chkTel($target) {

	var frm = $target;
	var telText = frm.tel.value;

	if (telText === '') {
		alert('연락처를 입력해주세요');

		return false;
	}

	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

	telText = telText.replace(regExp, '');

	if (telText.substring(0, 2) != '01') {
		console.log(telText.substring(0, 2));
		alert('연락처는 핸드폰 번호만 가능합니다.');

		return false;
	}

	if (regPhone.test(telText) === false) {
		alert('연락처를 다시 확인해주세요');

		return false;
	}

	if (regPhone.test(telText) === true) {
		telText = telText.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
		frm.tel.value = telText;
		frm.isSameTel.value = 'N';
	}
}


function chkNik($target) {

	var frm = $target;
	var nikText = frm.nickname.value;

	if (nikText === '') {
		alert('연락처를 입력해주세요');

		return false;
	}

	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var regNickName = ;

	nikText = nikText.replace(regExp, '');

	if (regNickName.test(nikText) === false) {
		alert('연락처를 다시 확인해주세요');

		return false;
	}

	if (regNickName.test(nikText) === true) {
		nikText = nikText.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
		frm.nikText.value = nikText;
		frm.isSameNik.value = 'N';
	}
}
