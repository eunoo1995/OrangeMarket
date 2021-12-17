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


			<form id="frm">
				<table class="board-write-table">
					<tr>
						<td><textarea id="content" name="content" class="content"
							 placeholder="해당 게시글의 판매자 관련 신고하실 내용을 상세하게 입력해주세요."></textarea></td>
					</tr>


				</table>
					<input type="hidden" name="title" id="title" value="아이폰 싸게 팔아요오~~ㅎㅎ">
					<input type="hidden" name="writer" id="writer" value=20202020>
					<input type="hidden" name="writerNik" id="writerNik" value="홍길동">
					<input type="hidden" name="seller" id="seller" value=20201111>
					<input type="hidden" name="sellerNik" id="sellerNik" value="사기꾼">
			</form>
			<div class="btn-div">
				<button class="btn" onclick="location='product-detail'">취소</button>
				<button class="btn btn-solid" id="reportWrite">등록</button>
			</div>

		</div>
		<!-- container end -->
	</article>


</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="board" />
</jsp:include>
<!-- 푸터 -->