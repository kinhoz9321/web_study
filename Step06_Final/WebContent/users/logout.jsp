<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그 아웃은 session scope 에 저장된 id 값을 삭제 하면 된다.
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
<script>
	alert("로그아웃 되었습니다.");
	location.href="${pageContext.request.contextPath}/";
</script>
</body>
</html>