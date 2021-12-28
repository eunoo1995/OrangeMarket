<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="gnb">
	<p class="gnb-tit">
		CATEGORY <img src="/images/icons/dropbtn.png">
	</p>
	<div class="gnb-list">
		<p class="gnb-titUp">
			CATEGORY <img src="/images/icons/hidebtn.png">
		</p>
		<ul class="gnb-ul">
			<!-- 반복문 사용 예정 -->
			<c:forEach var="c" items="${list }">
				<c:if test="${c.cateStatus == 'Y'}">
					<li><a href="product-list?proCategoryCode=${c.proCategoryCode }">${c.category }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</nav>
