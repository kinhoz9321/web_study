<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대 경로로 page의 value를 정확히 명시해야 한다. --%>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="member/list.jsp">회원 목록</a></li>
		<li><a href="todo/list.jsp">할일 목록</a></li>
		<li><a href="test/signup_form.jsp">회원가입 폼 작성</a></li>
	</ul>
</div>
</body>
</html>