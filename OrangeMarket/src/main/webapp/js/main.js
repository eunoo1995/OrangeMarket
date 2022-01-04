/* 제품 등록 버튼 */
$(function() {
	$("#pro-write").click(function() {
		var seller = $("#seller").val();
		if ($("#seller").val() == "") {
			alert("로그인이 필요한 기능입니다.");
		} else {
			location = "product-write";
		}

	});
});