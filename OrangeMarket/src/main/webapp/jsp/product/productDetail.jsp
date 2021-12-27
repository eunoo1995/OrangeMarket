<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="product" />
</jsp:include>
<!-- 헤더 -->
<c:set var="sessionId" value="${sessionId }"/>
<!-- 페이지 wraper -->
<article class="pg-wrap pg-pro-detail">


		<!-- 타이틀 및 메뉴 -->
		<header class="sub-page-head">
			<div class="cont-inner">
				<h2 class="sub-page-title">Category</h2>
			</div>
		</header>
		
		<script>
		$(function(){
			//관심 기능
			$("#like").click(function(){
				var formdata = $("#frm").serialize();
				alert("like");
			/* 					
			  		$.ajax({
			  			type : "post",
			  			url  : "like-product",
			  			data : formdata,
			  			processData : false,
			  			contentType : false,
			  			datatype : "text",
			  			success : function(data) {
		  					location='chat';
			  			},
			  			error : function (request, status, error){
							alert("전송 실패");
			  			}
			  		});
			 */
			});
			
			// 채팅 기능
			$("#chat").click(function(){
				var formdata = $("#frm").serialize();
					
			  		$.ajax({
			  			type : "post",
			  			url  : "create-chat",
			  			data : formdata,
			  			datatype : "text",
			  			success : function(data) {
		  					location="chat?channel"+data;
			  			},
			  			error: function(request, status, error){
			  				alert("code : " + request.status + "\n" 
			  				    + "message : " + request.responseText + "\n" 
			  				    + "error : " + error);
			  		    }
			  		});
			
			});
			
			//시세 조회 기능
			$("#avg-search").click(function(){
				var formdata = $("#frm").serialize();
				alert("avg-search");
			/* 					
			  		$.ajax({
			  			type : "post",
			  			url  : "like-product",
			  			data : formdata,
			  			processData : false,
			  			contentType : false,
			  			datatype : "text",
			  			success : function(data) {
		  					location='chat';
			  			},
			  			error : function (request, status, error){
							alert("전송 실패");
			  			}
			  		});
			 */
			});		
			
			//신고 기능
			$("#report").click(function(){
				var formdata = $("#frm").serialize();
				alert("avg-report");
/* 			  		$.ajax({
			  			type : "post",
			  			url  : "report-write",
			  			data : formdata,
			  			processData : false,
			  			contentType : false,
			  			datatype : "text",
			  			success : function(data) {
		  					location='chat';
			  			},
			  			error : function (request, status, error){
							alert("전송 실패");
			  			}
			  		}); */
			
			});
			
		});
		</script>

		<!-- 상세 정보 화면 -->
		<article class="pro-detail-wrap">
			<!-- container -->
			<div class="cont-inner">
				<input type="hidden" name="seller" id="seller" value="${product.seller}">
				<c:if test="${product.seller == sessionId}">
					<!-- 작성자에게 보이는 수정 및 삭제 버튼 -->
					<div class="btn-wrap txt-r user-btn-wrap">
						<button class="btn btn-solid-point" onclick="location='product-modify?proCode=${product.proCode }'">수정</button>
						<button class="btn btn-solid" onclick="location='product-delete?proCode=${product.proCode }'">삭제</button>
					</div>
				</c:if>
				
				
				
				<!-- 상품 내용 및 상세 내용 -->
				<div class="pro-detail-top">
					
					<div class="product-img-wrap">
						<!-- 제품 이미지 -->
						<img class="product-img" name="imgs" id="imgs"
							src="<c:url value='/images/products/${product.imgs}'/>">
					</div>
					
					
					
					<!-- 제품 정보 -->
					<div class="product-info">
						<div class="product-head">
							<h3 class="product-title" name="title" id="title">${product.title}</h3>
							<p class="product-price" name="price" id="price">${product.price} 원</p>
							<span class="product-grade" name="grade" id="grade">신뢰</span>
							<span style="float: right; color:#999;" name="report" id="report">신고</span>
						</div>
	
	
						<!-- 게시글 세부 정보 -->
						<div class="info-detail">
	
							<div class="mini-div"> 
								<!-- 닉네임 클릭 시 마이 페이지 이동 : 판매 내역 통한 다른 제품 판매 확인 -->
								<span class="user-nickname" style="font-size: 24px; float: right;">
									<a href="" name="sellerNik" id="sellerNik">${product.sellerNik }</a>
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
						
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="title" id="title" value="${product.title }">
							<input type="hidden" name="proCode" id="proCode" value="${product.proCode }">
							<input type="hidden" name="price" id="price" value="${product.price }">
							<input type="hidden" name="seller" id="seller" value="${product.seller }">
							<input type="hidden" name="proCode" id="proCode" value="${product.sellerNik }">
						</form>
						
						<div class="info-btn-wrap">
							<button type="button" class="btn btn-solid-point" name="like" id="like">관심</button>
							<button type="button" class="btn btn-solid" name="chat" id="chat">채팅</button>
							<button type="button" class="btn" name="avg-search" id="avg-search">시세조회</button>
	
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