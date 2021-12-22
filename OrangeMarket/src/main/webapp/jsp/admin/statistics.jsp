<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더 -->
<jsp:include page="/include/admin_header.jsp" flush="false"/>
<jsp:include page="/include/admin_nav.jsp" flush="false">
	<jsp:param name="jsName" value="admin" />
</jsp:include>
<!-- 헤더 -->
<body>
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">통계</div>
    		<div class="section-content">
				<div class="section-main">
					<table class="statistics-table">
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tr>
							<th style="font-weight:bold;">회원 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th>정지회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th>탈퇴회원</th>
							<td>00명</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">방문 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체방문자</th>
							<td>00</td>
						</tr>
						<tr>
							<th>금일방문자</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">게시글 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체게시글</th>
							<td>00</td>
						</tr>
						<tr>
							<th>신규게시글</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">문의 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th>대기문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th>완료문의</th>
							<td>00</td>
						</tr>
						<tr>
							<th style="font-weight:bold;">신고 통계</th>
							<th></th>
						</tr>
						<tr>
							<th>전체신고</th>
							<td>00</td>
						</tr>
						<tr>
							<th>대기신고</th>
							<td>00</td>
						</tr>
						<tr>
							<th>완료신고</th>
							<td>00</td>
						</tr>
					</table>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>