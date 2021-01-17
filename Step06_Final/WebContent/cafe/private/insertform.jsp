<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<form action="insert.jsp" method="post">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content" ></textarea>
			</div>
			<button type="submit">저장</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>