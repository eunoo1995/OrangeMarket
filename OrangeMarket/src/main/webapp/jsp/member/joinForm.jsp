<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-member pg-join">

	<article class="cont-article">
		<div class="cont-inner">

			<article class="find-account-wrap">
				<header class="sub-page-head">
					<div class="cont-inner">
						<h2 class="sub-page-title">회원가입</h2>
					</div>
				</header>
				
				<form name="joinForm" action="" method="post" id="joinForm" class="join-form">
					<fieldset>
						<input type="hidden" name="agreeLocation" value="${agreeLoc}" />
						<input type="hidden" name="nikFlag" value="N" />
						<input type="hidden" name="telFlag" value="N" />
						<input type="hidden" name="pwFlag" value="N" />
						<input type="hidden" name="emailFlag" value="N" />
						<input type="hidden" name="areaFlag" value="N" />
						<input type="hidden" name="userId" value="${userId}" />
					</fieldset>
			
					<table class="form-table">
						<colgroup>
							<col width="50%" />
							<col width="50%" />
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2">
									<p class="form-tit required">이름</p>
									<input type="text" name="userName" required />
									<p class="form-err-msg"></p>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">연락처</p>
									<input type="text" name="tel" placeholder="- 없이 숫자만 입력해주세요" required />
									<p class="form-err-msg"></p>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">닉네임</p>
									<input type="text" name="nickname" minlength="3" maxlength="12" placeholder="닉네임(3-12자리)" required />
									<p class="form-err-msg"></p>
								</td>
							</tr>
							<tr>
								<td>
									<p class="form-tit required">
										비밀번호
									</p>
									<input type="password" name="password" minlength="8" maxlength="20" placeholder="비밀번호(8-20자리)" required />
									<p class="form-err-msg"></p>
								</td>
								<td>
									<p class="form-tit required">비밀번호 재확인</p>
									<input type="password" name="rePassword" minlength="8" maxlength="20" required />
									<p class="form-err-msg"></p>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">이메일</p>
									<input type="text" name="email" class="with-btn-2" placeholder="아이디@naver.com 형식으로 입력해주세요" required />
									<button type="button" id="btnConfirmEmail" class="btn btn-solid with-input-2" disabled>인증번호 받기</button>
									<input type="text" id="confirmEmail" name="confirmEmail" placeholder="인증번호 입력" maxlength="6" readonly  style="display: none;" />
									<p class="form-err-msg"></p>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit">동네입력</p>
									<input type="text" name="addrArea" placeholder="주소를 입력해주세요" />
									<input type="hidden" name="addr" />
									<button type="button" id="btnConfirmArea" class="btn btn-solid btn-f" disabled>동네 인증하기</button>
									<p class="form-err-msg"></p>
									<div id="form-notice-box" class="form-notice-box" style="display: none;">
					                    <p class="notice-box-tit">주소 인증에 어려움이 있으신가요?</p>
					                    <p>
							                        정확한 위치 확인을 위해 스마트폰으로 시도해주세요
					                    </p>
									</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<div class="btn-group">
										<a href="/" class="btn btn-solid btn-half">취소하기</a>
										<button type="button" class="btn btn-solid-point btn-half" id="joinFormConfirm">가입하기</button>
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
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="member" />
</jsp:include>
<!-- 푸터 -->