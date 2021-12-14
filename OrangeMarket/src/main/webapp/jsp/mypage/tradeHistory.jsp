<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>거래내역 화면1</title>
<link type="text/css" rel="stylesheet" href="" />
</head>

<style>
.serv_list {
	padding-top: 70px;
	padding-bottom: 200px;
}

.serv_list .container {
	width: 1100px;
	margin: auto;
}

.serv_list .container .title .category {
	position: relative;
	display: inline-block;
	margin-bottom: 50px;
	background-color: #fff;
	font-weight: 400;
	color: #999;
	width: 250px;
	text-align: left;
	cursor: pointer;
	font-size: 36px;
}

.product_write_category {
	position: absolute;
	width: 100px;
	height: 30px;
	font-size: 18px;
	margin-top: 3px;
	margin-left: 750px;
}

.css3-tab {
	list-style: none;
	margin: 0 auto 40px;
	padding: 38px 0 0 0;
	position: relative;
	width: 1100pxx;
}

.css3-tab input[type='radio'] {
	display: none;
}

.css3-tab .css3-tab-nav {
	display: table;
	table-layout: fixed;
	width: 100%;
}

/* 상단 메뉴 탭 색상  */
.css3-tab .css3-tab-nav label {
	display: table-cell;
	background-color: #ffffff;
	color: #ffb319;
	padding: 15px;
	text-align: center;
	transition: all .3s ease 0s;
	font-size: 20px;
}


/* 마우스 커서 올릴 시 상태 */
.css3-tab .css3-tab-nav label:hover {
	cursor: pointer;
	background: #ffb319;
	color: #fff;
}

@media ( max-width : 1100px) {
	.css3-tab .css3-tab-nav {
		display: block;
		margin: 0 0 20px;
	}
	.css3-tab .css3-tab-nav label {
		display: block;
		box-sizing: border-box;
		width: 50%;
		padding: 20px;
	}
}

/* 본문 내용 css */
.css3-tab .css3-tab-content {
	padding: 25px;
	display: none;
	background: #fff;
	text-align: center;
}

/* 구매 내역 화면 */

/* 탭 메뉴 선택 시 화면 */
.css3-tab input[id='tabOne']:checked ~ .css3-tab-nav label[for='tabOne']
	{
	font-size: 20px;
	color: white;
	background: #ffb319;
	cursor: default;
}

/* 선택 메뉴 본문 */
.css3-tab input[id='tabOne']:checked ~ div.tab-one {
	display: block;
	border-top: solid 3px #ffb319;
}

/* 판매 내역 화면 */

/* 탭 메뉴 선택 시 화면 */
.css3-tab input[id='tabTwo']:checked ~ .css3-tab-nav label[for='tabTwo']
	{
	font-size: 20px;
	color: white;
	background: #ffb319;
	cursor: default;
}

/* 선택 메뉴 본문 */
.css3-tab input[id='tabTwo']:checked ~ div.tab-two {
	display: block;
	border-top: solid 3px #ffb319;
}

</style>



<body>

	<!-- 헤더 -->
	<header>
	</header>

	<section class="serv_list">

		<!-- 기본 정의 화면 -->
		<div class="container">

			<!-- 타이틀 및 메뉴 -->
			<div class="title">

				<!-- 카테고리 -->
				<span class="category">거래내역</span>
				 	<select name="category" id="category" class="product_write_category">
				   		<option value="2">전체</option>
				   		<option value="0">판매중</option>
				   		<option value="1">판매완료</option>
				  	 </select>

			</div>

			<!-- Pure CSS Menu -->
			<div class='css3-tab'>
				<input type='radio' name='a' id='tabOne' tabindex="1" >
				<input type='radio' name='a' id='tabTwo' tabindex="2" checked>

				<div class="css3-tab-nav">
					<label for='tabOne'>판매내역</label>
					<label for='tabTwo'>구매내역</label>
				</div>

				<div class='css3-tab-content tab-one'>
					<!-- start slipsum code -->
					<c:forEach var="i" begin="1" end="10">
					<div style="width: 1100px; text-align: center; margin-bottom: 20px;">
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">판매 제품 제목을 표시합니다.</span>
						
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">30,000원</span>	
						
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 80px;">거래중</span>
						<br>
					</div>
					</c:forEach>
				</div>

				<div class='css3-tab-content tab-two'>
					<!-- start slipsum code -->
					<c:forEach var="i" begin="1" end="10">
					<div style="width: 1100px; text-align: center; margin-bottom: 20px;">
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">구매 제품 제목을 표시합니다.</span>
						
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 100px;">30,000원</span>	
						
							<span style="font-size: 28px; color: #999; width: 200px; margin-right: 80px;">거래중</span>
						<br>
					</div>
					</c:forEach>
				</div>

			</div>
		</div>



	</section>

	<!-- 푸터 -->
	<footer>
	</footer>

</body>

</html>