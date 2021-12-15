/* trim  */
if (typeof String.trim == 'undefined') {
  String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s$)/g, '')
  };
}


/* 약관 */
var btnFormNext = document.getElementById('btnTermsNext');
if(btnFormNext) {
	btnFormNext.addEventListener('click', chkTerms);
}

function chkTerms() {
	var frm = document.getElementById('formTerms');
	
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
	
	
}


/* 회원가입 */
var btnJoinConfirm = document.getElementById('joinFormConfirm');
if(btnJoinConfirm) {
	btnJoinConfirm.addEventListener('click', chkJoinForm);
}

function chkJoinForm() {
	var frm = document.getElementById('joinForm');
	
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
	
	
}
