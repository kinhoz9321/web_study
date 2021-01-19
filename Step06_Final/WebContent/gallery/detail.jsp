<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	GalleryDto dto=GalleryDao.getInstance().getData(num);
	
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
	<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/gallery/list.jsp">갤러리 목록</a>
			</li>
			<li class="breadcrumb-item">갤러리 상세보기</li>
		</ul>
	</nav>
	</div>
	<div class="container form-group">
		<table class="table table-bordered">
			<tr>
				<th>날짜</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div><%=dto.getCaption() %></div>
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
					<img src="${pageContext.request.contextPath}<%=dto.getImagePath() %>" />
				</td>
			</tr>
		</table>
		<button class="btn btn-warning">
			<a href="list.jsp" style="color:white">목록보기</a>
		</button>
		<%if(dto.getWriter().equals(id)){ %>
		<button class="btn btn-danger">
			<a href="javascript:deleteConfirm()" style="color:white">삭제</a>
		</button>
		<%} %>
		<div class="text-center">
			<button class="btn btn-light">
				<a style="color:black" href="detail.jsp?num=<%=dto.getPrevNum()%>">◁ prev</a>
			</button>
			<button class="btn btn-light">
				<a style="color:orange" href="detail.jsp?num=<%=dto.getNextNum()%>">next ▷</a>
			</button>
		</div>
	</div>
	<script>
		function deleteConfirm(){
			let isDelete=confirm("글을 삭제 하시겠습니까?");
			if(isDelete){
				location.href="private/delete.jsp?num=<%=dto.getNum()%>";
			}
		}
	</script>
</body>
</html>