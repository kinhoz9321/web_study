<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.GET 방식 파라미터로 전달되는 수정할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	//2. 글번호를 이용해서 수정할 글정보를 DB에서 읽어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	
	//3. 글 수정폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<form action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<div>
				<label>작성자</label>
				<input type="text" value="<%=dto.getWriter()%>" disabled/>
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content"><%=dto.getContent() %></textarea>
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>