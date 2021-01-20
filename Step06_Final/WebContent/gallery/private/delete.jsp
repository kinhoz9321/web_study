<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=GalleryDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("삭제 했습니다.");
			location.href="${pageContext.request.contextPath}/gallery/list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("삭제 실패!");
			location.href="detail.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>