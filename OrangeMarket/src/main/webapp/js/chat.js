$(function(){
	// 채팅방 채팅 클릭시 해당 채팅방으로 이동
	$(".chatlist-item").click(function(){
		var channel = $(this).children("#nowChannel").val();
		$.ajax({
  			type : "post",
  			url  : "read-chat",
  			data : "channel="+channel,
  			datatype : "json",
  			success : function(data) {
  				location="chat?channel="+data;
  			},
  			error : function() {
  					alert("오류발생");
  			}
  		});
	});
	// 신규 메시지 전송
	$("#sendChat").click(function(){
		if($("#channel").val().trim() == "" ) {
  			alert("대화방을 선택 후 메세지를 전송해주세요.");
  			return false;
  		}
		if($("#input-text").val().trim() == "" ) {
  			alert("메세지를 입력하지 않았습니다.");
  			$("#input-text").focus();
  			return false;
  		}
		var formdata = $("#frm").serialize();
  		$.ajax({
  			type : "post",
  			url  : "chat-save",
  			data : formdata,
  			datatype : "json",
  			success : function(data) {
  				location="chat?channel="+data;
  			},
  			error : function() {
  					alert("전송실패");
  			}
  		});
	});
 	$("#input-text").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        // 인풋상자에서 엔터키 누를 시 버튼클릭 이벤트 발생
        if (key.keyCode == 13) {
        	if($("#channel").val().trim() == "" ) {
      			alert("대화방을 선택 후 메세지를 전송해주세요.");
      			return false;
      		}
    		if($("#input-text").val().trim() == "" ) {
      			alert("메세지를 입력하지 않았습니다.");
      			$("#input-text").focus();
      			return false;
      		}
            $("#sendChat").click();
        }
    });
	// 채팅 상대에게 물건 예약 기능
	$("#reserveProduct").click(function(){
		if(confirm("예약을 진행하시겠습니까?")) {
			var formdata = $("#reserve-frm").serialize();
			$.ajax({
				type : "post",
				data : formdata,
				url  : "reserve-product",
				datatype : "json",
				success : function(data) {
					if(data == "exist") {
						alert("이미 예약이 존재합니다.");
					} else {
						alert("거래가 예약 되었습니다.");
					}
				},
				error : function() {
						alert("오류발생");
				}
			});
		}
	});
});