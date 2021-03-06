<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 몇번 회원을 삭제할지 알아내서 (삭제할 회원의 번호를 읽어온다.)
String num=request.getParameter("num");
int strNum=Integer.parseInt(num);

//int num=Integer.parseInt(request.getParameter("num"));

//2. DB에서 실제로 삭제한다.
MemberDto dto=new MemberDto();
dto.setNum(strNum);

MemberDao dao=MemberDao.getInstance();
boolean isSuccess=dao.delete(strNum);

//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-danger">
			<strong><%=num %></strong> 번 회원의 정보를 삭제 했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">회원 정보 삭제 실패
			<a href="list.jsp" class="alert-danger">회원 목록 돌아가기</a>
		</p>
	<%} %>
</div>
</body>
</html>
<!-- 
몇 번 회원을 삭제할지 추가정보가 붙도록 우리가 코딩을 해야한다.
ex)/member/delete.jsp?num=917
 -->