<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
</head>
<body>
	<div class="container">
		<!-- file => enctype="multipart/form-data" 설정! -->
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title"	id="title"/>
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile"/>
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
</body>
</html>