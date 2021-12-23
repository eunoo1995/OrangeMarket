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
	});
