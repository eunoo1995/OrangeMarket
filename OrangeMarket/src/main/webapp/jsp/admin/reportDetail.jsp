<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrangeMarket 관리자 페이지</title>
<link rel="stylesheet" href="/css/admin_main.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script>
$(function(){
	// 문의 답변 팝업등록
	$("#reportResponseBtn").click(function(){
		if($("#reContent").val().trim() == "") {
			alert("답변을 입력해주세요.");
			return false;
		}
		if(confirm("판매자의 신고횟수를 추가하시겠습니까?")) {
			$("#sellerNik").val("Y");
		}
		var formdata = $("#frm-report").serialize();
		if(confirm("작성하신 답변은 수정하실 수 없습니다.\n답변을 등록하시겠습니까?")) {
			$.ajax({
				type : "post",
				data : formdata,
				url  : "response-report",
				datatype : "text",
				success : function(data) {
					if(data == "1") {
						self.close();
						opener.location.href = "admin-reportlist";
					} else if (data == "2") {
						alert("운영정책에 의해 해당 계정이 정지됩니다.");
						self.close();
						opener.location.href = "admin-reportlist";
					} else {
						return false;
					}
				},
				error : function() {
  					alert("오류발생");
  				}
			});
		}
	});	
});
</script>
<body>
	<div class="inquiry-main">
		<div class="inquiry-content">
			<table class="inquiry-table">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="30%">
			</colgroup>
				<tr>
					<th>제목</th>
					<td colspan="3">${vo.title}</td>
				</tr>
				<tr>
					<th>판매자</th>
					<td colspan="3">${vo.sellerNik}</td>
				</tr>		
				<tr>
					<th>신고자</th>
					<td>${vo.writerNik}</td>
					<th>신고일</th>
					<td>${vo.rdate}</td>
				</tr>
				<tr>	
					<th height="180px">내용</th>
					<td colspan="3">${vo.content}</td>
				</tr>
			</table>
		</div>
		<div class="inquiry-response">
		<form id="frm-report">
			<input type="hidden" name="unq" id="unq" value="${vo.unq}">
			<input type="hidden" name="seller" id="seller" value="${vo.seller}">
			<input type="hidden" name="sellerNik" id="sellerNik" value="">
			<c:choose>
				<c:when test="${vo.reContent != null}">
				<textarea class="inquiry-textarea" style="resize:none;" readonly>${vo.reContent}</textarea>
				<button type="button" class="inquiry-response-btn">답변완료</button>
				</c:when>
				<c:when test="${vo.reContent == null}">
				<textarea class="inquiry-textarea" name="reContent" id="reContent" style="resize:none;"></textarea>
				<button type="button" id="reportResponseBtn" class="inquiry-response-btn">답변등록</button>
				</c:when>
			</c:choose>
		</form>	
		</div>
	</div>
</body>
</html>