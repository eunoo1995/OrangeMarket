<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="mypage" />
</jsp:include>
<!-- 헤더 -->
<script>
$(function(){
	$("#myPage-img-file").change(function(){
		if(confirm("선택하신 사진으로 변경하시겠습니까?")) {
			var formdata = new FormData(document.getElementById("frm-profile"));
			$.ajax({
	  			type : "post",
	  			url  : "change-profile",
	  			data : formdata,
	  			processData : false,
	  			contentType : false,
	  			datatype : "text",
	  			success : function(data) {
	  					location="mypage";
	  			},	
	  			error : function() {
	  					alert("오류발생");
	  			}
	  		});
		}
	});
});
</script>
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
					<form id="frm-profile" method="post" enctype="multipart/form-data">
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
								<th></th>
								<td></td>
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
							<input type="button" id="" value="동네인증하기"> <input
								type="button" id="" value="정보수정"> <input type="button"
								id="myPage-withdrawal-btn" value="회원탈퇴">
						</div>
					</td>
				</tr>
			</table>

			<article class="mypage-bottom clx">

				<div class="myPage-keyword">
					<p>관심키워드</p>
					<div class="myPage-keywordList">
						<input type="text" id="" name="" value=""
							placeholder="추가하실 키워드를 입력하세요!">
						<button type="button" class="myPage-keywordAdd-btn" id="">추가</button>
						<div style="margin-top: 30px; padding: 20px;">
							<!-- 반복문 사용예정 -->
							<div class="myPage-keywords">
								자전거 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								전자레인지 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								컴퓨터 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								콜라 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								섬유유연제 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								돌돌이 <a href="">×</a>
							</div>
							<div class="myPage-keywords">
								에어팟 <a href="">×</a>
							</div>
							<!-- 반복문 사용예정 -->
						</div>
					</div>
				</div>
				<div class="myPage-likes">
					<p class="myPage-likes-p">관심게시물 리스트</p>
					<div class="myPage-likesList">
						<table class="likesList-table">
							<colgroup>
								<col width="15%">
								<col width="70%">
								<col width="15%">
							</colgroup>
							<!-- 반복문 사용예정 -->
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="ex" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<tr>
								<th><img src="/images/icons/lock.png"></th>
								<td>
									<p class="likesList-title">아이폰 13 미니 128 블랙 새제품 미개봉</p>
									<p class="likesList-loc">서초1동 · 10분전</p>
									<p class="likesList-price">890,000원</p>
								</td>
								<th><img class="" src="/images/icons/favorite_color.png"></th>
							</tr>
							<!-- 반복문 사용예정 -->
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