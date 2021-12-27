$(function(){
		// 관심버튼 클릭시 빈하트 이벤트
		$(".ex").click(function(){
			$(".ex").attr("src","/images/icons/favorite.png");
		});
		//회원탈퇴 확인 팝업창	
		$("#myPage-withdrawal-btn").click(function(){
			window.open("withdrawal","회원탈퇴 확인","width=600, height=500, left=450, top=150");
		});
		//프로필 사진 버튼 연동
		$(".myPage-img-btn").click(function(){
			$("#myPage-img-file").click();
		});
		$("#myPage-img-file").change(function(){
		if(confirm("선택하신 사진으로 변경하시겠습니까?")) {
			var formdata = new FormData(document.getElementById("frm-profile"));
			$.ajax({
	  			type : "post",
	  			url  : "change-profile",
	  			data : formdata,
	  			processData : false,
	  			contentType : false,
	  			datatype : "text",
	  			success : function(data) {
	  					location="mypage";
	  			},	
	  			error : function() {
	  					alert("오류발생");
	  			}
	  		});
		}
	});
	$("#addMyKeyword").click(function(){
		var mykeyword = $("#mykeyword").val();
		if(mykeyword.trim() == "") {
			alert("키워드를 입력해주세요.");
			$("#mykeyword").val("");
			$("#mykeyword").focus();
			return false;
		} 
		if(mykeyword.trim().length > 20) {
			alert("키워드 단어는 20자 이내로 작성해주세요.");
			$("#mykeyword").val("");
			$("#mykeyword").focus();
			return false;
		} 
		$.ajax({
			type : "post",
			url  : "mykeyword-save",
			data : "mykeyword="+mykeyword,
			datatype : "text",
			success : function(data) {
					location="mypage";
			},	
			error : function() {
					alert("오류발생");
			}
		});
	});
	$("#mykeyword").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        // 인풋상자에서 엔터키 누를 시 버튼클릭 이벤트 발생
        if (key.keyCode == 13) {
        	if($("#mykeyword").val().trim() == "") {
    			alert("키워드를 입력해주세요.");
    			$("#mykeyword").focus();
    			return false;
    		}
            $("#addMyKeyword").click();
        }
    });
	$("#withdrawalBtn").click(function(){
		if($("#userPw").val().trim() == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if($("#userPw").val().trim() != "") {
			var userPw = $("#userPw").val();
			$.ajax({
				type : "post",
				data : "userPw="+userPw,
				url  : "withdrawal-pwcheck",
				datatype : "text",
				success : function(data) {
	  				if(data == "1") {
		
					} else {
						alert("입력하신 비밀번호를 확인하세요.");
						return false;
					}
	  			},
	  			error : function() {
	  					alert("오류발생");
				}
			});
		}
		if(!$("#agreeChk").is(":checked")) {
			alert("탈퇴동의를 체크하지 않으셨습니다.");
			return false;
		}
		if(confirm("정말 탈퇴하시겠습니까?")) {
			var reason = $("#reason").val();
			$.ajax({
				type : "post",
				data : "reason="+reason,
				url  : "update-withdrawal",
				datatype : "text",
				success : function(data) {
	  				if(data == "1") {
	  					alert("지금까지 오렌지마켓을 이용해주셔서 감사합니다.");
	  					self.close();
	  					opener.location.href = "main";
	  				} else {
	  					alert("탈퇴실패");
	  				}
	  			},
	  			error : function() {
	  					alert("오류발생");
	  			}
			});
		}
	});
});
