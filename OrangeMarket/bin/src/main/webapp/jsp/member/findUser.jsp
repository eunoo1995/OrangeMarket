<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="member" />
</jsp:include>
<!-- 헤더 -->

<article class="pg-wrap pg-find-info pg-find-user">
	<article class="cont-article">
		<div class="cont-inner inner-2">

			<article class="find-account-wrap">
				<header class="sub-page-head">
					<div class="cont-inner">
						<h2 class="sub-page-title">마켓계정 찾기</h2>
					</div>
				</header>

				<form name="joinForm" action="" method="post" class="">
					<table class="form-table">
						<colgroup>
							<col width="50%" />
							<col width="50%" />
						</colgroup>
						<tbody>
							<tr>
								<td colspan="2">
									<p class="form-tit required">이름</p> <input type="text"
									name="name" required />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p class="form-tit required">연락처</p> <input type="text"
									name="tel" placeholder="- 없이 숫자만 입력해주세요" required />
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<div class="btn-group">
										<a href="find_pw_result.html"
											class="btn btn-solid-point btn-f">확인</a>
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