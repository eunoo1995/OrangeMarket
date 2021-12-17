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
			<h2 class="sub-page-title">자주묻는질문</h2>
		</div>
	</header>

	<article class="board-wrap">
		<!-- container -->
		<div class="cont-inner">
		
			<div class="QnA-main">
	    			<table class="QnA-titleList">
	    				<tr>
							<th>
								<ul>
									<li>· 운영정책</li>
									<li>· 거래품목</li>
									<li>· 이벤트/초대</li>
								</ul>
							</th>
							<th>
								<ul>
									<li>· 계정/인증</li>
									<li>· 이용재제</li>
									<li>· 지역광고</li>
								</ul>
							</th>
							<th>
								<ul>
									<li>· 구매/판매</li>
									<li>· 동네생활</li>
									<li>· 기타</li>
								</ul>
							</th>
	    				</tr>
	    			</table>
	    			<div class="QnA-message">사용자들의 자주 묻는 질문을 확인하세요.</div>
    				
    				<div class="QnA-accordion">
    				<!-- 반복문 사용 -->
						<p class="QnA-title">
						Q . 커뮤니티 가이드라인
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
						</div>
    				</div>
			</div>
		</div>
		<!-- container end -->
	</article>

</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" >
	<jsp:param name="jsName" value="board" />
</jsp:include>
<!-- 푸터 -->