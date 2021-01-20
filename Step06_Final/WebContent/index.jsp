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
<style>
	#img{
		padding-top:50px;
		padding-bottom:50px;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container text-center" id="img">
		<img src="${pageContext.request.contextPath}/images/tulip2.jpg" width="500px"/>
	</div>
	<div class="container">
		<ul class="list-group">
			<li class="list-group-item"><a href="cafe/list.jsp" style="color:black">게시판 목록 보기</a></li>
			<li class="list-group-item"><a href="file/list.jsp" style="color:black">자료실 목록 보기</a></li>
			<li class="list-group-item"><a href="gallery/list.jsp" style="color:black">갤러리 목록 보기</a></li>
			<li class="list-group-item"><a href="memo.jsp" style="color:black">개인 프로젝트 구현 내용 보기</a></li>
		</ul>
	</div>
</body>
</html>