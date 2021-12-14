<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="mypage" />
</jsp:include>
<!-- 헤더 -->




<article class="trade">

	<!-- 구매내역 상단 구역 -->
    <article class="trade-title-article">
       
        <!-- 타이틀 및 선택 메뉴 버튼 -->
         <div class="trade-top">

				<!-- 타이틀 -->
				<span class="trade-title">거래내역</span>
				
				<!-- 선택 메뉴 --> 	
				 	<select name="tradeStatus" id="tradeStatus" class="trade-status-select">
				   		<option value="2">전체</option>
				   		<option value="0">판매중</option>
				   		<option value="1">판매완료</option>
				  	 </select>
         	
         </div>
         <!-- 타이틀 및 선택 메뉴 버튼 end -->
         
    </article>
    <!-- 구매내역 상단 구역 end -->
    
    <!-- 거래내역 탭 메뉴 구역 -->
    <article class="trade-tab-article">
    	
    		<!-- 탭 메뉴 전체 (라디오 버튼/콘텐츠 내용) -->
			<div class="trade-tab">
				
				<!-- 탭 버튼 -->
				<input type="radio" name="tabStatus" id="tabSell" tabindex="1" checked>
				<input type="radio" name="tabStatus" id="tabBuy" tabindex="2" >
				
				<!-- 탭 버튼 내부 글씨 -->
				<div class="trade-tab-nav">
					<label for='tabSell'>판매내역</label>
					<label for='tabBuy'>구매내역</label>
				</div>

				<!-- 판매내역 표시 -->
				<div class="trade-tab-content tab-sell">
					
					<!-- 판매내역 표시 -->
					<c:forEach var="i" begin="1" end="10">
					<div class="trade-content" style="width: 1100px; text-align: center; margin-bottom: 20px;">
							<span name="title" id="title" style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">판매 제품 제목을 표시합니다.</span>
						
							<span name="price" id="price" style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">30,000원</span>	
						
							<span name="status" id="status" style="font-size: 28px; color: #999; width: 200px; margin-right: 80px;">거래중</span>
						<br>
					</div>
					</c:forEach>
					
				</div>
				<!-- 판매내역 표시 end -->
				
				<!-- 구매내역 표시 -->
				<div class="trade-tab-content tab-buy">
					
					<!-- 구매내역 표시 -->
					<c:forEach var="i" begin="1" end="10">
					<div class="trade-content" style="width: 1100px; text-align: center; margin-bottom: 20px;">
							<span name="title" id="title" style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">구매 제품 제목을 표시합니다.</span>
						
							<span name="price" id="price" style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">30,000원</span>	
						
							<span name="status" id="status" style="font-size: 28px; color: #999; width: 200px; margin-right: 80px;">거래완료</span>
						<br>
					</div>
					</c:forEach>
					
				</div>
				<!-- 구매내역 표시 end -->

			</div>
			<!-- 탭 메뉴 전체 (라디오 버튼/콘텐츠 내용) end -->
			
    </article>
     <!-- 거래내역 탭 메뉴 구역 end -->

</article>

    
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false">
	<jsp:param name="jsName" value="mypage" />
</jsp:include>
<!-- 푸터 -->