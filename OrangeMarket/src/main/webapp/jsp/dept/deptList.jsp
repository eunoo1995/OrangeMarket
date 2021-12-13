<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서리스트</title>
<style type="text/css">
.btn {
	display: inline-block;
	padding: 5px 10px;
	text-align: center;
	font-size: 12px;
	border: 1px solid #ddd;
	background-color: pink;
	text-decoration: none;
}

table {
	margin-top: 10px;
	text-align: center;
}
</style>
</head>
<body>

	<div>
		<a class="btn" href="deptWrite.jsp">부서등록</a>
	</div>

	<form name="form">
		<table border="1" width="400">
			<colgroup>
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<!-- 
					- var="result": 변수를 선언한 것이다
					- ${list}: 컨트롤러에서 map.addAttribute("list", list);에서 설정한 변수를 가져온 것이다
					- varStatus: 아이템에 대한 정보를 얻을 수 있다.
					- jsp 문법도 사용할 수 있다.
				 -->
				 <c:forEach var="i" items="${list }">
						${i.deptno}
				</c:forEach>
				
				<tr>
					<td>1</td>
					<td>${vo.deptno }</td>
					<td>${vo.dName}</td>
					<td>${vo.loc}</td>
					<td>---</td>
				</tr>
				
			</tbody>
		</table>
	</form>
	
	<div>
		<!-- step은 증가하는 정도를 정할 수 있다 -->
		<c:forEach var="i" begin="1" end="10" step="1">
			${i}
			<c:if test="${i==5}">
				<br/>
			</c:if>	
		</c:forEach>
	</div>
	
	
	
	

	<script>
		
	</script>

</body>
</html>