<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-find-info">


	<article class="cont-article">
		<div class="cont-inner inner-2">

			<article class="find-account-wrap">
				<h3 class="find-result-tit txt-c">
					회원님 계정의 비밀번호를<br /> 재설정합니다.
				</h3>

				<form name="joinForm" action="" method="post" class="">
					<table class="form-table">
						<colgroup>
							<col width="50%" />
							<col width="50%" />
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2">
									<p class="form-tit required">
										비밀번호 <span class="form-tit-desc">문자, 숫자, 기호 중 2종류 조합</span>
									</p> <input type="text" name="pw" placeholder="비밀번호(8-20자리)"
									required />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">비밀번호 재확인</p> <input type="text"
									name="re-pw" required />
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<div class="btn-group">
										<a href="find_pw_result.html"
											class="btn btn-solid-point btn-f">비밀번호 변경</a>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>

			</article>

		</div>
	</article>

</article>



<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->