<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="product" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wraper -->
<article class="pg-wrap pg-pro-detail">


		<!-- 타이틀 및 메뉴 -->
		<header class="sub-page-head">
			<div class="cont-inner">
				<h2 class="sub-page-title">Category</h2>
			</div>
		</header>

		<!-- 상세 정보 화면 -->
		<article class="pro-detail-wrap">
			<!-- container -->
			<div class="cont-inner">
				<!-- 작성자에게 보이는 수정 및 삭제 버튼 -->
				<div class="btn-wrap txt-r user-btn-wrap">
					<button class="btn btn-solid-point" onclick="location='product-modify?proCode=${product.proCode }'">수정</button>
					<button class="btn btn-solid" onclick="location='product-delete?proCode=${product.proCode }'">삭제</button>
				</div>
	
				<!-- 상품 내용 및 상세 내용 -->
				<div class="pro-detail-top">
					
					<div class="product-img-wrap">
						<!-- 제품 이미지 -->
						<img class="product-img"
							src="<c:url value='/images/product/org_goods/${product.imgs}'/>">
					</div>
	
					<!-- 제품 정보 -->
					<div class="product-info">
						<div class="product-head">
							<h3 class="product-title">${product.title}</h3>
							<p class="product-price">${product.price}</p>
							<p class="product-grade">평가점수</p>
						</div>
	
	
						<!-- 게시글 세부 정보 -->
						<div class="info-detail">
	
							<div class="mini-div"> 
								<!-- 닉네임 클릭 시 마이 페이지 이동 : 판매 내역 통한 다른 제품 판매 확인 -->
								<span class="user-nickname" style="font-size: 24px; float: right;">
									<a href="">${product.sellerNik }</a>
								</span>
							</div>					
	
							<ul class="info-icon-count">
								<!-- 999 이상 시 999+ 표시 -->
								<!-- 관심수 -->
								<li><img class="first-icon"
									src="<c:url value='/images/icons/favorite.png'/>"> <span
									class="count">0</span></li>
	
								<!-- 채팅수 -->
								<li><img class="other-icon"
									src="<c:url value='/images/icons/comment.png'/>"> <span
									class="count">0</span></li>
	
								<!-- 조회수 -->
								<li><img class="other-icon"
									src="<c:url value='/images/icons/search.png'/>"> <span
									class="count">${product.hits }</span></li>
							</ul>
							
							<!-- 환불 여부 -->
							<div class="mini-div">
								<span class="mini-title">·환불여부</span> <span class="mini-content">${product.refund}</span>
							</div>
	
							<!-- 배송 여부 -->
							<div class="mini-div">
								<span class="mini-title">·가격협의</span> <span class="mini-content">${product.nego }</span>
							</div>
	
							<!-- 거래 지역 -->
							<div class="mini-div">
								<span class="mini-title">·거래지역</span> <span class="mini-content">${product.addr}</span>
							</div>
	
						</div>
	
						<div class="info-btn-wrap">
							<button type="button" class="btn btn-solid-point">관심</button>
							<button type="button" class="btn btn-solid">채팅</button>
							<button type="button" class="btn">시세조회</button>
	
						</div>
	
					</div>
				</div>
				<!-- 상품 내용 및 상세 내용 end -->
	
				<!-- 제품 설명란 -->
				<div class="product-content">
					<p class="product-content-title">상품정보</p>
	
					<div class="product-content-detail">
						${product.content }
					</div>
				</div>
	
	
				<!-- 연관 상품 -->
				<div class="related-listView">
	
					<!-- 연관 상품 표시 -->
					<div class="related-text">
						<!-- 실제 구현 시 키워드는 표시하지 않고 연관 상품만 표시 -->
						<p class="rel-title">연관상품 (키워드 : ${product.keyword })</p>
					</div>
	
					<!-- 연관 상품 리스트  -->
					<ul class="pro-list related-list">
						<c:forEach var="i" begin="1" end="5">
							<!--  연관 상품 -->
							<li class="list-item"><a
								href="productListDetail.do?category=category"> <!-- 상품 이미지 -->
									<figure class="pro-thumb">
										<span class="pro-thumb-img"><img
											src="<c:url value='/images/product/org_goods/test_goods0${i}.jpeg'/>"></span>
									</figure> <!-- 상품 내용 및 상세 내용 -->
									<div class="pro-detail">
										<p class="pro-detail-tit">제품명</p>
									</div> <!-- 상품 내용 및 상세 내용 -->
							</a></li>
						</c:forEach>
					</ul>
	
				</div>
	
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