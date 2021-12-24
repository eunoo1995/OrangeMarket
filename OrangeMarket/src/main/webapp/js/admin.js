// 회원목록 상세 이벤트
$(function(){
	$('.detail-btn').click(function(){
		var currentRow = $(this).closest('tr');
		var detail = currentRow.next('tr');
		if(!detail.is(':visible')) {
			detail.show();
			$(this).attr('src', '/images/admin/icon_up.png');
		} else {
			detail.hide();
			$(this).attr('src', '/images/admin/icon_down.png');
		}
	});
});
// 신고 문의 답변 팝업창
function inquiry_detail() {
	window.open('inquiryDetail.jsp','','width=450, height=400, left=540, top=150');		
}
function report_detail() {
	window.open('reportDetail.jsp','','width=450, height=400, left=540, top=150');		
}
// 관리자 로그인 화면
$(function(){
		$("#adminLogin").click(function(){
			if($("#adminId").val().trim() == "") {
				alert("아이디를 입력하세요");
				$("#adminId").focus();
				return false;
			}
			if($("#adminPass").val().trim() == "") {
				alert("비밀번호를 입력하세요");
				$("#adminPass").focus();
				return false;
			}
			var formdata = $("#frm").serialize();
	  		$.ajax({
	  			type : "post",
	  			url  : "admin-confirm-login",
	  			data : formdata,
	  			datatype : "text",
	  			success : function(data) {
	  				if(data == "er1") {
	  					alert("존재하지 않는 아이디입니다.");
	  					location="admin-login";
	  				} else if(data == "er2") {
	  					alert("비밀번호를 확인하세요.");
	  					location="admin-login";
	  				} else {
	  					location="admin-memberlist";
	  				}
	  			},
	  			error : function() {
	  					alert("오류발생");
	  			}
	  		});
		});	
		$("#adminPass").keydown(function(key) {
	        //키의 코드가 13번일 경우 (13번은 엔터키)
	        // 인풋상자에서 엔터키 누를 시 버튼클릭 이벤트 발생
	        if (key.keyCode == 13) {
	        	if($("#adminId").val().trim() == "") {
					alert("아이디를 입력하세요");
					$("#adminId").focus();
					return false;
				}
				if($("#adminPass").val().trim() == "") {
					alert("비밀번호를 입력하세요");
					$("#adminPass").focus();
					return false;
				}
	            $("#adminLogin").click();
	        }
	    });
	});