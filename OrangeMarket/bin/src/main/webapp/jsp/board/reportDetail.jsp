<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="board" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wrapper -->
<article class="pg-wrap pg-board-write">

	<!-- 타이틀 및 메뉴 -->
	<header class="sub-page-head">
		<div class="cont-inner">
			<h2 class="sub-page-title">신고하기</h2>
		</div>
	</header>

	<article class="board-wrap">
		<!-- container -->
		<div class="cont-inner">

				<table class="board-detail-table">
					<thead>
						<tr>
							<td><span class="board-title">test</span></td>
						</tr>
						<tr>
							<td><span class="board-writer">홍길동</span> <span
								class="board-date">2021.11.30</span></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="content" readonly>test1</div></td>
						</tr>
					</tbody>
				</table>
				<table class="board-detail-table">
					<thead>
						<tr>
							<td><span style="font-weight:bold; font-size:16px;">re:test1</span><br>
							<span class="board-writer">상담사</span>
							<span class="board-date">2021.11.30</span></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="content" readonly>답변내용</div></td>
						</tr>
					</tbody>
				</table>

		</div>
		<!-- container end -->
	</article>

</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->