<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/buy.jsp</title>
</head>
<body>
	<%
		//인코딩 설정하기
		request.setCharacterEncoding("utf-8");
		
		/*
		/test/buy.jsp?num=999&type=ABC
		위와 같은 GET 방식 요청 파라미터 추출하기
		num 이라는 파라미터 명으로 999 라는 문자열과
		type 이라는 파라미터 명으로 ABC 라는 문자열이 전송된다.
		*/
		
		//읽어온 파라미터를 숫자로 바꾸고 싶을 때 사용하는 메소드 (자주 사용)
		int num=Integer.parseInt(request.getParameter("num"));
		String type=request.getParameter("type");
		
		System.out.println("num: "+num+"type: "+type);
	%>
	<p>구입하신 상품은 <%=type %> 갯수는 <%=num %> 개 입니다.</p>
</body>
</html>