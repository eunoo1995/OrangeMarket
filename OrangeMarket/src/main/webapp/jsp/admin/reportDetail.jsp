<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrangeMarket 관리자 페이지</title>
<link rel="stylesheet" href="/css/admin_main.css">
</head>
<body>
	<div class="inquiry-main">
		<div class="inquiry-title">
			신고내용 상세보기
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
					<td colspan="3">에어팟 팔아요~</td>
				</tr>	
				<tr>
					<th>신고자</th>
					<td>홍길동</td>
					<th>신고일</th>
					<td>2021-01-01</td>
				</tr>
				<tr>	
					<th height="180px">내용</th>
					<td colspan="3">아아앙~~<br>asdfas<br>safsadgsadfa</td>
				</tr>
			</table>
		</div>
		<div class="inquiry-response">
			<textarea class="report-textarea"></textarea>
			<button type="button" class="report-response-btn" value="">답변등록</button>
		</div>
	</div>
</body>
</html>