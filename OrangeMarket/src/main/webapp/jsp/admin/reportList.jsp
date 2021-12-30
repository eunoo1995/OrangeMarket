<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!-- 헤더 -->
<jsp:include page="/include/admin_header.jsp" flush="false"/>
<jsp:include page="/include/admin_nav.jsp" flush="false">
	<jsp:param name="jsName" value="admin" />
</jsp:include>
<!-- 헤더 -->
<body>
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">문의 리스트</div>
    		<div class="section-content">
    			<div class="section-search">
		    		<select id="field" name="field" class="section-search-field">
		    			<option value="">전체보기</option>	 
						<option <c:if test="${page.field == 'N'}">selected</c:if> value="N">답변대기</option>	    		
						<option <c:if test="${page.field == 'Y'}">selected</c:if> value="Y">답변완료</option>	    		
		    		</select>
    			</div>
				<div class="section-main">
					<table>
						<colgroup>
							<col width="5%">
							<col width="35%">
							<col width="15%">
							<col width="15%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<th></th>
							<th>제목</th>
							<th>판매자</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>상태</th>
						</tr>
						<!-- 반복문 사용 예정 -->
						<tr>
							<td>4</td>
							<td><a href="javascript:report_detail()">에어팟 팔아요~~</a></td>
							<td>사기꾼</td>
							<td>홍길동</td>
							<td>2021-01-01</td>
							<td>대기</td>
						</tr>
					</table>
					<div style="width:1000px; margin-top:50px; text-align:center;">
					<article class="pager-wrap">
						<ul class="pager">
							<c:set var="before" value="${page.startPage-1}"/>
							<c:set var="next" value="${page.endPage+1}"/>
							<c:if test="${page.startPage != 1 }">
							<li><a href="admin-inquirylist?pageNo=${before}&field=${page.field}">&lt;</a></li>
							</c:if>	
								<c:forEach var="pageNo" begin="${page.startPage}" end="${page.endPage}">
									<c:choose>
									<c:when  test="${pageNo == page.pageNo }">
										<li class="on"><a href="admin-inquirylist?pageNo=${pageNo}&field=${page.field}">${pageNo}</a></li>
									</c:when>
									<c:when test="${pageNo != page.pageNo }">
										<li><a href="admin-inquirylist?pageNo=${pageNo}&field=${page.field}">${pageNo}</a></li>
									</c:when>
									</c:choose>
								</c:forEach>
							<c:if test="${page.endPage != page.totalPage }">
							<li><a href="admin-inquirylist?pageNo=${next}&field=${page.field}">&gt;</a></li>
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