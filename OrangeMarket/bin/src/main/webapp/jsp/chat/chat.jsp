<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<jsp:include page="/include/header.jsp" flush="false">
	<jsp:param name="cssName" value="chat" />
</jsp:include>
<!-- 헤더 -->

<!-- 페이지 wrapper -->
<article class="pg-wrap pg-chat">

	<article class="chat-cont-wrap">
		<div class="cont-inner clx">
			<div class="chat-list">
				<!-- 채팅목록 시작 -->
				<div class="chatlist-item">
					<!--반복문-->

					<div class="item-left">
						<img class="chatlist-image" src="/images/icons/ico_user_solid.png"><br>
					</div>

					<div class="item-center">
						<p class="profile-nick">사용자1</p>
						<p class="chatlist-content">
							최근채팅내용최근채팅내용최근채팅내용최근채팅내용최근채팅내용최근채팅내용최근채팅내용</p>
					</div>

					<div class="item-right">
						<span class="chatlist-time">오후 4:25</span><br>
					</div>

				</div>


				<div class="chatlist-item">

					<div class="item-left">
						<img class="chatlist-image" src="/images/icons/ico_user_solid.png"><br>
					</div>

					<div class="item-center">
						<p class="profile-nick">사용자2</p>
						<p class="chatlist-content">키보드 팔렸나요?</p>
					</div>

					<div class="item-right">
						<span class="chatlist-time">2021-09-09</span><br>
					</div>

				</div>
				<!-- chatlist-item end -->


			</div>
			<!-- chat-list end/ 채팅목록 종료 -->


			<div class="chat-content">


				<div class="chat-bar">
					<!-- 채팅창에 띄워진 상대방 프사,닉네임,거래품목이미지,가격 -->

					<div class="bar-inner">
						<img class="chatlist-image bar-item"
							src="/images/icons/ico_user_solid.png">
						<p class=" bar-item">상대 닉네임</p>

						<img class="chatlist-image  bar-item" src="/images/icons/star.png">
						<p class=" bar-item">가격</p>
					</div>

				</div>
				<!-- chat-bar -->

				<div class="chat_wrap">
					<div class="inner">


						<div class="item" id="item">
							<div class="box">
								<p class="msg">안녕하세요</p>
								<span class="time">오전 10:00</span>
							</div>
							<!--box end  -->
						</div>
						<!--item end  -->

						<div class="item mymsg">
							<div class="box">
								<p class="msg">안녕하세요</p>
								<span class="time">오전 10:00</span>
							</div>
							<!--box end  -->
						</div>
						<!--item end  -->




					</div>
					<!--inner end  -->
				</div>
				<!--chat_wrap end  -->
				<!--  -->
				<div class="messagebox">
					<input type="text" class="mymsg" name="msg"
						placeholder="메세지를 입력해주세요!" id="input-text">
					<!--   <input type="text" class="yourmsg" placeholder="yourmsg" name="msg">  -->
					<input type="button" class="sendbtn" id="sendbtn" value="전송하기">
				</div>


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