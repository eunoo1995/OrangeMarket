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
	    			<div class="QnA-titleList">
								<ul>
								<c:forEach var="cateList" items="${cateList}">
								<c:choose>
									<c:when test="${cateList.cateNo == cateNo}">	
									<li class="on"><a href="qna-list?category=${cateList.cateNo }">· ${cateList.cateName }</a></li>
									</c:when>
									<c:when test="${cateList.cateNo != cateNo}">	
									<li><a href="qna-list?category=${cateList.cateNo }">· ${cateList.cateName }</a></li>
									</c:when>
								</c:choose>
								</c:forEach>
								</ul>
	    			</div>
	    			<div class="QnA-message">사용자들의 자주 묻는 질문을 확인하세요.</div>
    				
    				<div class="QnA-accordion">
    				<c:forEach var="list" items="${list}">
						<p class="QnA-title">
						Q . ${list.title }
						</p>
						<div class="QnA-detail">
							<p>
								${list.content}
							</p>
						</div>
    				</c:forEach>
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