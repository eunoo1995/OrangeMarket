<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="main" />
</jsp:include>
<!-- 헤더 -->




<article class="pg-wrap pg-main">

	<c:if test="${sessionId != null }">
		<button class="btn_menu" name="pro-write" id="pro-write">+</button>
	</c:if>
	<form name="frm" id="frm" method="post">
					<input type="hidden" name="addrPass" id="addrPass" value="${addrPass}">
				</form>
    <article class="main-visual">
        <div class="main-visual-banner">
        </div>
    </article>
	
    <article class="main-article">
        <div class="cont-inner">
			<c:choose>
				<c:when test="${empty recentList}">
					<h2 class="main-cont-tit"><a href="#">첫 상품을 등록해주세요!</a></h2>
				</c:when>
				
				<c:when test="${!empty recentList}">
					<h2 class="main-cont-tit"><a href="product-list">최근 등록 상품</a></h2>
				</c:when>
			</c:choose>
            

            <ul class="main-pro-list">
            	<c:forEach var="rProduct" items="${recentList}" end="4">
                <li class="list-item">
                    <a href="product-list-detail?proCode=${rProduct.proCode}">
                        <figure class="pro-thumb">
                            <span class="pro-thumb-img">
                            	<img src="<c:url value='/images/products/${rProduct.imgs}'/>">
                            </span>
                        </figure>

                        <div class="pro-detail">
                            <p class="pro-detail-tit">${rProduct.title }</p>
                            <p class="pro-detail-price">${rProduct.price } 원</p>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>

        </div>
    </article>

    <article class="main-article">
        <div class="cont-inner">

            <h2 class="main-cont-tit">우리 동네 추천 상품</h2>

            <ul class="main-pro-list">
                <li class="list-item">
                    <a href="#">
                        <figure class="pro-thumb">
                            <span class="pro-thumb-img"></span>
                        </figure>

                        <div class="pro-detail">
                            <p class="pro-detail-tit">제품명</p>
                            <p class="pro-detail-price">19,000원</p>
                        </div>
                    </a>
                </li>
        </div>
    </article>
	
	<c:if test="${sessionId ne null}">
    <article class="main-article">
        <div class="cont-inner">
        	
        	<c:choose>
        		<c:when test="${mykeywordCount eq 0}">
        			  <h2 class="main-cont-tit">관심 키워드를 등록해주세요!</h2>
        		</c:when>
        		<c:when test="${empty myKeywordList}">
        			  <h2 class="main-cont-tit">아직 상품이 없어요..</h2>
        		</c:when>
        		<c:when test="${!empty myKeywordList}">
        			  <h2 class="main-cont-tit">회원님의 관심 상품은?</h2>
        		</c:when>
        	</c:choose>
	      
            
            
            <ul class="main-pro-list">
            	
               	<c:forEach var="mProduct" items="${myKeywordList}" end="4">
                <li class="list-item">
                    <a href="product-list-detail?proCode=${mProduct.proCode}">
                        <figure class="pro-thumb">
                            <span class="pro-thumb-img">
                            	<img src="<c:url value='/images/products/${mProduct.imgs}'/>">
                            </span>
                        </figure>

                        <div class="pro-detail">
                            <p class="pro-detail-tit">${mProduct.title }</p>
                            <p class="pro-detail-price">${mProduct.price } 원</p>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
			
        </div>
    </article>
    </c:if>

</article>

    
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="main" />
</jsp:include>
<!-- 푸터 -->