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
    		<div class="section-title">회원정보목록</div>
    		<div class="section-content">
    			<div class="section-search">
		    		<input type="text" name="" value="" placeholder="검색하실 '닉네임'을 입력하세요!">
		    		<button type="submit" onclick=""><img src="/images/admin/search_w.png"></button>
    			</div>
				<div class="section-main">
					<table>
						<colgroup>
							<col width="5%">
							<col width="35%">
							<col width="20%">
							<col width="30%">
							<col width="10%">
						</colgroup>
						<tr>
							<th></th>
							<th>Email</th>
							<th>닉네임</th>
							<th>가입일</th>
							<th>상세</th>
						</tr>
						<!-- 반복문 사용 예정 -->
						<tr>
							<td style="font-weight:bold;">4</td>
							<td>123@123.com</td>
							<td>홍길동</td>
							<td>2021-01-01</td>
							<td><img class="detail-btn" src="/images/admin/icon_down.png"></td>
						</tr>
						<tr style="display:none; font-size:14px;">
							<td></td>
							<td><div class="detail">주소</div><br>서울특별시 강남구</td>
							<td><div class="detail">연락처</div><br>010-0000-0000</td>
							<td><div class="detail">최근접속일</div><br>2021-01-01</td>
							<td><br><button type="button" class="section-btn">계정정지</button></td>
						</tr>
					</table>
					<div style="width:1000px; margin-top:50px; text-align:center;">《 1 2 3 4 5 》</div>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>