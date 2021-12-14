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
<script>

</script>
</head>
<body>
	<%@include file="/include/admin_header.jsp" %>
	<%@include file="/include/admin_nav.jsp" %>
	
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">문의 리스트</div>
    		<div class="section-content">
    			<div class="section-search">
		    		<select name="">
						<option value="">아이디</option>	    		
						<option value="">닉네임</option>	    		
		    		</select>
		    		<input type="text" name="" value="" placeholder="검색하실 내용을 입력하세요.">
		    		<button type="submit" onclick=""><img src="/images/admin/search_w.png"></button>
    			</div>
    			<div class="inquiry-count">
    				대기 : 1 / 완료 : 3
    			</div>
				<div class="section-main">
					<table>
						<colgroup>
							<col width="5%">
							<col width="35%">
							<col width="15%">
							<col width="15%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<th></th>
							<th>제목</th>
							<th>판매자</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>상태</th>
						</tr>
						<!-- 반복문 사용 예정 -->
						<tr>
							<td>4</td>
							<td><a href="javascript:report_detail()">에어팟 팔아요~~</a></td>
							<td>사기꾼</td>
							<td>홍길동</td>
							<td>2021-01-01</td>
							<td>대기</td>
						</tr>
					</table>
					<div style="width:1000px; margin-top:50px; text-align:center;">《 1 2 3 4 5 》</div>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>