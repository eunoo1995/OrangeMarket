<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="mypage" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wrapper -->
<article class="pg-wrap myPage-main">

	<!-- 타이틀 및 메뉴 -->
	<header class="sub-page-head">
		<div class="cont-inner">
			<!-- class="myPage-title" -->
			<h2 class="sub-page-title">
				<span>${vo.nikName}</span>님의 마이페이지
			</h2>
		</div>
	</header>

	<article class="mypage-info-wrap">
		<!-- container -->
		<div class="cont-inner">
			<table class="myPage-table">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th><img class="myPage-img" src="/images/profiles/${vo.profileImg}"><br>
						<input type="button" class="myPage-img-btn" value="사진 변경">
					<form id="frm-profile" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
						<input type="hidden" id=userId name="userId" value="${sessionId}">
						<input type="hidden" id=profileImg name="profileImg" value="${vo.profileImg}">
						<input type="file" id="myPage-img-file" name="uploadProfile" 
							accept="image/gif,image/png,image/jpeg" multiple style="display: none;">
					</form>
					</th>
					<td>
						<table class="myPage-info-table">
							<tr>
								<th>email</th>
								<td>${vo.email}</td>
								<th>등급</th>
								<td>${vo.userLevel}</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>${vo.nikName}</td>
								<th>회원가입일</th>
								<td>${vo.rdate}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${vo.userPhone}</td>
								<th>최종접속일</th>
								<td>${vo.udate}</td>
							</tr>
							<tr>
								<th>우리동네</th>
								<td colspan="3">${vo.addr}</td>
							</tr>
						</table>
						<div class="myPage-div1">
							<input type="button" id="" value="동네인증하기"> 
							<input type="button" id="" value="정보수정"> 
							<input type="button" id="myPage-withdrawal-btn" value="회원탈퇴">
						</div>
					</td>
				</tr>
			</table>

			<article class="mypage-bottom clx">

				<div class="myPage-keyword">
					<p>관심키워드</p>
					<div class="myPage-keywordList">
					<form id="frm">
						<input type="text" id="mykeyword" name="mykeyword" autocomplete="off" 
									 placeholder="추가하실 키워드를 입력하세요!">
						<button type="button" class="myPage-keywordAdd-btn" id="addMyKeyword">추가</button>
					</form>	
						<div style="margin-top: 30px; padding: 20px;">
							<c:if test="${fn:length(keywordList) == 0 }">
								<div style="margin-top:200px; color:#999;">
								등록하신 관심키워드가 없습니다!
								</div>
							</c:if>
							<c:forEach var="keywordList" items="${keywordList}">
								<div class="myPage-keywords">
									${keywordList.mykeyword} 
									<a href="mykeyword-delete?mykeywordUnq=${keywordList.mykeywordUnq}">×</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="myPage-likes">
					<p class="myPage-likes-p">관심게시물 리스트</p>
					<div class="myPage-likesList">
					<c:if test="${fn:length(likeList) == 0}">
					<div style="margin-top:270px; color:#999">
					아직 좋아요를 누른 게시물이 없습니다. 판매중인 다양한 물품을 둘러보세요!</div>
					</c:if>
						<table class="likesList-table">
							<colgroup>
								<col width="15%">
								<col width="70%">
								<col width="15%">
							</colgroup>
							<c:forEach var="likeList" items="${likeList}">
							<tr>
								<th><img class="likesList-img" src="/images/products/${likeList.imgs}"></th>
								<td>
									<div class="likesList-state">${likeList.status}</div>
									<p class="likesList-title">
									<a href="product-list-detail?proCode=${likeList.proCode}">${likeList.title}</a></p>
									<p class="likesList-loc">${likeList.sellerNik} · ${likeList.addr}</p>
									<p class="likesList-price">${likeList.price}원</p>
								</td>
								<th>
									<a href="delete-likelist?unq=${likeList.unq}">
										<img class="ex" src="/images/icons/favorite_color.png">
									</a>
								</th>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>

			</article>
			
		</div>
		<!-- container end -->
	</article>
	
	
</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" >
	<jsp:param name="jsName" value="mypage" />
</jsp:include>
<!-- 푸터 -->