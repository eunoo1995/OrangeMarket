<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="board" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wrapper -->
<article class="pg-wrap pg-qna-list">

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
					<li class="menu_li"><a href="askBoardList.do">자주하는질문</a></li>
					<li class="menu_li on"><a href="infoAccount.do"><b>문의하기</b></a></li>
				</ul>
			</nav>


			<form class="search_bar" method="get">
				<input type="text" class="search_input" placeholder="무엇을 도와드릴까요?">
				<div>
					<!--search icon-->
				</div>
			</form>

			<div class="category">
				<!-- middle_title 이 바로 옆에 붙어서 div로 묶어줌  -->
				<%@ include file="/include/category.jsp"%>
			</div>



			<article>
				<div class="middle-title">사용자들이 자주 묻는 질문을 확인해보세요</div>
				<ul class="qna-list">
					<!-- 링크이동추가 5개 정도-->
					<li class="qna-content"><a href="#">Q. 계정인증1</a></li>
					<li class="qna-content"><a href="#">Q. 계정인증2</a></li>
					<li class="qna-content"><a href="#">Q. 계정인증3</a></li>

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