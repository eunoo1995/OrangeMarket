<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-login login">

	<article class="cont-article">
		<div class="cont-inner">

			<header class="sub-page-head">
				<div class="cont-inner">
					<h2 class="sub-page-title">로그인</h2>
				</div>
			</header>

			<article class="login-wrap">
				<form name="loginForm" action="" method="post" class="login-form">
					<table class="form-table">
						<colgroup>
							<col width="50%" />
							<col width="50%" />
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2">
									<p class="form-tit required">이메일</p> <input type="text"
									name="email" placeholder="이메일을 입력해주세요" required /> <label
									class="label"> <input type="checkbox" /> <span>아이디
											저장</span>
								</label>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">비밀번호</p> <input type="text"
									name="pw" placeholder="비밀번호" required /> <a href="index.html"
									class="btn btn-solid-point btn-f">로그인 </a>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<div class="btn-wrap txt-c">
					<a href="find_pw.html" class="btn-goto-find btn-txt">비밀번호/계정찾기</a>
				</div>

				<div class="login-bottom">
					<a href="join_terms.html" class="btn btn-solid btn-f">회원가입</a>
				</div>
			</article>

		</div>
	</article>

</article>



<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->