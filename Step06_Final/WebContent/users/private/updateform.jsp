<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 영역에 저장된 아이디를 이용해서
	String id=(String)session.getAttribute("id");
	//DB 에 저장된 가입정보를 읽어온다.
	//(dto 를 이용해서 input value 에 가입 정보를 뿌려줘야 한다.)
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	#profileImage{
		width: 150px; /*크기*/
		height: 150px; /*크기*/
		border: 1px solid #cecece;
		border-radius: 50% /*원형으로 만들기 정도*/
	}
	/*프로필 업로드 폼을 화면에 안보이게 숨긴다.*/
	#profileForm{
		display: none;
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
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/users/private/info.jsp">가입 정보 관리</a>
			</li>
			<li class="breadcrumb-item">가입 정보 수정</li>
		</ul>
	</nav>
</div>
<div class="container">
	<h2 class="text-center">가입 정보 수정</h2>
	<div class="row justify-content-center">
		<div class="col-md-6">
			<form action="update.jsp" method="post" class="form-group">
				<label for="profileImage">프로필 이미지</label>
				<div class="form-group text-center">
					<%-- a링크 프로필 사진을 눌렀을 때 이미지 업로드 가능하게 만들기 --%>
					<a id="profileLink" href="javascript:">
					<%if(dto.getProfile() == null){ %>
						<img id="profileImage" src="${pageContext.request.contextPath}/svg/person-circle.svg" />
					<%}else{ %>
						<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile() %>" />
					<%} %>
					</a>
					<small class="text-muted form-text">프로필 이미지를 클릭해서 사진을 변경할 수 있습니다.</small>
				</div>
				<div class="form-group">
					<label for="id">아이디</label>
					<input class="form-control" type="text" id="id" value="<%=dto.getId() %>" disabled/>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input class="form-control" type="email" id="email" name="email" value="<%=dto.getEmail() %>"/>
				</div>
				<div class="text-center">
					<button class="btn btn-success" type="submit">수정</button>
					<button class="btn btn-danger" type="reset">취소</button>
				</div>
			</form>
		</div>
	</div>
	<%-- 프로필 이미지에 자바스크립트로 아래 폼을 구현했으니 폼을 안보이게 만들어도 된다. --%>
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<label for="image">프로필 이미지 선택</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .jfif"/><br />
		<button type="submit">업로드</button>
	</form>
</div>
<script>
	//프로필 이미지를 클릭했을 때 실행할 함수 등록
	$("#profileLink").on("click", function(){
		//아이디가 image 인 요소를 강제 클릭하기
		$("#image").click();
	});
	
	//이미지를 선택했을 때 실행할 함수 등록
	$("#image").on("change", function(){
		//폼을 강제 제출해서 선택된 이미지가 업로드 되도록 한다.
		$("#profileForm").submit();
	});
</script>
</body>
</html>