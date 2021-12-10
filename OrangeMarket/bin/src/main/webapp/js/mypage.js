$(function(){
		$(".ex").click(function(){
			var src = $(".ex").attr("src");
			if(src == "../images/favorite_color.png") {
				$(".ex").attr("src","../images/favorite_empty.png");
			} else {
				$(".ex").attr("src","../images/favorite_color.png");
			}
		});
		//회원탈퇴 확인 팝업창	
		$("#myPage-withdrawal-btn").click(function(){
			window.open("withdrawal.jsp","","width=600, height=500, left=450, top=150");
		});
		//프로필 사진 미리보기 설정
		$(".myPage-img-btn").click(function(){
			$("#myPage-img-file").click();
		});
		$("#myPage-img-file").on('change', function(){
		    readURL(this);
		});
	});
	//프로필 사진 미리보기 설정
	function readURL(input) {
	    if (input.files && input.files[0]) {
	       var reader = new FileReader();
	       reader.onload = function (e) {
	          $('.myPage-img').attr('src', e.target.result);
	       }
	       reader.readAsDataURL(input.files[0]);
	    }
	}