<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="chat" />
</jsp:include>
<!-- 헤더 -->
<script>

</script>
<!-- 현재시간 가져오기 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<c:set var="sessionId" value="${sessionId }"/>
<!-- 페이지 wrapper -->
<article class="pg-wrap pg-chat">

	<article class="chat-cont-wrap">
		<div class="cont-inner clx" id="chatRefresh">
			<div class="chat-list">
				<!-- 채팅목록 시작 -->
				<c:if test="${fn:length(list) == 0}">
				<div style="font-size:14px; margin-top:220px; text-align:center; color:#ffb319;">
				채팅을 이용하신 적이 없으시군요!<br>원하시는 물품의 판매자와 대화해보세요!</div>
				</c:if>
				<c:forEach var="channel" items="${list}">
				<c:choose>
				<c:when test="${channel.channel == vo.channel}"><c:set var="on" value="style='background:#FFFAFA;'"/></c:when>
				<c:when test="${channel.channel != vo.channel}"><c:set var="on" value=""/></c:when>
				</c:choose>
				<div class="chatlist-item" ${on}>
					<input type="hidden" id="nowChannel" name="nowChannel" value="${channel.channel}">
					<!-- 현재 로그인한 계정의 대화상대 구분 -> 내가 판매자면 구매자 정보, 내가 구매자면 판매자 정보 -->
					<c:choose>
						<c:when test="${channel.buyer == sessionId }">
						<div class="item-left">
							<img class="chatlist-image" src="/images/profiles/${channel.sellerProfile}"><br>
						</div>
	
						<div class="item-center">
							<p class="profile-nick">${channel.sellerNik}</p>
							<p class="chatlist-content">${channel.lastContent}</p>
						</div>
						<!-- 얻어온 현재시간과 db에서 불러온 udate를 비교하여 오늘이면 시간, 지난 날짜면 연월일 출력 -->
						<fmt:parseDate var="timeFmt" pattern="yyyy-mm-dd HH:mm:ss.SSS" value="${channel.udate}"/>
						<fmt:formatDate var="times" pattern="a hh:mm" value="${timeFmt}"/>
						<c:choose>
							<c:when test="${fn:substring(channel.udate,0,10) == today}">
								<div class="item-right">
									<span class="chatlist-time">${times}</span><br>
								<c:if test="${channel.status != 0}">	
									<div class="item-count">${channel.status}</div>
								</c:if>
								</div>
							</c:when>
							<c:when test="${fn:substring(channel.udate,0,10) != today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,0,10)}</span><br>
								<c:if test="${channel.status != 0}">	
									<div class="item-count">${channel.status}</div>
								</c:if>
								</div>
							</c:when>
						</c:choose>
						</c:when>
						<c:when test="${channel.buyer != sessionId}">
						<div class="item-left">
							<img class="chatlist-image" src="/images/profiles/${channel.buyerProfile}"><br>
						</div>
	
						<div class="item-center">
							<p class="profile-nick">${channel.buyerNik}</p>
							<p class="chatlist-content">${channel.lastContent}</p>
						</div>
						<fmt:parseDate var="timeFmt" pattern="yyyy-mm-dd HH:mm:ss.SSS" value="${channel.udate}"/>
						<fmt:formatDate var="times" pattern="a h:mm" value="${timeFmt}"/>
						<c:choose>
							<c:when test="${fn:substring(channel.udate,0,10) == today}">
								<div class="item-right">
									<span class="chatlist-time">${times}</span><br>
								<c:if test="${channel.status != 0}">	
									<div class="item-count">${channel.status}</div>
								</c:if>	
								</div>
							</c:when>
							<c:when test="${fn:substring(channel.udate,0,10) != today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,0,10)}</span><br>
								<c:if test="${channel.status != 0}">
									<div class="item-count">${channel.status}</div>
								</c:if>	
								</div>
							</c:when>
						</c:choose>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
			</div>
			<!-- chat-list end/ 채팅목록 종료 -->
			<div class="chat-content">
				<div class="chat-bar">
					<!-- 채팅창에 띄워진 상대방 프사,닉네임,거래품목이미지,가격 -->
					<div class="bar-inner">
					<c:choose>
						<c:when test="${vo.channel eq null }">
							<p class="bar-title">오렌지마켓 회원들과의 채팅을 이용해보세요!</p>
							<p class="bar-price"></p>
						</c:when>
						<c:when test="${vo.channel ne null }">
							<p class="bar-title">${vo.title }</p>
							<p class="bar-price">${vo.price}원</p>
						</c:when>
					</c:choose>
					</div>
				</div>
				<!-- chat-bar -->
				<div class="chat_wrap">
					<div class="inner" id="chatWrap">
					<!-- 초이스 문을 이용해 세션값이 sender와 같으면 나의 메시지, 다르면 상대 메시지 -->
					<c:forEach var="chatList" items="${chatList}">
					<c:if test="${fn:substring(chatList.rdate,0,10) != changeDate }">
					<div class="changeDate">${fn:substring(chatList.rdate,0,10)}</div>
					</c:if>
					<c:choose>
						<c:when test="${chatList.sender != sessionId }">
						<c:set var="msg" value="class='item' id='item'"/>
						</c:when>
						<c:when test="${chatList.sender == sessionId }">
						<c:set var="msg" value="class='item mymsg'"/>
						</c:when>
					</c:choose>	
						<fmt:parseDate var="timeFmt" pattern="yyyy-mm-dd HH:mm:ss.SSS" value="${chatList.rdate}"/>
						<fmt:formatDate var="times" pattern="a h:mm" value="${timeFmt}"/>
							<div ${msg}>
								<div class="box">
									<p class="msg">${chatList.content}</p>
									<span class="time">${times}</span>
								</div>
								<!--box end  -->
							</div>
							<!--item end  -->
					<c:set var="changeDate" value="${fn:substring(chatList.rdate,0,10)}"/>
					</c:forEach>	
					</div>
					<!--inner end  -->
					<!--scrollbar set  -->
					<script src="js/scrollbar.js"></script>
				</div>
				<!--chat_wrap end  -->
				<form id="frm">
				<div class="messagebox">
					<input type="hidden" id="channel" name="channel" value="${vo.channel}">
				<c:choose>	
					<c:when test="${vo.seller == sessionId}">				
					<input type="hidden" id="receiver" name="receiver" value="${vo.buyer}">
					</c:when>
					<c:when test="${vo.buyer == sessionId}">
					<input type="hidden" id="receiver" name="receiver" value="${vo.seller}">
					</c:when>				
				</c:choose>	
					<input type="hidden" id="sender" name="sender" value="${sessionId}">
					<input type="text" class="mymsg" name="content"
							placeholder="메세지를 입력해주세요!" id="input-text" autofocus autocomplete="off">
					<input type="button" class="sendbtn" id="sendChat" value="전송하기">
				</div>
				</form>
			</div>
			<!-- chatcontent div end -->
		</div>
		<!-- container div end -->
	</article>

</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" >
	<jsp:param name="jsName" value="chat" />
</jsp:include>
<!-- 푸터 -->