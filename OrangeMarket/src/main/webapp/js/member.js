/* trim  */
if (typeof String.trim == 'undefined') {
<<<<<<< HEAD
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s$)/g, '')
	};
=======
  String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s$)/g, '')
  };
>>>>>>> a732743f4b3859b9ba035068dda58d997d24998c
}


/* 약관 */
var btnFormNext = document.getElementById('btnTermsNext');
<<<<<<< HEAD
if (btnFormNext) {
=======
if(btnFormNext) {
>>>>>>> a732743f4b3859b9ba035068dda58d997d24998c
	btnFormNext.addEventListener('click', chkTerms);
}

function chkTerms() {
	var frm = document.getElementById('formTerms');
<<<<<<< HEAD

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


=======
	
	var locationTerm = frm.querySelector('input[name="agreeLocation"]');
	var mustTerms = frm.querySelectorAll('input[name="agreeMust"]');
	var mustLength = mustTerms.length;
	var cntMustChecked = 0; 
	
	for(var i=0; i < mustLength; i++) {
		if(mustTerms[i].checked == true) {
			cntMustChecked++;	
		}
	}
	
	if(cntMustChecked < mustLength) {
		alert('필수 약관은 반드시 동의가 필요합니다.');
		
		return false;
	}
	
	location.href='join-form?l='+locationTerm.checked;
	
	
>>>>>>> a732743f4b3859b9ba035068dda58d997d24998c
}


/* 회원가입 */
var btnJoinConfirm = document.getElementById('joinFormConfirm');
<<<<<<< HEAD
if (btnJoinConfirm) {
=======
if(btnJoinConfirm) {
>>>>>>> a732743f4b3859b9ba035068dda58d997d24998c
	btnJoinConfirm.addEventListener('click', chkJoinForm);
}

function chkJoinForm() {
	var frm = document.getElementById('joinForm');
<<<<<<< HEAD

	if (frm.userName.value === '') {
		alert('이름을 입력해주세요');

		return false;
	}

	if (frm.tel.value === '') {
		alert('연락처를 입력해주세요');

		return false;
	}

	if (frm.tel.value.indexOf('-') > 0) {
		alert('연락처는 - 없이 숫자만 입력해주세요');

		return false;
	}

	var telPattern = (/^0([0-9]{2})|^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");

	if (telPattern.test(frm.tel.value) === true) {
		console.log(frm.tel.value + '')
	}



	if (frm.pw.value === '') {
		alert('비밀번호를 입력해주세요');

		return false;
	}


	if (frm.pw.value !== frm.rePw.value) {
		alert('비밀번호를 확인해주세요');

		return false;
	}


=======
	
	if(frm.userName.value === '') {
		alert('이름을 입력해주세요');
		
		return false;
	}
	
	if(frm.tel.value === '') {
		alert('연락처를 입력해주세요');
		
		return false;
	}
	
	if(frm.nickname.value === '') {
		alert('연락처를 입력해주세요');
		
		return false;
	}
	
	if(frm.pw.value === '') {
		alert('비밀번호를 입력해주세요');
		
		return false;
	}
	
	if(frm.pw.value !== frm.rePw.value) {
		alert('비밀번호를 확인해주세요');
		
		return false;
	}
	
	
	if(frm.email.value === '') {
		alert('이메일 입력해주세요');
		
		return false;
	}
	
	if(frm.email.value === '') {
		alert('비밀번호를 입력해주세요');
		
		return false;
	}
	
	
>>>>>>> a732743f4b3859b9ba035068dda58d997d24998c
}
