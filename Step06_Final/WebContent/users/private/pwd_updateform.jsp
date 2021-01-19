<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/users/private/info.jsp">가입 정보 관리</a>
			</li>
			<li class="breadcrumb-item">비밀번호 수정</li>
		</ul>
	</nav>
	</div>
	<div class="container">
		<h2 class="text-center">비밀번호 수정</h2>
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form action="pwd_update.jsp" method="post" id="myForm">
					<div class="form-group">
						<label for="pwd">기존 비밀번호</label>
						<input class="form-control" type="password" name="pwd" id="pwd"/>
					</div>
					<div class="form-group">
						<label for="newPwd">새 비밀번호</label>
						<input class="form-control" type="password" name="newPwd" id="newPwd"/>
					</div>
					<div class="form-group">
						<label for="newPwd2">새 비밀번호 확인</label>
						<input class="form-control" type="password" name="newPwd2" id="newPwd2"/>
					</div>
					<div class="text-center">
						<button class="btn btn-success" type="submit">수정하기</button>
						<button class="btn btn-danger" type="reset">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>