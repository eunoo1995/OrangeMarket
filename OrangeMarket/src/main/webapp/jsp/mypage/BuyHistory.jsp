<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="board" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wraper -->
<article class="pg-wrap pg-board-list">


	<!-- 타이틀 및 메뉴 -->
	<header class="sub-page-head">
		<div class="cont-inner">
			<h2 class="sub-page-title">판매/구매내역</h2>
		</div>
	</header>
	
	<article class="board-wrap">
		<form name="frm" id="frm" method="post">
		<!-- container -->
		<div class="cont-inner">
			<nav class="board-menu-wrap">
				<ul class="board-menu">
					<li class="menu_li"><a href="sell-history">판매내역</a></li>
					<li class="menu_li on"><a href="buy-history"><b>구매내역</b></a></li>
				</ul>
			</nav>

			<table class="board-table">
				<colgroup>
					<col width="23%" />
					<col width="*%" />
					<col width="12%" />
					<col width="18%" />
					<col width="12%" />
				</colgroup>

				<thead>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>판매자</th>
						<th>가격</th>
						<th>거래평가</th>
					</tr>
				</thead>

				
				<tbody>
				<c:choose>
				<c:when test="${page.total ne 0}"> 
				<c:forEach var="buy" items="${buy}">
					<tr>
						<td>
							<c:forEach var="c" items="${category}">
								<c:if test="${c.proCategoryCode == buy.proCategoryCode}">
									${c.category}
								</c:if>
							</c:forEach>
						</td>
						<td class="board-tit"><a href="product-list-detail?proCode=${buy.proCode}">${buy.title}</a></td>
						<td class="board-writer">${buy.sellerNik}</td>
						<td>${buy.price} 원</td>
						<td class="board-answer">
							<c:if test="${buy.reviewCnt eq 0}">
								<input type="button" name="good" id="good" value="좋아요">
								<input type="button" name="bad" id="bad" value="싫어요">
								<input type="hidden" name="seller" id="seller" value="${buy.seller}">
								<input type="hidden" name="proCode" id="proCode" value="${buy.proCode}">
							</c:if>
							<c:if test="${buy.reviewCnt eq 1}">평가완료</c:if>
						</td>
					</tr>
				</c:forEach>	

	 				</c:when>
				<c:when test="${page.total eq 0}">
					<tr>
						<th colspan="5">구매중인 제품이 없습니다.</th>
					</tr>
				</c:when>
				</c:choose> 	
				</tbody>
				
			</table>

	 			<article class="pager-wrap">
				<ul class="pager">
				<c:set var="before" value="${page.startPage-1}"/>
				<c:set var="next" value="${page.endPage+1}"/>
				<c:if test="${page.startPage != 1 }">
				<li><a href="buy-history?pageNo=${before}">&lt;</a></li>
				</c:if>	
					<c:forEach var="pageNo" begin="${page.startPage}" end="${page.endPage}">
						<c:choose>
						<c:when  test="${pageNo == page.pageNo }">
							<li class="on"><a href="buy-history?pageNo=${pageNo}">${pageNo}</a></li>
						</c:when>
						<c:when test="${pageNo != page.pageNo }">
							<li><a href="buy-history?pageNo=${pageNo}">${pageNo}</a></li>
						</c:when>
						</c:choose>
					</c:forEach>
				<c:if test="${page.endPage != page.totalPage }">
				<li><a href="buy-history?pageNo=${next}">&gt;</a></li>
				</c:if>		
				</ul>
			</article> 	

		</div>
		</form>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="product" />
</jsp:include>
<!-- 푸터 -->