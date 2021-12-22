<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String jsName = request.getParameter("jsName");
	if(jsName != null && !jsName.equals("")) {
		pageContext.setAttribute("jsName", jsName);
	%>
		<script type="text/javascript" src="/js/${jsName}.js"></script>
	<%
	}
%>
<nav id="nav">
    <div class="nav-inner">
	    <div class="nav-title">관리자 Menu</div>
	    <p>- 회원관리</p>
	    <ul>
            <li><a href="admin-memberlist">회원정보목록</a></li>
            <li><a href="admin-suspendlist">정지회원목록</a></li>
            <li><a href="admin-withdrawallist">탈퇴회원목록</a></li>
        </ul>
        <p>- 카테고리</p>
	    <ul>
            <li><a href="category-modify">카테고리 메뉴관리</a></li>
            <li><a href="#">카테고리 목록관리</a></li>
        </ul>
        <p>- 고객센터</p>
	    <ul>
            <li><a href="admin-inquirylist">문의 리스트</a></li>
            <li><a href="admin-reportlist">신고 리스트</a></li>
        </ul>
        <p>- 통계</p>
	    <ul>
            <li><a href="admin-statistics">사이트 통계</a></li>
        </ul>
    </div>
    </nav>