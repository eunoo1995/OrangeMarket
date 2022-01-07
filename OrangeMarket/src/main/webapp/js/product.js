/* SellHistory.jsp start */

function updateStatus(proCode) {
	// 제품 코드, 상태 값
	var proCode = proCode;
	var selectStat1 = document.getElementById("status");
	var selectValue = selectStat1.options[selectStat1.selectedIndex].value;

	var statusConfirm = confirm('상태변경 시 수정이 불가능합니다.\n상태변경 하겠습니까?');
	if (statusConfirm) { location = "update-product-status?proCode=" + proCode + "&status=" + selectValue; }
	else {location = "sell-history";}
}

/* SellHistory.jsp end */


/* productWrite.jsp start */

/* 제품 등록 시 가격 출력 형식 변경 (예: 2000 -> 2,000) start */
function inputNumberFormat(obj) {
	obj.value = comma(uncomma(obj.value));
}

function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

/* 제품 등록 시 가격 출력 형식 변경 (예: 2000 -> 2,000) end */



$(function() {

	/* productWrite.jsp start */



	//작성 저장 ajax
	$("#pro-btn-save").click(function() {

		//제품 등록 유효성 검사
		if ($("#product-img-file").val() == "") {
			alert("사진을 등록 해주세요.");
			$("#product-img-file").focus();
			return false;
		}

		if ($("#title").val() == "") {
			alert("제목을 입력 해주세요.");
			$("#title").focus();
			return false;
		}

		if ($("#proCategoryCode").val() == "") {
			alert("카테고리를 선택 해주세요.");
			$("#proCategoryCode").focus();
			return false;
		}

		if ($("#keyword").val() == "") {
			alert("키워드를 입력 해주세요.");
			$("#keyword").focus();
			return false;
		}

		if ($("#refund").val() == "") {
			alert("환불여부를 선택 해주세요.");
			$("#refund").focus();
			return false;
		}

		if ($("#price").val() == "") {
			alert("가격을 입력 해주세요.");
			$("#price").focus();
			return false;
		}

		if ($("#nego").val() == "") {
			alert("가격협상 여부를 입력 해주세요.");
			$("#nego").focus();
			return false;
		}

		if ($("#content").val() == "") {
			alert("설명을 입력 해주세요.");
			$("#content").focus();
			return false;
		}

		var formdata = new FormData(document.getElementById("frm-product"));
		$.ajax({
			type: "post",
			url: "product-write-save",
			data: formdata,
			processData: false,
			contentType: false,
			datatype: "json", //성공여부(ok)
			success: function(data) {
				if (data == "ok") {
					location = 'product-list';
				} else {
					alert("저장 실패");
				}
			},
			error: function() {
				alert("error");
			}
		});
	});

	/* productWrite.jsp end */



	/* productModify start */

	/* 제품 수정 ajax */

	$("#pro-btn-modify").click(function() {

		/* 제품 유효성 검사 */
		if ($("#title").val() == "") {
			alert("제목을 입력 해주세요.");
			$("#title").focus();
			return false;
		}

		if ($("#proCategoryCode").val() == "") {
			alert("카테고리를 선택 해주세요.");
			$("#proCategoryCode").focus();
			return false;
		}

		if ($("#keyword").val() == "") {
			alert("키워드를 입력 해주세요.");
			$("#keyword").focus();
			return false;
		}

		if ($("#refund").val() == "") {
			alert("환불여부를 선택 해주세요.");
			$("#refund").focus();
			return false;
		}

		if ($("#price").val() == "") {
			alert("가격을 입력 해주세요.");
			$("#price").focus();
			return false;
		}

		if ($("#nego").val() == "") {
			alert("가격협상 여부를 입력 해주세요.");
			$("#nego").focus();
			return false;
		}

		if ($("#content").val() == "") {
			alert("설명을 입력 해주세요.");
			$("#content").focus();
			return false;
		}

		var formdata = new FormData(document.getElementById("frm-product"));
		$.ajax({
			type: "post",
			url: "product-modify-save",
			data: formdata,
			processData: false,
			contentType: false,
			datatype: "json", //성공여부(ok)
			success: function(data) {
				location = "product-list-detail?proCode=" + data;
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});

	/* productModify end */




	/* 1. 제품 등록 2. 제품 수정  이미지 변경, 미리보기 기능 start */

	//프로필 사진 미리보기 설정
	$("#imgs").click(function() {
		$("#product-img-file").click();
	});
	$("#product-img-file").on('change', function() {
		readURL(this);
	});


	//프로필 사진 미리보기 설정
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgs').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	/* 1. 제품 등록 2. 제품 수정  이미지 변경, 미리보기 기능 end */




	/* productList.jsp start */

	/* 제품 등록 시 동네인증 확인 여부 유효성 검사 */
	$(function() {
		$("#pro-write").click(function() {
			if ($("#addrPass").val() == "N") {
				alert("동네인증 후 거래를 이용 하실 수 있습니다.");
			} else {
				location = "product-write";
			}

		});
	});

	/* productList.jsp end */



	/* productDetail.jsp start */

	//관심 기능
	$("#like").click(function() {
		if ($("#userId").val() == "") {
			alert("로그인 후 이용해주세요.");
			return false;
		}
		if ($("#userId").val() == $("#seller").val()) {
			alert("작성한 글은 관심 등록할 수 없습니다.");
			return false;
		} else {
			var formdata = $("#frm").serialize();

			$.ajax({
				type: "post",
				url: "like-product-save",
				data: formdata,
				datatype: "json",
				success: function(data) {
					if (data == "ok") { location.reload(); }
					else if (data == "already") { alert("이미 등록하신 게시글 입니다."); return false; }
				},
				error: function(request, status, error) {
					alert("전송 실패");
				}
			});
		}
	});

	// 채팅 기능
	$("#chat").click(function() {
		if ($("#userId").val() == "") {
			alert("로그인 후 이용해주세요.");
			return false;
		}
		if ($("#userId").val() == $("#seller").val()) {
			alert("본인과의 채팅은 불가능합니다.");
			return false;
		}
		var formdata = $("#frm").serialize();
		$.ajax({
			type: "post",
			url: "create-chat",
			data: formdata,
			datatype: "json",
			success: function(data) {
				if (data == "exist") {
					alert("채팅이 이미 존재합니다.");
					return false;
				} else if (data == "notAddr") {
					alert("동네 인증 후 거래를 이용하실 수 있습니다.");
					return false;
				}
				location = "chat?channel=" + data;
			},
			error: function(request, status, error) {
				alert("code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + error);
			}
		});
	});

	//시세 조회 기능
	$("#avg-search").click(function() {
		var formdata = $("#frm").serialize();
		alert("avg-search");
		/* 					
					$.ajax({
						type : "post",
						url  : "like-product",
						data : formdata,
						processData : false,
						contentType : false,
						datatype : "json",
						success : function(data) {
							location='chat';
						},
						error : function (request, status, error){
						alert("전송 실패");
						}
					});
		 */
	});

	/* productDetail.jsp end */



	/* BuyHistory.jsp start */

	var proCode = $("#proCode").val();

	$("#good").click(function() {
		var goodConfirm = confirm('평가완료 시 수정이 불가능합니다.\n평가완료 하겠습니까?');
		if (goodConfirm) location = "update-user-level?stat=good&proCode=" + proCode;
	});

	$("#bad").click(function() {
		var badConfirm = confirm('평가완료 시 수정이 불가능합니다.\n평가완료 하겠습니까?');
		if (badConfirm) location = "update-user-level?stat=bad&proCode=" + proCode;
	});

	/* BuyHistory.jsp end */

});