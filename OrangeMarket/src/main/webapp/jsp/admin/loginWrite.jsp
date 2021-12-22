<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrangeMarket 관리자 페이지</title>
</head>
<link rel="stylesheet" href="/css/admin_main.css">

<body>
<div class="out-line">
	<div class="login-main">
		<div class="login-text"><img class="login-logo-img" src="/images/admin/hdlogo.PNG">ADMIN</div>
		<div class="login-inner">
		<form id="frm">
			<div class="login-input">
				<input type="text" id="adminId" name="adminId" class="login-input_id" placeholder="아이디를 입력하세요.">
				<input type="password" id="adminPass" name="adminPass" class="login-input_pw" placeholder="비밀번호를 입력하세요.">
			</div>
		</form>	
			<div class="login-ckbox"><input type="checkbox">아이디 저장</div>
			<button class="login-btn" id="login">로그인</button>
		</div>
	</div>
</div>

</body>
</html>