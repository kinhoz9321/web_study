<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileDto dto=new FileDto();
	List<FileDto> list=FileDao.getInstance().getList(dto);
	
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
	<div class="container">
		<button>
			<a href="${pageContext.request.contextPath}/index.jsp">Home</a>
		</button>
		<button>
			<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">파일 업로드</a>
		</button>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목 (파일에 대한 설명)</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
					<%if(tmp.getWriter().equals(id)){ %>
						<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
					<%} %>
					</td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
			if(isDelete){
				location.href="${pageContext.request.contextPath}/file/private/delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>