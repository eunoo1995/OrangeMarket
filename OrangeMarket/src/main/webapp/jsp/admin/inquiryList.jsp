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
    		<div class="section-title">문의내역 관리</div>
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
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<tr>
							<th></th>
							<th>종류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변</th>
						</tr>
						<!-- 반복문 사용 예정 -->
						<c:set var="rownum" value="${page.rownum }"/>
							<c:choose>
							<c:when test="${page.total ne 0}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td class="board-num">${rownum }</td>
									<td>${list.category}</td>
									<td class="board-tit">
									<a href="javascript:inquiry_detail(${list.unq})">${list.title}</a>
									</td>
									<td class="board-writer">${list.nikName}</td>
									<td>${list.rdate}</td>
									<td class="board-answer" 
									<c:if test="${list.status =='답변완료'}">
									style="color:#ffb319"
									</c:if>>${list.status}</td>
								</tr>
							<c:set var="rownum" value="${rownum-1 }"/>
							</c:forEach>	
							</c:when>
							<c:when test="${page.total eq 0}">
								<tr>
									<td colspan="6">문의내역이 없습니다.</td>
								</tr>
							</c:when>
							</c:choose>
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