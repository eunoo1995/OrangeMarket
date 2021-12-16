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
					<input type="hidden" name="agreeLocation" value="${agreeLoc}" />
					<input type="hidden" name="isSameTel" value="" />
					<input type="hidden" name="isSameNik" value="" />
				
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
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">연락처</p>
									<input type="text" name="tel" class="with-btn" placeholder="- 없이 숫자만 입력해주세요" required />
									<button type="button" id="btnChkTel" class="btn-solid with-input">중복검사</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">
										닉네임 <span class="form-tit-desc">닉네임(6-12자리)</span>
									</p>
									<input type="text" name="nickname" class="with-btn" placeholder="닉네임(6-12자리)" required />
									<button type="button" id="btnChkNik" class="btn-solid with-input">중복검사</button> 
								</td>
							</tr>
							<tr>
								<td>
									<p class="form-tit required">
										비밀번호 <span class="form-tit-desc">문자, 숫자, 기호 중 2종류 조합</span>
									</p>
									<input type="text" name="pw" placeholder="비밀번호(8-20자리)" required />
								</td>
								<td>
									<p class="form-tit required">비밀번호 재확인</p>
									<input type="text" name="rePw" required />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">이메일</p>
									<input type="text" name="email" class="with-btn-2" placeholder="아이디@naver.com 형식으로 입력해주세요" required />
									<button type="button" class="btn btn-solid with-input-2">인증번호 받기</button>
									<input type="text" name="conrim-email" placeholder="인증번호 입력" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit">동네입력</p>
									<input type="text" name="email" class="with-btn" placeholder="주소를 입력해주세요" />
									<button type="button" class="btn btn-solid with-input">검색</button>
									<input type="text" name="conrim-email" placeholder="인증번호 입력" />
									<button type="button" class="btn btn-solid btn-f">동네 인증하기</button>
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