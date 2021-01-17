<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session scope 에서 로그인 된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2. 로그인 된 아이디를 이용해서 DB에 있는 가입정보를 삭제한다.
	boolean isSuccess=UsersDao.getInstance().delete(id);
	//3. 로그아웃 처리를 하고 삭제 되었는지 정보를 응답한다.
	
	//4. 회원탈퇴를 하고 인덱스로 돌아갔을 때 로그인 중이 떠 있지 않도록 romove 해준다.
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<p>회원 탈퇴가 완료 되었습니다.</p>
	<a href="${pageContext.request.contextPath}/index.jsp">인덱스로 돌아가기</a>
<%}else{ %>
	<p>회원 탈퇴 실패</p>
<%} %>
</body>
</html>