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
$(function(){
	
	$(".chatlist-item").click(function(){
		var channel = $(this).children("#nowChannel").val();
		location = "chat?channel="+channel;
	});
	$("#sendChat").click(function(){
		if($("#channel").val().trim() == "" ) {
  			alert("대화방을 선택 후 메세지를 전송해주세요.");
  			return false;
  		}
		if($("#input-text").val().trim() == "" ) {
  			alert("메세지를 입력하지 않았습니다.");
  			$("#input-text").focus();
  			return false;
  		}
		var formdata = $("#frm").serialize();
  		$.ajax({
  			type : "post",
  			url  : "chat-save",
  			data : formdata,
  			datatype : "text",
  			success : function(data) {
  				location="chat?channel="+data;
  			},
  			error : function() {
  					alert("전송실패");
  			}
  		});
	});
});


</script>
<!-- 현재시간 가져오기 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<!-- 페이지 wrapper -->
<article class="pg-wrap pg-chat">

	<article class="chat-cont-wrap">
		<div class="cont-inner clx">
			<div class="chat-list">
				<!-- 채팅목록 시작 -->
				<c:forEach var="channel" items="${list}">
				<div class="chatlist-item">
					<input type="hidden" id="nowChannel" name="nowChannel" value="${channel.channel}">
					<!-- 현재 로그인한 계정의 대화상대 구분 -> 내가 판매자면 구매자 정보, 내가 구매자면 판매자 정보 -->
					<c:choose>
						<c:when test="${channel.buyer == 2021121701 }">
						<div class="item-left">
							<img class="chatlist-image" src="/images/member/${channel.sellerProfile}"><br>
						</div>
	
						<div class="item-center">
							<p class="profile-nick">${channel.sellerNik}</p>
							<p class="chatlist-content">${channel.lastContent}</p>
						</div>
						<!-- 얻어온 현재시간과 db에서 불러온 udate를 비교하여 오늘이면 시간, 지난 날짜면 연월일 출력 -->
						<c:choose>
							<c:when test="${fn:substring(channel.udate,0,10) == today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,10,16)}</span><br>
								</div>
							</c:when>
							<c:when test="${fn:substring(channel.udate,0,10) != today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,0,10)}</span><br>
								</div>
							</c:when>
						</c:choose>
						</c:when>
						<c:when test="${channel.buyer != 2021121701 }">
						<div class="item-left">
							<img class="chatlist-image" src="/images/member/${channel.buyerProfile}"><br>
						</div>
	
						<div class="item-center">
							<p class="profile-nick">${channel.buyerNik}</p>
							<p class="chatlist-content">${channel.lastContent}</p>
						</div>
						<c:choose>
							<c:when test="${fn:substring(channel.udate,0,10) == today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,10,16)}</span><br>
								</div>
							</c:when>
							<c:when test="${fn:substring(channel.udate,0,10) != today}">
								<div class="item-right">
									<span class="chatlist-time">${fn:substring(channel.udate,0,10)}</span><br>
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
					<c:choose>
						<c:when test="${chatList.sender != 2021121701 }">
							<div class="item" id="item">
								<div class="box">
									<p class="msg">${chatList.content}</p>
									<c:choose>
										<c:when test="${fn:substring(chatList.rdate,0,10) == today}">
											<span class="time">${fn:substring(chatList.rdate,10,16)}</span>
										</c:when>
										<c:when test="${fn:substring(chatList.rdate,0,10) != today}">
											<span class="time">${fn:substring(chatList.rdate,0,10)}</span>
										</c:when>
									</c:choose>
								</div>
								<!--box end  -->
							</div>
							<!--item end  -->
						</c:when>
						<c:when test="${chatList.sender == 2021121701 }">
							<div class="item mymsg">
								<div class="box">
									<p class="msg">${chatList.content}</p>
									<c:choose>
										<c:when test="${fn:substring(chatList.rdate,0,10) == today}">
											<span class="time">${fn:substring(chatList.rdate,10,16)}</span>
										</c:when>
										<c:when test="${fn:substring(chatList.rdate,0,10) != today}">
											<span class="time">${fn:substring(chatList.rdate,0,10)}</span>
										</c:when>
									</c:choose>
								</div>
								<!--box end  -->
							</div>
							<!--item end  -->
						</c:when>
					</c:choose>
					</c:forEach>	
					</div>
					<!--inner end  -->
				</div>
				<!--chat_wrap end  -->
				<form id="frm">
				<div class="messagebox">
					<input type="hidden" id="channel" name="channel" value="${vo.channel}">
					<input type="hidden" id="title" name="title" value="${vo.title}">
					<input type="hidden" id="price" name="price" value="${vo.price}">
				<c:choose>	
					<c:when test="${vo.seller == 2021121701}">				
					<input type="hidden" id="receiver" name="receiver" value="${vo.buyer}">
					</c:when>
					<c:when test="${vo.buyer == 2021121701}">
					<input type="hidden" id="receiver" name="receiver" value="${vo.seller}">
					</c:when>				
				</c:choose>	
					<input type="hidden" id="sender" name="sender" value=2021121701>
					<input type="text" class="mymsg" name="content"
							placeholder="메세지를 입력해주세요!" id="input-text">
					<input type="button" class="sendbtn" id="sendChat" value="전송하기">
				</div>
				</form>
			</div>
			<!-- chatcontent div end -->
		</div>

		</div>
		<!-- container div end -->
	</article>

</article>
<!-- 페이지 wraper end -->

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp" flush="false" />
<!-- 푸터 -->