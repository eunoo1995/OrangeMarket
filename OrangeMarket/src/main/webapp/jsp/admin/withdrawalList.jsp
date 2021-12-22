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
    		<div class="section-title">탈퇴회원목록</div>
    		<div class="section-content">
    			<div class="section-search">
		    		<select name="">
						<option value="">아이디</option>	    		
						<option value="">닉네임</option>	    		
		    		</select>
		    		<input type="text" name="" value="" placeholder="검색하실 내용을 입력하세요.">
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
							<th>아이디</th>
							<th>닉네임</th>
							<th>가입일</th>
							<th>상세</th>
						</tr>
						<!-- 반복문 사용 예정 -->
						<tr>
							<td>4</td>
							<td>123@123.com</td>
							<td>홍길동</td>
							<td>2021-01-01</td>
							<td><img class="detail-btn" src="/images/admin/icon_down.png"></td>
						</tr>
						<tr style="display:none; font-size:14px;">
							<td></td>
							<td colspan="2"><font color="red">탈퇴사유</font> : 사이트 이용 빈도 감소</td>
							<td>회원탈퇴일 : 2021/01/01</td>
							<td><input type="button" class="section-btn" value="계정복구"></td>
						</tr>
					</table>
					<div style="width:1000px; margin-top:50px; text-align:center;">《 1 2 3 4 5 》</div>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>