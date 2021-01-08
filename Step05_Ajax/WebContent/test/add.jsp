<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식으로 전송된 파라미터 추출하기
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	System.out.println("name:"+name+" addr:"+addr);
%>
added!

<%--
GET 방식 전송 = ("add.jsp?name="+name+"&addr="+addr)
--%>