<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CafeDto dto=new CafeDto();
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe/list.jsp</title>
</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%for(CafeDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getViewCount() %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>