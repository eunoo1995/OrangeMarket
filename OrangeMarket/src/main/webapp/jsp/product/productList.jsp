<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="product" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wraper -->
<article class="pg-wrap">

		<!-- 타이틀 및 메뉴 -->
		<header class="sub-page-head">
			<div class="cont-inner">
				<h2 class="sub-page-title">${category}</h2>
			</div>
		</header>
		
		<script>
			$(function(){
				$("#pro-write").click(function() {
					var seller = $("#seller").val();
					if($("#seller").val() == "") {
						alert("로그인이 필요한 기능입니다.");
					} else {
						location = "product-write";				
					}
					
				});
			});
		</script>
		
		<c:if test="${sessionId != null }">
			<button class="btn_menu" name="pro-write" id="pro-write">+</button>
		</c:if>
		<!-- 기본 정의 화면 -->
		<article>
			<!-- container -->
			<div class="cont-inner">
		<!-- 		<p class="list-total">
					총 <strong class="list-total__num">10</strong>개의 물품이 검색되었습니다.
				</p> -->
				<form name="frm" id="frm" method="post">
					<input type="hidden" name="seller" id="seller" value="${userId}">
					<input type="hidden" name="addr" id="addr" value="${addr}">
				</form>
				<!-- 리스트 화면 -->
				<ul class="pro-list">
					<!-- 상품 리스트 -->
					<c:forEach var="product" items="${list}">
 						<li class="list-item"
							onclick="location='product-list-detail?proCode=${product.proCode}'">
							<a href="#"> <!-- 상품 이미지 -->
								<figure class="pro-thumb">
									<span class="pro-thumb-img">
										<img src="<c:url value='/images/products/${product.imgs}'/>">
									</span>
									<span class="pro-detail-grade trust">${product.userLevel}</span>
								</figure> <!-- 상품 이미지 --> 
								
								<!-- 상품 내용 및 상세 내용 -->
								<div class="pro-detail">
									<input type="hidden" name="proCode" id="proCode" value="${product.proCode}">
 									<p class="pro-detail-tit">${product.title}</p>
									<p class="pro-detail-price">${product.price} 원</p>
									<p class="pro-detail-area">${product.addr}</p>
								</div> <!-- 상품 내용 및 상세 내용 -->
						</a>
						</li>
					</c:forEach>
				</ul>
	
			</div>
			<!-- container end -->
		</article>

</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="product" />
</jsp:include>
<!-- 푸터 -->