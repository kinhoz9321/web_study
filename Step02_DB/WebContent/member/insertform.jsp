<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav><!-- 현재 위치를 확인하는 navbar (depth) -->
		<ul class="breadcrumb"><!-- breadcrumb(빵부스러기)-이동 경로 -->
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
			</li>
			<li class="breadcrumb-item">회원 추가</li><!-- 현재 위치하고 있는 페이지에는 링크를 걸지 않는다. -->
		</ul>
	</nav>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name"/>
			<small class="form-text text-muted">이름을 예쁘게 적으세요</small>
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr"/>
			<small class="form-text text-muted">실제 사는 주소를 작성하세요</small>
		</div>
		<button class="btn btn-success">추가</button>
		<button class="btn btn-danger">취소</button>
	</form>
</div>
</body>
</html>