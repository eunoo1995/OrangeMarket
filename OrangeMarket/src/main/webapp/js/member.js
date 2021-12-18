/* trim  */
if (typeof String.trim == "undefined") {
	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s$)/g, "");
	};
}

/* 약관 */
var joinTermsForm = document.getElementById("formTerms");
if (joinTermsForm) {
	var btnFormNext = document.getElementById("btnTermsNext");
	btnFormNext.addEventListener("click", chkTerms);

	function chkTerms() {
		var frm = document.getElementById("formTerms");

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
			alert("필수 약관은 반드시 동의가 필요합니다.");

			return false;
		}

		location.href = "join-form?l=" + locationTerm.checked;
	}
}


/* 회원가입 */
var joinForm = document.getElementById("joinForm");
if (joinForm) {
	var frm = joinForm;
	var btnJoinConfirm = document.getElementById("joinFormConfirm");
	var btnEmailVerif = document.getElementById("confirmEmail");
	var btnConfirmEmail = frm.querySelector("#btnConfirmEmail");

	/* 이름 검사 */
	frm.userName.addEventListener("blur", chkName);

	/* 연락처 검사 */
	frm.tel.addEventListener("blur", chkTel);

	/* 닉네임 검사 */
	frm.nickname.addEventListener("blur", chkNik);

	/* 비밀번호 검사 */
	frm.password.addEventListener("blur", chkPw1);

	/* 비밀번호 일치 검사 */
	frm.rePassword.addEventListener("blur", chkPw2);

	/* 이메일 형식 */
	frm.email.addEventListener("blur", chkEmail);

	/* 이메일 인증번호 */
	btnConfirmEmail.addEventListener("click", function() {
		var formData = "email=" + frm.email.value;
		frm.confirmEmail.readOnly = false;

		$.ajax({
			type: "POST",
			url: "send-verif-email",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
			},
			error: function() {
				showFormErr(areaErrMsg, "다시 시도해주세요");
				input.value = "";
			}
		});
	});

	/* 가입하기 버튼 누른 경우 */
	if (btnJoinConfirm) {
		btnJoinConfirm.addEventListener("click", chkJoinForm);
	}

	function chkJoinForm() {
		chkName();
		chkTel();
		chkNik();
		chkPw1();
		chkPw2();
		chkEmail();
	}

	function chkName() {
		var input = frm.userName;
		var inputTxt = input.value;
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		var regName = /^[가-힣]{2,}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

		if (input.value === "") {
			var areaErrMsg = input.closest("td").querySelector(".form-err-msg");
			/*alert('이름을 입력해주세요');*/
			showFormErr(areaErrMsg, "이름을 입력해주세요");

			return false;
		}

		if (regName.test(inputTxt) === false) {
			showFormErr(areaErrMsg, "이름은 공백없이 한글 혹은 영문만 가능합니다.");

			return false;
		}
	}

	function chkTel() {
		frm.telFlag.value = "N";

		var input = frm.tel;
		var inputTxt = input.value;
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		if (inputTxt === "") {
			showFormErr(areaErrMsg, "연락처를 입력해주세요");

			return false;
		}

		var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;

		inputTxt = inputTxt.replace(regExp, "");

		if (inputTxt.substring(0, 2) != "01") {
			showFormErr(areaErrMsg, "연락처는 핸드폰 번호만 가능합니다.");

			return false;
		}

		if (regPhone.test(inputTxt) === false) {
			showFormErr(areaErrMsg, "연락처를 형식을 확인해주세요");

			return false;
		}

		if (regPhone.test(inputTxt) === true) {
			input.value = inputTxt;
		}

		var formData = "tel=" + inputTxt;

		$.ajax({
			type: "POST",
			url: "check-usertel",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
				if (data == "exist") {
					showFormErr(areaErrMsg, "이미 존재하는 연락처입니다.");

					return false;
				} else if (data == "ok") {
					frm.telFlag.value = "Y";
				}
			},
			error: function() {
				showFormErr(areaErrMsg, "다시 시도해주세요");
			}
		});

		hideFormErr(areaErrMsg);
	}

	function chkNik() {
		frm.nikFlag.value = "N";

		var input = frm.nickname;
		var inputTxt = input.value;
		var nikStartChat = inputTxt.substring(0, 1);
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		if (inputTxt === "") {
			showFormErr(areaErrMsg, "닉네임 입력해주세요");

			return false;
		}

		/* 닉네임 첫 글자 확인 */
		if (inputTxt.length < 4) {
			var regStartKor = /^[가-힣ㄱ-ㅎ]/;
			var regStartEng = /^[a-zA-Z]/;

			/* 한글일 경우 */
			if (regStartKor.test(nikStartChat) === true) {
				var regKor = /^[가-힣ㄱ-ㅎ]{3,}/;

				if (regKor.test(inputTxt) === false) {
					showFormErr(areaErrMsg, "한글은 3자 이상 입력해야 합니다.");

					return false;
				}
			}

			/* 알파벳일 경우 */
			if (regStartEng.test(nikStartChat) === true) {
				var regEng = /^[a-zA-Z]{4,}/;

				if (regEng.test(inputTxt) === false) {
					showFormErr(areaErrMsg, "영문자는 4자 이상 입력해야 합니다.");

					return false;
				}
			}
		}

		/* 닉네임 확인 */
		var regNickName = /^[가-힣ㄱ-ㅎa-zA-Z0-9.]{3,12}$/;

		/* 닉네임 형식이 맞지 않은 경우 */
		if (regNickName.test(inputTxt) === false) {
			showFormErr(areaErrMsg, "한글, 영문, 숫자, 마침표만 사용 가능합니다 (3-12자)");

			return false;
		}

		var formData = { nickname: inputTxt };
		nikFlag = false;
		$.ajax({
			type: "POST",
			url: "check-nikname",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
				if (data == "exist") {
					showFormErr(areaErrMsg, "이미 존재하는 닉네임입니다.");

					return false;
				} else if (data == "ok") {
					frm.nikFlag.value = "Y";
				}
			},
			error: function() {
				showFormErr(areaErrMsg, "다시 시도해주세요");
			}
		});

		hideFormErr(areaErrMsg);
	}

	function chkPw1() {
		frm.pwFlag.value = "N";

		var input = frm.password;
		var inputTxt = input.value;
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		if (inputTxt == "") {
			showFormErr(areaErrMsg, "비밀번호를 입력해주세요");

			return false;
		}

		var formData = { password: inputTxt };
		$.ajax({
			type: "POST",
			url: "check-password",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
				if (data == "err") {
					showFormErr(areaErrMsg, "문자, 숫자, 기호  3종류 조합으로 해주세요 (8-20 글자)");

					return false;
				}
			},
			error: function() {
				showFormErr(areaErrMsg, "다시 시도해주세요");
				input.value = "";
			}
		});

		hideFormErr(areaErrMsg);
	}

	function chkPw2() {
		var input = frm.rePassword;
		var inputTxt = input.value;
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		if (inputTxt == "") {
			showFormErr(areaErrMsg, "비밀번호를 입력해주세요");

			return false;
		}

		if (inputTxt != frm.password.value) {
			showFormErr(areaErrMsg, "비밀번호가 일치하지 않습니다.");

			return false;
		}

		var formData = "password=" + inputTxt;
		$.ajax({
			type: "POST",
			url: "check-password",
			data: formData,
			dataType: "text",
			success: function(data) {
				console.log(data);
				if (data == "err") {
					showFormErr(areaErrMsg, "문자, 숫자, 기호  3종류 조합으로 해주세요 (8-20 글자)");

					return false;
				} else if (data == "ok") {
					frm.pwFlag.value = "Y";
				}
			},
			error: function() {
				showFormErr(areaErrMsg, "다시 시도해주세요");
				input.value = "";
			}
		});

		hideFormErr(areaErrMsg);
	}

	function chkEmail() {
		var input = frm.email;
		var inputTxt = input.value;
		var areaErrMsg = input.closest("td").querySelector(".form-err-msg");

		btnConfirmEmail.disabled = true;

		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (inputTxt == "") {
			showFormErr(areaErrMsg, "이메일을 입력해주세요");

			return false;
		}

		if (regEmail.test(inputTxt) === false) {
			showFormErr(areaErrMsg, "이메일 형식을 확인해주세요");

			return false;
		}

		btnConfirmEmail.disabled = false;

		hideFormErr(areaErrMsg);
	}
}

function showFormErr($obj, msg) {
	$obj.innerText = msg;
}

function hideFormErr($obj) {
	$obj.innerText = "";
}
