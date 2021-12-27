<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오렌지 마켓</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/mypage.css'/>"/>
</head>
<script src="/js/mypage.js"></script>
<body>
<div class="withdrawal-main">
	<div class="withdrawal-title">
		회원탈퇴
	</div>
	<p class="withdrawal-li">· 유의사항</p>
	<div class="withdrawal-notice">
		- 3일 이내에 회원 탈퇴 취소신청 시 확인 후 복원이 가능합니다.<br><br>
		- 탈퇴가 완료된 후에는 회원님의 계정정보를 복원할 수 없으며,<br>
		&nbsp&nbsp탈퇴 진행 시 해당 계정은 영구적으로 삭제되어 재가입이 불가능합니다.
	</div>
	<p class="withdrawal-li">· 탈퇴사유</p>
	<div>
		<select id="reason" class="withdrawal-select">
			<option value="이용빈도 낮음">이용빈도 낮음</option>
			<option value="개인정보 유출 우려">개인정보 유출 우려</option>
			<option value="사이트 이용 불편">사이트 이용 불편</option>
			<option value="개인적인 사유(기타)">개인적인 사유(기타)</option>
		</select>
	</div>
	<p class="withdrawal-li">· 비밀번호 재확인</p>
	<div>
		<table class="withdrawal-table">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>이메일</th>
				<td>${vo.email}</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="userPw" placeholder="비밀번호를 입력하세요."></td>
			</tr>
		</table>
	</div>
	<div class="withdrawal-div1">
	<input class="withdrawal-checkbox" type="checkbox" id="agreeChk">
	<span class="withdrawal-chk">해당 내용을 모두 확인했으며, 회원 탈퇴를 동의합니다.</span>
	</div>
	<div class="withdrawal-div2">
		<input type="button" class="withdrawal-submit-btn" id="withdrawalBtn" value="회원탈퇴">
	</div>
</div>
</body>
</html>