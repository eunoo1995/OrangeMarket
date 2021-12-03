<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!-- 헤더 -->
    <jsp:include page="/include/header.jsp" flush="false">
        <jsp:param name="cssName" value="member" />
    </jsp:include>
    <!-- 헤더 -->

    <article class="pg-wrap pg-member pg-join-result">
    
        <header class="sub-page-head">
            <div class="cont-inner">
               <h3 class="join-result-tit">OOO 님 안녕하세요!</h3>
            </div>
        </header>
        
        <article class="cont-article txt-c">
            <div class="cont-inner">

                <figure class="profile-thumb">
                    <img src="/images/member/profile.jpg" class="profile-img" />
                    <a href="#" class="btn-profile-edit">편집</a>
                </figure>

                <div class="notice-box">
                    <p class="notice-box-tit">아직 동네인증을 하지 않으셨네요!</p>
                    <p>
                        저희 마켓은 동네이웃 간 거래 서비스로 인증을 하지 않으시면 거래가 제한됩니다.<br />
                        인증하러 가시겠어요?
                    </p>

                    <a href="#" class="btn btn-solid-point">인증하러 가기</a>
                </div>

                <a href="index.html" class="btn-goto-main btn-txt">메인으로 가기</a>

            </div>
        </article>
    </article>


    <!-- 푸터 -->
    <jsp:include page="/include/footer.jsp" flush="false" />
    <!-- 푸터 -->