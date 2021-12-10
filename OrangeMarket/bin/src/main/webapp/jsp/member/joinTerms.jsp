<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-terms">
	<header class="sub-page-head">
		<div class="cont-inner">
			<h2 class="sub-page-title">이용약관</h2>
		</div>
	</header>
	<article class="terms-wrap">
		<div class="cont-inner">
			<div class="terms">
				<h3 class="terms-tit">
					<strong class="fc-point tag">(필수)</strong> 사이트 이용약관
				</h3>

				<form action="" method="post" name="form-policy">
					<textarea class="terms-textarea">사이트 이용약관 입력란</textarea>

					<label class="terms-label"> <input type="checkbox"
						name="agree" /> 동의합니다.
					</label>
				</form>
			</div>
			<div class="terms">
				<h3 class="terms-tit">
					<strong class="fc-point tag">(필수)</strong> 개인정보 수집 방침
				</h3>

				<form action="" method="post" name="form-privacy">
					<textarea class="terms-textarea">개인정보 수집 방침 입력란</textarea>

					<label class="terms-label"> <input type="checkbox"
						name="agree" /> 동의합니다.
					</label>
				</form>
			</div>
			<div class="terms">
				<h3 class="terms-tit">
					<strong class="tag">(선택)</strong> 위치정보 이용약관
				</h3>

				<form action="" method="post" name="form-location">
					<textarea class="terms-textarea">위치정보 이용약관 입력란</textarea>

					<label class="terms-label"> <input type="checkbox"
						name="agree" /> 동의합니다.
					</label>
				</form>
			</div>
		</div>
	</article>

	<article class="btn-group terms-btn-group">
		<a href="index.html" class="btn btn-solid btn-half">이전</a> <a
			href="join_form.html" class="btn btn-solid-point btn-half">다음</a>
	</article>

</article>


<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->