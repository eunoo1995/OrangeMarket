<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrangeMarket 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/css/admin_main.css">

<script src="/js/admin.js"></script>
       
</head>
<body>
	<%@include file="/include/admin_header.jsp" %>
	<%@include file="/include/admin_nav.jsp" %>
	
    <section id="section">
    	<div class="section-inner">
    		<div class="section-title">자주묻는질문</div>
    		<div class="section-content">
    			<div class="QnA-main">
		    		<input class="QnA-search-input" type="text" name="" placeholder="자주 묻는 질문에 대해 검색해보세요!">
		    		<button class="QnA-search-button" type="button"><img src="/images/admin/search_w.png"></button>
	    			<table class="QnA-titleList">
	    				<tr>
							<th>
								<ul>
									<li>· 운영정책</li>
									<li>· 거래품목</li>
									<li>· 이벤트/초대</li>
								</ul>
							</th>
							<th>
								<ul>
									<li>· 계정/인증</li>
									<li>· 이용재제</li>
									<li>· 지역광고</li>
								</ul>
							</th>
							<th>
								<ul>
									<li>· 구매/판매</li>
									<li>· 동네생활</li>
									<li>· 기타</li>
								</ul>
							</th>
	    				</tr>
	    			</table>
	    			<div class="QnA-message">사용자들의 운영정책 관련 자주 묻는 질문을 확인하세요.</div>
    				
    				<div class="QnA-accordion">
    				<!-- 반복문 사용 -->
						<p class="QnA-title">
						Q . 커뮤니티 가이드라인
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</div>
						<p class="QnA-title">
						Q . 중고거래 가능 물품
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</div>
						<p class="QnA-title">
						Q . 지켜야 할 매너
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</div>
						<p class="QnA-title">
						Q . 거래 및 환불 정책
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</div>
						<p class="QnA-title">
						Q . 채팅 이용방법
						</p>
						<div class="QnA-detail">
							<p>
								우리는 함께 신뢰를 만들어요.<br>
								항상 솔직하게 대화해요.<br>
								서로 배려하며, 약속은 반드시 지켜요.<br>
								자세하고 정확한 정보를 제공해요.<br>
								따뜻한 매너를 함께 만들어요<br>
								누구나 찾기 쉽고 안전한 공공장소에서 만나요.<br>
							</p>
							<button type="button">수정</button>
							<button type="button">삭제</button>
						</div>
    				</div>
    				<div class="QnA-add">
    				<button type="button">등록</button>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
</body>
</html>