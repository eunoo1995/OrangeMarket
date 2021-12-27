<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		    		<input type="text" name="word" id="word" value="${page.word}" placeholder="검색하실 '닉네임'을 입력하세요!">
		    		<button id="searchMember"><img src="/images/admin/search_w.png"></button>
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
						<c:set var="rownum" value="${page.rownum }"/>
						<c:if test="${fn:length(list) == 0 }">
						<tr><td colspan="5">목록이 없습니다.</td></tr>
						</c:if>
						<c:forEach var="list" items="${list}">
						<tr>
							<td style="font-weight:bold;">${rownum}</td>
							<td>${list.email}</td>
							<td>${list.nikName}</td>
							<td>${list.rdate}</td>
							<td><img class="detail-btn" src="/images/admin/icon_down.png"></td>
						</tr>
						<tr style="display:none; font-size:14px;">
							<td class="liner"></td>
							<td class="liner"><div class="detail">주소</div><br>${list.addr}</td>
							<td class="liner"><div class="detail">연락처</div><br>${list.userPhone}</td>
							<td class="liner"><div class="detail">최근접속일</div><br>${list.udate}</td>
							<td class="liner">
							<input type="hidden" id="userId" value="${list.userId}"><br>
							<button type="button" id="suspendBtn" class="suspend-btn">계정정지</button>
							</td>
						</tr>
						<c:set var="rownum" value="${rownum-1 }"/>
						</c:forEach>
					</table>
					<div style="width:1000px; margin-top:50px; text-align:center;">
					<article class="pager-wrap">
						<ul class="pager">
							<c:set var="before" value="${page.startPage-1}"/>
							<c:set var="next" value="${page.endPage+1}"/>
							<c:if test="${page.startPage != 1 }">
							<li><a href="admin-memberlist?pageNo=${before}&word=${page.word}">&lt;</a></li>
							</c:if>	
								<c:forEach var="pageNo" begin="${page.startPage}" end="${page.endPage}">
									<c:choose>
									<c:when  test="${pageNo == page.pageNo }">
										<li class="on"><a href="admin-memberlist?pageNo=${pageNo}&word=${page.word}">${pageNo}</a></li>
									</c:when>
									<c:when test="${pageNo != page.pageNo }">
										<li><a href="admin-memberlist?pageNo=${pageNo}&word=${page.word}">${pageNo}</a></li>
									</c:when>
									</c:choose>
								</c:forEach>
							<c:if test="${page.endPage != page.totalPage }">
							<li><a href="admin-memberlist?pageNo=${next}&word=${page.word}">&gt;</a></li>
							</c:if>		
						</ul>
					</article>
					</div>
				</div>    		
    		</div>
    	</div>
    </section>
</body>
</html>