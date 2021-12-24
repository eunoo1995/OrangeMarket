<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오렌지 마켓 ADMIN</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
     
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/admin_main.css'/>"/>
    

</head>
	<header id="header">
        <div class="header-inner">
        	<div class="header-logo"><img class="logo-img" src="/images/admin/hdlogo.PNG">ADMIN</div>
        	<div class="header-logout"><a href="admin-logout">Logout</a></div>
        </div> 
    </header>