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
				<h2 class="sub-page-title">상세 화면</h2>
			</div>
		</header>
		
		<script>
		$(function(){
			//관심 기능
			$("#like").click(function(){
				if($("#userId").val() == "") {
					alert("로그인 후 이용해주세요.");
					return false;
				}
				if($("#userId").val() == $("#seller").val()) {
					alert("작성한 글은 관심 등록할 수 없습니다.");
					return false;
				} else {
				var formdata = $("#frm").serialize();
	
					$.ajax({
							type : "post",
				  			url  : "like-product-save",
				  			data : formdata,
				  			datatype : "text",
			  				success : function(data) {
			  					if(data == "ok") { alert("등록 완료"); location.reload(); }
			  					else if (data == "already") { alert("이미 등록하신 게시글 입니다."); return false; }
				  			},
				  			error : function (request, status, error){
								alert("전송 실패");
				  			}
				  		});
					}
				});
			
			// 채팅 기능
			$("#chat").click(function(){
				if($("#userId").val() == "") {
					alert("로그인 후 이용해주세요.");
					return false;
				}
				if($("#userId").val() == $("#seller").val()) {
					alert("본인과의 채팅은 불가능합니다.");
					return false;
				}
				var formdata = $("#frm").serialize();
		  		$.ajax({
		  			type : "post",
		  			url  : "create-chat",
		  			data : formdata,
		  			datatype : "text",
		  			success : function(data) {
		  				if(data == "exist") {
		  					alert("채팅이 이미 존재합니다.");
		  					return false;
		  				}
	  					location="chat?channel="+data;
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
				if( $("#userId").val() == "" || $("#userId").val() == null ) {
					alert("로그인이 필요한 기능입니다.");
					return false;
				} else if($ ("#userId").val() == $("#seller").val() ) {
					alert("작성한 글은 신고할 수 없습니다.");
					return false;
				}
				var proCode = $("#proCode").val();
				location="report-write?proCode="+proCode;
			});
			
		});
		</script>

		<!-- 상세 정보 화면 -->
		<article class="pro-detail-wrap">
			<!-- container -->
			<div class="cont-inner">
				<c:if test="${product.seller == sessionId}">
					<!-- 작성자에게 보이는 수정 및 삭제 버튼 -->
					<div class="btn-wrap txt-r user-btn-wrap">
						<button class="btn btn-solid-point" onclick="location='product-modify?proCode=${product.proCode }'">수정</button>
						<button class="btn btn-solid" onclick="location='product-delete?proCode=${product.proCode }'">삭제</button>
					</div>
				</c:if>
				
				<form name="frm" id="frm" method="post">
					<input type="hidden" name="title" id="title" value="${product.title }">
					<input type="hidden" name="proCode" id="proCode" value="${product.proCode }">
					<input type="hidden" name="proCategoryCode" id="proCategoryCode" value="${product.proCategoryCode }">
					<input type="hidden" name="price" id="price" value="${product.price }">
					<input type="hidden" name="seller" id="seller" value="${product.seller }">
					<input type="hidden" name="sellerNik" id="sellerNik" value="${product.sellerNik }">
					<input type="hidden" name="userId" id="userId" value="${sessionId}">
				</form>
				
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
							<span class="product-grade" name="grade" id="grade">${product.userLevel}</span>
							<a style="float: right; color:#999; text-decoration: underline; cursor:pointer;" name="report" id="report">신고</a>
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
									<c:choose>
										<c:when test="${likeCnt == 0}">src="<c:url value='/images/icons/favorite.png'/>"</c:when>
										<c:when test="${likeCnt == 1}">src="<c:url value='/images/icons/favorite_color.png'/>"</c:when>
									</c:choose>
									> 
									<span
									class="count">${product.likeAllCnt }</span></li>
	
								<!-- 채팅수 -->
								<li><img class="other-icon"
									src="<c:url value='/images/icons/comment.png'/>"> <span
									class="count">${product.chatCnt }</span></li>
	
								<!-- 조회수 -->
								<li><img class="other-icon"
									src="<c:url value='/images/icons/search.png'/>"> <span
									class="count">${product.hits }</span></li>
							</ul>
							
							<!-- 환불 여부 -->
							<div class="mini-div">
								<span class="mini-title">·환불여부</span> <span class="mini-content">
								<c:choose>
									<c:when test="${product.refund eq '1'}">가능</c:when>
									<c:when test="${product.refund eq '2'}">불가능</c:when>
								</c:choose>
								</span>
							</div>
	
							<!-- 배송 여부 -->
							<div class="mini-div">
								<span class="mini-title">·가격협의</span> <span class="mini-content">
								<c:choose>
									<c:when test="${product.nego eq '1'}">가능</c:when>
									<c:when test="${product.nego eq '2'}">불가능</c:when>
								</c:choose>
								</span>
							</div>
	
							<!-- 거래 지역 -->
							<div class="mini-div">
								<span class="mini-title">·거래지역</span> <span class="mini-content">${product.addr}</span>
							</div>
	
						</div>
						
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