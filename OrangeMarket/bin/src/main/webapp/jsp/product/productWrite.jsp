<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="product" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wraper -->
<article class="pg-wrap pg-pro-detail">
	<!-- container -->
	<div class="cont-inner">
	
		<!-- 타이틀 및 메뉴 -->
		<header class="sub-page-head">
			<div class="cont-inner">
				<h2 class="sub-page-title">상품정보</h2>
			</div>
		</header>
		
		<div class="product-write-content">
			<div class="product-write-content__head">
				<p class="product-write-star1">* 필수항목</p>
			</div>

			<div class="product-write-content__detail">
				<form name="frm" id="frm">
					<table class="product-write-table">

						<!-- 1. 상품 이미지 -->
						<tr class="product-table-tr">
							<th>
								사진
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2">

								<div class="button">
									<label class="img-label" for="chooseFile">
										<button class="btn-image">+</button>
									</label>
								</div>

							</td>
						</tr>


						<!-- 2. 게시글 제목 -->
						<tr class="product-table-tr">
							<th>
								제목
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2"><input type="text"
								name="title" id="title" maxlength="40"
								class="product-write-text"></td>
						</tr>


						<!-- 3. 제품 카테고리 -->
						<tr class="product-table-tr">
							<th>
								카테고리
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2">
								<select name="category" id="category" class="product-write-category">
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
									<option>1</option>
								</select>

								<div class="keyword-wrap">
									<input type="text" name="title" id="title" maxlength="40" placeholder="연관단어를 입력해주세요." onfocus="this.placeholder=''"
										onblur="this.placeholder='연관단어를 입력해주세요.'" class="product-write-keyword">
									 <span class="product-write-desc">예시 : #오렌지마켓 <br> 연관단어는 반드시 작성하지 않아도 됩니다. </span>
								</div>
							</td>
						</tr>


						<!-- 4. 거래 지역 -->
						<tr class="product-table-tr">
							<th>
								거래지역
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2">
								<input type="text" name="location" id="location" value="인증 사용자 지역명" readonly class="product-write-text">
							</td>
						</tr>


						<!-- 5. 거래 방법 -->
						<!-- 								
									<tr class="product-table-tr">
									<th>거래<span class="orange-star">*</span></td>
									<td class="product-write-table-td2">
										
										<div class="transation">
										    <input type="radio" name="transation" value="direct" id="direct" checked="checked">
										    	<label class="role" for="direct" style="margin-right: 60px;">직거래</label>
										</div>
									
									</td>
								</tr> 
-->


						<!-- 6. 환불 여부 -->
						<tr class="product-table-tr">
							<th>환불<span
								class="orange-star">*</span></th>
							<td class="product-write-table-td2">

								<div class="refund">
									<input type="radio" name="refund" value="no" id="no" checked="checked">
									<label class="role" for="no" style="margin-right: 40px;">환불불가</label>
									<input type="radio" name="refund" value="yes" id="yes">
									<label class="role" for="yes">환불가능</label>
								</div>

							</td>
						</tr>


						<!-- 7. 제품 가격 -->
						<tr class="product-table-tr">
							<th>가격<span
								class="orange-star">*</span></th>
							<td class="product-write-table-td2">
								<input type="text" name="price" id="price" maxlength="11" onkeyup="inputNumberFormat(this)" placeholder="가격을 입력해주세요."
								onfocus="this.placeholder=''" onblur="this.placeholder='가격을 입력해주세요.'" class="product-write-price-txt">
								<font style="margin-right: 10px; font-size: 16px;">원</font>

								<div class="price-chk">
									<input type="checkbox" name="nego" value="nego" id="nego">
									<label class="chk" for="nego">가격협의 가능</label>
								</div></td>
						</tr>


						<!-- 8. 제품 설명 -->
						<tr class="product-table-tr">
							<th>설명</th>
							<td class="product-write-table-td2">
								<textarea name="content" id="content" class="product-write-content1"></textarea>
							</td>
						</tr>

					</table>
				</form>
			</div>

			<div class="btn-match">
				<button class="btn btn-solid-point">저장</button>
				<button class="btn btn-solid">삭제</button>
			</div>

		</div>
	</div>
	<!-- container end -->
</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="product" />
</jsp:include>
<!-- 푸터 -->