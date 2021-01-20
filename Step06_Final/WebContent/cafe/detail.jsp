<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	//2. 글 번호를 이용(num)해서 DB 에서 글 정보를 읽어온다. cafedto에 담는 이유:밑에서 getter 메소드를 사용해야하기 때문
	CafeDto dto=CafeDao.getInstance().getData(num);
	
	//3. 글 조회수를 올린다.
	CafeDao.getInstance().addViewCount(num);
	
	//4. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>
	<div class="container">
		<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/cafe/list.jsp">게시판 목록</a>
			</li>
			<li class="breadcrumb-item">게시글 상세보기</li>
		</ul>
		</nav>
	</div>
	<div class="container" class="form-group">
		<table class="table table-bordered">
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=dto.getContent() %></td>
			</tr>
		</table>
		<% 
			//session scope 에서 로그인된 아이디를 읽어와본다. (null 일 수도 있음 = 로그인 되어있지 않다는 이야기)
			String id=(String)session.getAttribute("id");
		%>
		<%-- nullpointerexception을 방지하고 작성자와 id가 같은지 확인하는 조건문 --%>
		<button type="button" class="btn btn-warning">
			<a href="list.jsp" style="color:white">목록보기</a>
		</button>
		<%if(dto.getWriter().equals(id)){ %>
		<button type="button" class="btn btn-success">
			<a href="${pageContext.request.contextPath}/cafe/private/updateform.jsp?num=<%=dto.getNum() %>" style="color:white">수정</a>
		</button>
		<button type="button" class="btn btn-danger">
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
				location.href="${pageContext.request.contextPath}/cafe/private/delete.jsp?num=<%=dto.getNum()%>";
			}
		}
	</script>
</body>
</html>