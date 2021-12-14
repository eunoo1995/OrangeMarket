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
			<h2 class="sub-page-title">고객센터</h2>
		</div>
	</header>


	<article class="board-wrap">
		<!-- container -->
		<div class="cont-inner">
		
			<nav class="board-menu-wrap">
				<ul class="board-menu">
					<li class="menu_li"><a href="inquiry-list">문의내역</a></li>
					<li class="menu_li on"><a href="report-list"><b>신고내역</b></a></li>
				</ul>
			</nav>

			<table class="board-table">
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="*%" />
					<col width="10%" />
					<col width="15%" />
					<col width="12%" />
				</colgroup>

				<thead>
					<tr>
						<th>번호</th>
						<th>종류</th>
						<th>제목</th>
						<!--제목 누르면 상세내용으로 이동  클릭시 고유값 가지고 이동-->
						<th>글쓴이</th>
						<th>작성일</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="board-num">1</td>
						<td>계정/인증</td>
						<td class="board-tit"><a href="askBoardDetail.do">test1</a></td>
						<td class="board-writer">1</td>
						<td>2021-09-09</td>
						<td class="board-answer">미답변</td>
					</tr>
				</tbody>
			</table>


			<article class="pager-wrap">
				<ul class="pager">
					<li class="on"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
				</ul>
			</article>

		</div>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->