<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	String cssName = request.getParameter("cssName");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오렌지 마켓</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>"/>
    <script type="text/javascript" src="<c:url value='/js/layout.js'/>"></script>
    
    <!-- 카카오 맵 -->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53bde35487d6e1f576b948a174872df9"></script>
    
    <!-- 카카오 주소 검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
	

	<!-- page style -->
	<%	
	if(cssName != null && !cssName.equals("")) {
		pageContext.setAttribute("cssName", cssName);
	%>
		<link type="text/css" rel="stylesheet" href="/css/${cssName}.css"/>
	<%
	}
	%>
</head>

<!-- 헤더 -->

<header id="header">
	<div class="header-inner">
		<a href="main"><img class="logo-img" src="/images/logo-header.png"></a>
		<div class="header-search clx">
			<input type="text" name="" id="">
			<button type="button">
				<img src="/images/icons/search_w.png">
			</button>
		</div>
		<!-- 네비게이션 -->
		<%@ include file="/include/gnb.jsp"%>
		<!-- 네비게이션 -->

		<div class="log-menu">
			<ul class="clx">
			<c:choose> 
				<c:when test="${sessionId == null}">
					<li><a href="join">SIGNUP</a></li>
					<li><a href="login">LOGIN</a></li>
				</c:when>
				<c:when test="${sessionId != null}">
					<li class="nik"><span class="nik_ellip">${USER_NIK}</span><span>님</span></li>
					<li><a href="logout">LOGOUT</a></li>
				</c:when>
			 </c:choose>
			</ul>
		</div>
		<div class="util-menu">
			<a href="trade-history"><img src="/images/icons/shop.png" /></a>
			<a href="chat"><img src="/images/icons/ico_chat.png" /></a> 
			<a href="mypage"><img src="/images/icons/ico_user_line.png" /></a>
		</div>
	</div>
</header>

<body>
<main id="contWrap">
