<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-find-info">


	<article class="cont-article">
		<div class="cont-inner">

			<h3 class="find-result-tit txt-c">
				회원님 계정의 비밀번호를<br /> 재설정합니다.
			</h3>

			<form name="joinForm" id="pwResetForm" action="" method="post" class="">
				<fieldset>
					<input type="hidden" name="pwFlag" value="N" />
					<input type="hidden" name="email" value="${email}">
				</fieldset>
				
				<table class="form-table">
					<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup>
					<tbody>
						<tr>
							<td colspan="2">
								<p class="form-tit required">
									비밀번호
								</p>
								<input type="password" name="password" minlength="8" maxlength="20" placeholder="비밀번호(8-20자리)" required />
								<p class="form-err-msg"></p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="form-tit required">비밀번호 재확인</p>
								<input type="password" name="rePassword" minlength="8" maxlength="20" required />
								<p class="form-err-msg"></p>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<div class="btn-group">
									<button type="button" id="pwFormConfirm" class="btn btn-solid-point btn-f">비밀번호 변경</button>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>


		</div>
	</article>

</article>


<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="member" />
</jsp:include>
<!-- 푸터 -->