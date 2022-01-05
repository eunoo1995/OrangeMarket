/* 제품 등록 버튼 */
$(function() {
	$("#pro-write").click(function() {
		if ($("#addrPass").val() == "N") {
			alert("동네인증 후 거래를 이용 하실 수 있습니다.");
		} else {
			location = "product-write";
		}

	});
});