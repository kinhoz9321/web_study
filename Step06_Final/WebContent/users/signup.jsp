<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송 되는 가입할 회원의 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//UsersDto 객체에 회원 정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//UsersDao 객체를 이용해서 DB 에 저장한다.
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	//결과를 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container form-group">
	<%if(isSuccess){ %>
	<div class="text-center">
		<h1><%=id %> 님 가입을 축하드립니다.</h1>
		<button class="btn btn-success">
			<a href="${pageContext.request.contextPath}/loginform.jsp" style="color:white">로그인 하러가기</a>
		</button>
		<button class="btn btn-warning">
			<a href="${pageContext.request.contextPath}/index.jsp" style="color:white">홈페이지로 돌아가기</a>
		</button>
	</div>
	<%}else{ %>
	<div class="text-center">
		<h1>가입에 실패 했습니다.</h1>
		<button class="btn btn-success">
			<a href="signup_form.jsp" style="color:white">다시 회원가입 하러가기</a>
		</button>
		<button class="btn btn-warning">
			<a href="${pageContext.request.contextPath}/index.jsp" style="color:white">홈페이지로 돌아가기</a>
		</button>
	</div>
	<%} %>
</div>
</body>
</html>