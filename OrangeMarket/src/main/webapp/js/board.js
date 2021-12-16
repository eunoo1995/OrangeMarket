$(function(){
	
	$('.QnA-title').click(function(){
		var detail = $(this).next('div');
		 if(!detail.is(':visible')) {
				detail.slideDown('300');
			} else {
				detail.slideUp('300');
			}
    });
	//문의하기 작성 저장 ajax
	$("#inquiryWrite").click(function(){
			
	  		if($("#title").val() == "" ) {
	  			alert("제목을 입력해주세요.");
	  			$("#title").focus();
	  			return false;
	  		}
	  		if($("#content").val() == "" ) {
	  			alert("내용을 입력해주세요.");
	  			$("#content").focus();
	  			return false;
	  		}
	  		
	  		var formdata = $("#frm").serialize();
	  		
	  		$.ajax({
	  			type : "post",
	  			url  : "inquiry-write-save",
	  			data : formdata,
	  			datatype : "text", //성공여부(ok)
	  			success : function(data) {
	  				if(data == "ok") {
	  					alert("저장성공");
	  					location="inquiry-list";
	  				} else {
	  					alert("저장실패");
	  				}
	  			},
	  			error : function() {
	  					alert("오류발생");
	  			}
	  		});
	  	});
	
});