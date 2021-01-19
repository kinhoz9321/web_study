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
</head>
<body>
	<div class="container">
		<%if(id!=null){ %>
			<div>
				<a href="users/private/info.jsp"><%=id %></a>님 로그인 중
				<button><a href="users/logout.jsp">로그아웃</a></button>
			</div>
		<%} %>
	</div>
	<div class="container">
		<ul>
			<li><a href="users/signup_form.jsp">회원가입</a></li>
			<li><a href="users/loginform.jsp">로그인</a></li>
			<li><a href="cafe/list.jsp">카페 글 목록 보기</a></li>
			<li><a href="file/list.jsp">자료실 목록 보기</a></li>
			<li><a href="gallery/list.jsp">갤러리 목록 보기</a></li>
			<li><a href="file/list2">자료실 목록보기 (MVC 패턴)</a></li>
		</ul>
	</div>
</body>
</html>