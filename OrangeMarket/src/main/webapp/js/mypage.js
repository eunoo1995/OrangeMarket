$(function(){
		$(".ex").click(function(){
			var src = $(".ex").attr("src");
			if(src == "/images/icons/favorite_color.png") {
				$(".ex").attr("src","/images/icons/favorite.png");
			} else {
				$(".ex").attr("src","/images/icons/favorite_color.png");
			}
		});
		//회원탈퇴 확인 팝업창	
		$("#myPage-withdrawal-btn").click(function(){
			window.open("withdrawal","회원탈퇴 확인","width=600, height=500, left=450, top=150");
		});
		//프로필 사진 버튼 연동
		$(".myPage-img-btn").click(function(){
			$("#myPage-img-file").click();
		});
	});
