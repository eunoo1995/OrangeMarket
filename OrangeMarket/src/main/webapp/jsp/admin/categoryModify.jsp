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
	<%@include file="/include/admin_header.jsp" %>
	<%@include file="/include/admin_nav.jsp" %>
	
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">카테고리 메뉴관리1</div>
    		<div class="section-content">
    			<div class="category-menu">
    				<div class="category-title">
		    			<p>· CATEGORY ·</p>
		    		</div>
		    		<ul class="category-list">
		    			<li><input type="checkbox" id="chk">여성의류/잡화/뷰티</li>
		    			<li><input type="checkbox" id="chk">남성의류/잡화</li>
		    			<li><input type="checkbox" id="chk">디지털기기/생활가전</li>
		    			<li><input type="checkbox" id="chk">가구/인테리어</li>
		    			<li><input type="checkbox" id="chk">취미/문구</li>
		    			<li><input type="checkbox" id="chk">도서/티켓/음반</li>
		    			<li><input type="checkbox" id="chk">생활/주방용품</li>
		    			<li><input type="checkbox" id="chk">반려동물용품</li>
		    			<li><input type="checkbox" id="chk">기타</li>
		    		</ul>
		    		<div class="category-del">
		    			<span>*선택한 카테고리 게시글이 있는 경우 삭제 불가</span>
		    			<input type="text" placeholder="추가하실 카테고리를 입력하세요."><br>
		    			<button type="button">삭제</button>
		    			<button type="button">추가</button>
    				</div>
    			</div>
    			<div class="category-add">
    				
    				
    				
    			</div>
    		</div>
    	</div>
    </section>
</body>
</html>