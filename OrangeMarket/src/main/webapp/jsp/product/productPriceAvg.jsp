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
			<h2 class="sub-page-title">시세조회</h2>
		</div>
	</header>

	<article class="board-wrap">
		<table class="board-table">
			<colgroup>
				<col width="20%" />
				<col width="35" />
				<col width="20%" />
				<col width="25%" />
			</colgroup>

			<thead>
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>판매자</th>
					<th>가격</th>
				</tr>
			</thead>


			<tbody>
				<c:choose>
					<c:when test="${!empty list}">
						<c:forEach var="sell" items="${list}" end="10">
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
							</tr>
						</c:forEach>
					</c:when>

					<c:when test="${empty list}">
						<tr>
							<th colspan="4">판매중인 제품이 없습니다.</th>
						</tr>
					</c:when>
				</c:choose>
			</tbody>

		</table>

	</article>
</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="product" />
</jsp:include>
<!-- 푸터 -->