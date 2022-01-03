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
<script src="/js/admin.js"></script>
<body>
	<div class="inquiry-main">
		<div class="inquiry-title">
			[${vo.category}]
		</div>
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
					<td colspan="3">[${vo.category}] ${vo.title}</td>
				</tr>	
				<tr>
					<th>닉네임</th>
					<td>${vo.nikName}</td>
					<th>문의일</th>
					<td>${vo.rdate}</td>
				</tr>
				<tr>	
					<th height="180px">내용</th>
					<td colspan="3">${vo.content}</td>
				</tr>
			</table>
		</div>
		<div class="inquiry-response">
		<form id="frm-inquiry">
			<input type="hidden" name="unq" id="unq" value="${vo.unq}">
			<c:choose>
				<c:when test="${vo.reContent != null}">
				<textarea class="inquiry-textarea" style="resize:none;" readonly>${vo.reContent}</textarea>
				<button type="button" class="inquiry-response-btn">답변완료</button>
				</c:when>
				<c:when test="${vo.reContent == null}">
				<textarea class="inquiry-textarea" name="reContent" id="reContent" style="resize:none;"></textarea>
				<button type="button" id="inquiryResponseBtn" class="inquiry-response-btn">답변등록</button>
				</c:when>
			</c:choose>
			</form>	
		</div>
	</div>
</body>
</html>