<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
		<ul class="list-group">
		<li class="list-group-item"><a href="cafe/list.jsp" style="color:black">게시판 목록 보기</a></li>
		<li class="list-group-item"><a href="file/list.jsp" style="color:black">자료실 목록 보기</a></li>
		<li class="list-group-item"><a href="gallery/list.jsp" style="color:black">갤러리 목록 보기</a></li>
	</ul>
	</div>
</body>
</html>