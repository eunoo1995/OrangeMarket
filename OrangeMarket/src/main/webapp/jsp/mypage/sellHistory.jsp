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
	
	<script>
		function updateStatus(proCode) {
			// 제품 코드, 상태 값
			var proCode = proCode;
			var selectStat = document.getElementById("status");
			var selectValue = selectStat.options[selectStat.selectedIndex].value;
			
			location = "update-product-status?proCode=" + proCode + "&status=" + selectValue;
		}
	
		$(function(){
			
		});
	</script>
	
	<article class="board-wrap">
		<form name="frm" id="frm" method="post">
		<!-- container -->
		<div class="cont-inner">
			<nav class="board-menu-wrap">
				<ul class="board-menu">
					<li class="menu_li on"><a href="sell-history">판매내역</a></li>
					<li class="menu_li"><a href="buy-history"><b>구매내역</b></a></li>
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
						<th>거래상태</th>
					</tr>
				</thead>

				
				<tbody>
<%-- 			<c:choose>
				<c:when test="${page.total ne 0}"> --%>
				<c:forEach var="sell" items="${sell}">
					<tr>
						<td>
							<c:forEach var="c" items="${category}">
								<c:if test="${c.proCategoryCode == sell.proCategoryCode}">
									${c.category}
								</c:if>
							</c:forEach>
						</td>
						<td class="board-tit"><a href="product-list-detail?proCode=${sell.proCode}">${sell.title}</a></td>
						<td class="board-writer">${sell.sellerNik}</td>
						<td>${sell.price} 원</td>
						<td class="board-answer">
						
							<c:if test="${sell.status eq 0}">거래완료</c:if>
							<c:if test="${sell.status ne 0}">
								<select name="status" id="status" onchange="updateStatus(${sell.proCode}, );">
									<option value="1" <c:if test="${sell.status eq 1}">selected</c:if>>판매중</option>
									<option value="2" <c:if test="${sell.status eq 2}">selected</c:if>>예약중</option>
									<option value="0">거래완료</option>
								</select>
							</c:if>
						</td>
						
					</tr>
				</c:forEach>	

<%-- 				</c:when>
				<c:when test="${page.total eq 0}">
					<tr>
						<th colspan="6">판매중인 제품이 없습니다.</th>
					</tr>
				</c:when>
				</c:choose> --%>
				</tbody>
				
			</table>

<%-- 			<article class="pager-wrap">
				<ul class="pager">
				<c:set var="before" value="${page.startPage-1}"/>
				<c:set var="next" value="${page.endPage+1}"/>
				<c:if test="${page.startPage != 1 }">
				<li><a href="sell-history?pageNo=${before}">&lt;</a></li>
				</c:if>	
					<c:forEach var="pageNo" begin="${page.startPage}" end="${page.endPage}">
						<c:choose>
						<c:when  test="${pageNo == page.pageNo }">
							<li class="on"><a href="sell-history?pageNo=${pageNo}">${pageNo}</a></li>
						</c:when>
						<c:when test="${pageNo != page.pageNo }">
							<li><a href="sell-history?pageNo=${pageNo}">${pageNo}</a></li>
						</c:when>
						</c:choose>
					</c:forEach>
				<c:if test="${page.endPage != page.totalPage }">
				<li><a href="sell-history?pageNo=${next}">&gt;</a></li>
				</c:if>		
				</ul>
			</article> --%>

		</div>
		</form>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->