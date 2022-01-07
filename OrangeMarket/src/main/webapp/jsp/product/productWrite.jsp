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
				<form id="frm-product" name="frm-product" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
					
					<table class="product-write-table">
						<!-- 1. 상품 이미지 -->
						<tr class="product-table-tr">
							<th>
								사진
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2">
									<img class="btn-image" id="imgs" name="imgs" src="/images/icons/add.png">
				                <!-- <button type="button" class="btn-image" id="product-img-btn">+</button> -->
				                <input type="file" id="product-img-file" name="uploadProductImg" style="display: none;">
							</td>
						</tr>


						<!-- 2. 게시글 제목 -->
						<tr class="product-table-tr">
							<th>
								제목
								<span class="orange-star">*</span>
							</th>
								<td class="product-write-table-td2">
								<input type="text" name="title" id="title" maxlength="40" class="product-write-text">
							</td>
						</tr>


						<!-- 3. 제품 카테고리 -->
						<tr class="product-table-tr">
							<th>
								카테고리
								<span class="orange-star">*</span>
							</th>
							<td class="product-write-table-td2">
								<select name="proCategoryCode" id="proCategoryCode" class="product-write-category">
									<option value="">카테고리를 선택해주세요.</option>
									<c:forEach var="c" items="${list }">
										<c:if test="${c.cateStatus == 'Y'}">
											<option value="${c.proCategoryCode }">${c.category }</option>
										</c:if>
									</c:forEach>
								</select>

								<div class="keyword-wrap">
									<input type="text" name="keyword" id="keyword" maxlength="40" placeholder="연관단어를 입력해주세요." 
									onfocus="this.placeholder=''" onblur="this.placeholder='연관단어를 입력해주세요.'" class="product-write-keyword">
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
								<input type="text" name="addr" id="addr" value="${addr}" readonly class="product-write-text">
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
									<select name="refund" id="refund" class="product-write-category">
										<option value="">환불 여부를 선택해주세요.</option>
										<option value="1">가능</option>
										<option value="2">불가능</option>
									</select>
									<!-- <input type="radio" name="refund" id="refund" value="0" checked>
									<label class="role" for="0" style="margin-right: 40px;">환불불가</label>
									<input type="radio" name="refund" id="refund" value="1" >
									<label class="role" for="1">환불가능</label> -->
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
								
								<div class="keyword-wrap">
									<select name="nego" id="nego" class="product-write-category">
										<option value="">가격협상 여부를 선택해주세요.</option>
										<option value="1">가능</option>
										<option value="2">불가능</option>
									</select>
								</div>
<!-- 								<div class="price-chk">
									<input type="checkbox" name="nego" value="0" id="nego">
									<label class="chk" for="nego">가격협의 가능</label>
								</div> -->
							</td>
						</tr>


						<!-- 8. 제품 설명 -->
						<tr class="product-table-tr">
							<th>설명</th>
							<td class="product-write-table-content">
								<textarea name="content" id="content" class="product-write-content1" 
								style="border: 1px solid #eee; border-radius: 2px; width: 900px; height: 250px; padding-left: 5px; resize: none;"></textarea>
							</td>
						</tr>

					</table>
				</form>
			</div>

			<div class="btn-match">
				<button class="btn btn-solid-point" id="pro-btn-save">저장</button>
				<button class="btn btn-solid" onclick="history.back();">취소</button>
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