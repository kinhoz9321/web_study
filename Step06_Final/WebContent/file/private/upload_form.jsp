<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
	<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/file/list.jsp">자료실 목록</a>
			</li>
			<li class="breadcrumb-item">파일 업로드</li>
		</ul>
	</nav>
	</div>
	<div class="container">
		<!-- file => enctype="multipart/form-data" 설정! -->
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">파일 설명</label>
				<input class="form-control" type="text" name="title" id="title"/>
				<small class="text-muted form-text">파일에 대한 설명을 적어주세요.</small>
			</div>
			<div class="form-group">
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile"/>
			</div>
			<div class="text-center">
				<button class="btn btn-success" type="submit">업로드</button>
				<button class="btn btn-danger" type="reset">취소</button>
			</div>
		</form>
	</div>
</body>
</html>