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
		</div>
	</header>

	<article class="board-wrap">
		<!-- container -->
		<div class="cont-inner">


			<form name="frm" method="post" action="">
				<table class="board-write-table">
					<tr>
						<td><select class="board-category-select">
								<option>운영정책</option>
								<option selected>계정/인증</option>
								<option>구매/판매</option>
								<option>거래품목</option>
								<option>이용제재</option>
								<option>동네생활</option>
								<option>이벤트/초대</option>
								<option>지역광고</option>
								<option>기타</option>
						</select> <input type="text" class="board-title" readonly value="test1">
						</td>
					</tr>
					<tr>
						<td><textarea class="content">test1</textarea></td>
					</tr>


				</table>

			</form>
			<div class="btn-div">
				<button class="btn" onclick="location='ask-boardList.jsp'">취소</button>
				<button class="btn btn-solid" onclick="">등록</button>
			</div>

		</div>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->