<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrangeMarket 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/admin_main.css">

<script src="/js/admin.js"></script>
        
</head>
<body>
	<%@include file="/include/admin_header.jsp" %>
	<%@include file="/include/admin_nav.jsp" %>
	
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">통계</div>
    		<div class="section-content">
				<div class="section-main">
					<table class="statistics-table">
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tr>
							<th style="font-weight:bold;">회원 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th>정지회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th>탈퇴회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">방문 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체방문자</th>
							<td>00</td>
						</tr>
						<tr>
							<th>금일방문자</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">게시글 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체게시글</th>
							<td>00</td>
						</tr>
						<tr>
							<th>신규게시글</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">문의 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th>대기문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th>완료문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">신고 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체신고</th>
							<td>00</td>
						</tr>
						<tr>
							<th>대기신고</th>
							<td>00</td>
						</tr>
						<tr>
							<th>완료신고</th>
							<td>00</td>
						</tr>
					</table>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>