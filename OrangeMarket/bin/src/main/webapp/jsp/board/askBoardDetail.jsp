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
			<h2 class="sub-page-title">문의하기</h2>
			<p class="sub-page-desc">고객센터</p>
		</div>
	</header>


	<article class="board-wrap">
		<!-- container -->
		<div class="cont-inner">
			<nav>
				<ul class="board-menu">
					<li class="menu_li on"><a href="askBoardList.do">자주하는질문</a></li>
					<li class="menu_li"><a href="infoAccount.do"><b>문의하기</b></a></li>
				</ul>
			</nav>


			<form name="frm" method="post" action="">
				<table class="board-detail-table">
					<thead>
						<tr>
							<td><span class="board-category">운영정책</span> <span
								class="board-title">test</span></td>
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

			</form>
			<div class="btn-div">
				<button class="btn" onclick="location='ask-boardList.jsp'">취소하기</button>
				<button class="btn btn-solid" onclick="">저장하기</button>
			</div>

		</div>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->