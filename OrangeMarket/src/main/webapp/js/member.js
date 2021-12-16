/* trim  */
if (typeof String.trim == 'undefined') {
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s$)/g, '')
	};
}


/* 약관 */
var joinTermsForm = document.getElementById('formTerms');
if (joinTermsForm) {
	var btnFormNext = document.getElementById('btnTermsNext');
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
var joinForm = document.getElementById('joinForm');
if (joinForm) {
	var frm = joinForm;
	var btnJoinConfirm = document.getElementById('joinFormConfirm');

	/* 이름 검사 */
	frm.userName.addEventListener('blur', function() { chkName(frm) });
	frm.userName.addEventListener('focusout', function() { chkName(frm) });

	/* 연락처 검사 */
	frm.tel.addEventListener('blur', function() { chkTel(frm) });
	frm.tel.addEventListener('focusout', function() { chkTel(frm) });

	/* 닉네임 검사 */
	frm.nickname.addEventListener('blur', function() { chkNik(frm) });
	frm.nickname.addEventListener('focusout', function() { chkNik(frm) });

	/* 비밀번호 검사 */
	frm.password.addEventListener('blur', function() { chkPw1(frm) });
	frm.password.addEventListener('focusout', function() { chkPw1(frm) });

	/* 비밀번호 일치 검사 */
	frm.rePassword.addEventListener('blur', function() { chkPw2(frm) });
	frm.rePassword.addEventListener('focusout', function() { chkPw2(frm) });

	/* 가입하기 버튼 누른 경우 */
	if (btnJoinConfirm) {
		btnJoinConfirm.addEventListener('click', chkJoinForm);
	}


}

function chkJoinForm() {
	var frm = document.getElementById('joinForm');

	chkName(frm);

	chkTel(frm);

	chkNik(frm);

	if (frm.pw.value === '') {
		alert('비밀번호를 입력해주세요');

		return false;
	}

	if (frm.pw.value !== frm.rePw.value) {
		alert('비밀번호를 확인해주세요');

		return false;
	}
}

function chkName($target) {

	var frm = $target;
	var input = frm.userName;
	var inputTxt = input.value;
	var areaErrMsg = input.closest('td').querySelector('.form-err-msg');

	var regName = /^[가-힣]{2,}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

	if (input.value === '') {
		var areaErrMsg = input.closest('td').querySelector('.form-err-msg');
		/*alert('이름을 입력해주세요');*/
		showFormErr(areaErrMsg, '이름을 입력해주세요');

		return false;
	}

	if (regName.test(inputTxt) === false) {
		showFormErr(areaErrMsg, '이름은 공백없이 한글 혹은 영문만 가능합니다.');

		return false;
	}


}


function chkTel($target) {

	var frm = $target;
	var input = frm.tel;
	var inputTxt = input.value;
	var areaErrMsg = input.closest('td').querySelector('.form-err-msg');

	if (inputTxt === '') {
		showFormErr(areaErrMsg, '연락처를 입력해주세요');

		return false;
	}

	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	var regPhone = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;

	inputTxt = inputTxt.replace(regExp, '');

	if (inputTxt.substring(0, 2) != '01') {
		showFormErr(areaErrMsg, '연락처는 핸드폰 번호만 가능합니다.');

		return false;
	}

	if (regPhone.test(inputTxt) === false) {
		showFormErr(areaErrMsg, '연락처를 다시 확인해주세요');

		return false;
	}

	if (regPhone.test(inputTxt) === true) {
		inputTxt = inputTxt.replace(regPhone, "$1-$2-$3");
		input.value = inputTxt;
	}
	
	var formData = new FormData(frm);
	
	$.ajax({
		type: 'POST',
		url: 'check-user-name',
		data: formData,
		processData: false,
		contentType: false,
		success: function(data) {
			console.log(data);
			if(data == 'exist') {
				showFormErr(areaErrMsg, '이미 존재하는 연락처입니다.');
				
				return false;
			}
		},
		error: function() {
			showFormErr(areaErrMsg, '전송오류');
		},
	});
	
	hideFormErr(areaErrMsg);
}


function chkNik($target) {

	var frm = $target;
	var input = frm.nickname;
	var inputTxt = input.value;
	var nikStartChat = inputTxt.substring(0, 1);
	var areaErrMsg = input.closest('td').querySelector('.form-err-msg');

	if (inputTxt === '') {
		showFormErr(areaErrMsg, '닉네임 입력해주세요');

		return false;
	}

	/* 닉네임 첫 글자 확인 */
	var regStartKor = /^[가-힣ㄱ-ㅎ]/;
	var regStartEng = /^[a-zA-Z]/;

	/* 닉네임 확인 */
	var regNickName = /^[가-힣ㄱ-ㅎa-zA-Z0-9.]{6,12}$/;

	/* 닉네임 첫 글자가 한글일 경우 */
	if (nikStartChat != '' && regStartKor.test(nikStartChat) === true) {

		var regKor = /^[가-힣ㄱ-ㅎ]{2,}/;

		if (regKor.test(inputTxt) === false) {
			showFormErr(areaErrMsg, '한글은 3자 이상 입력해야 합니다.');

			return false;
		}
	}

	/* 닉네임 첫 글자가 알파벳일 경우 */
	if (nikStartChat != '' && regStartEng.test(nikStartChat) === true) {
		var regEng = /^[a-zA-Z]{4,}/;

		if (regEng.test(inputTxt) === false) {
			showFormErr(areaErrMsg, '영문자는 4자 이상 입력해야 합니다.');

			return false;
		}
	}


	/* 닉네임 형식이 맞지 않은 경우 */
	if (regNickName.test(inputTxt) === false) {
		showFormErr(areaErrMsg, '닉네임을 다시 확인해주세요');

		return false;
	}


	if (regNickName.test(inputTxt) === true) {
		input.value = inputTxt;
		frm.isSameNik.value = 'N';
	}

	hideFormErr(areaErrMsg);
}

function chkPw1($target) {

	var frm = $target;
	var input = frm.password;
	var inputTxt = input.value;
	var areaErrMsg = input.closest('td').querySelector('.form-err-msg');

	var regPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;

	if (inputTxt == '') {
		showFormErr(areaErrMsg, '비밀번호를 입력해주세요');
	}

	if (regPassword.test(inputTxt) === false) {
		showFormErr(areaErrMsg, '문자, 숫자, 기호  3종류 조합으로 해주세요 (8~20 글자)');

		return false;
	}

	hideFormErr(areaErrMsg);
}

function chkPw2($target) {

	var frm = $target;
	var input = frm.rePassword;
	var inputTxt = input.value;
	var areaErrMsg = input.closest('td').querySelector('.form-err-msg');

	var regPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;

	if (inputTxt == '') {
		showFormErr(areaErrMsg, '비밀번호를 입력해주세요');
	}

	if (regPassword.test(inputTxt) === false) {
		showFormErr(areaErrMsg, '문자, 숫자, 기호  3종류 조합으로 해주세요 (8~20 글자)');

		return false;
	}

	if (inputTxt != frm.password) {
		showFormErr(areaErrMsg, '비밀번호가 일치하지 않습니다.');

		return false;
	}

	hideFormErr(areaErrMsg);
}



function showFormErr($obj, msg) {
	$obj.innerText = msg;
}

function hideFormErr($obj) {
	$obj.innerText = '';
}
