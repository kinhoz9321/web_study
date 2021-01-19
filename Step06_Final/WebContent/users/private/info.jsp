<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session scope 에서 로그인 된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2. 로그인된 아이디를 이용해서 DB에서 가입정보를 불러온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/*프로필 이미지를 작은 원형으로 만든다.*/
	#profileImage{
		width: 150px; /*크기*/
		height: 150px; /*크기*/
		border: 1px solid #cecece;
		border-radius: 50% /*원형으로 만들기 정도*/
	}
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">가입 정보 관리</li>
		</ul>
	</nav>
</div>
<div class="container">
	<h2 class="text-center"><%=dto.getId() %> 님의 가입 정보</h2>
	<table class="table">
		<colgroup>
			<col width="200" style="border:solid 1px lightgrey"/>
			<col style="border:solid 1px lightgrey"/>
		</colgroup>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<%if(dto.getProfile() == null){ %>
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	  					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
					</svg>
				<%}else{ %>
					<img src="${pageContext.request.contextPath}<%=dto.getProfile() %>" id="profileImage"/>
				<%} %>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<div class="text-center">
		<button class="btn btn-success"><a href="updateform.jsp" style="color:white">가입 정보 수정</a></button>
		<button class="btn btn-danger"><a href="javascript:deleteConfirm()" style="color:white">탈퇴</a></button>
	</div>
	<script>
	function deleteConfirm(){
		let isDelete=confirm("<%=id%> 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/private/delete.jsp";
		}
	}
	</script>
</div>
</body>
</html>