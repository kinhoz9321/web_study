<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/sub/fortune.jsp</title>
</head>
<body>
<%!
	String[] list= {
		"2021년에는 재산이 축적되요",
		"2021년에는 마음이 즐거워요",
		"2021년에는 좋은 사람을 만나요",
		"2021년에는 가족이 건강해요",
		"2021년에는 모든 일이 잘 풀려요"
	};
%>
<%
	/*
	여기는 Java coding 영역. 서블릿의 service() 메소드 안쪽이라고 생각하면 됨.
	*/
	Random ran=new Random();
	int index=ran.nextInt(5);
	String fortuneToday=list[index];
%>
	<p>오늘의 운세 : <%=fortuneToday %></p>
</body>
</html>
<!-- 
Ctrl+space 하면 지역목록이 나온다.
jsp를 배운다는 것은 *8개 기본객체의 사용법*을 배운다는 것
8개 기본객체는 jsp.java 에 지역변수로 쓰여있다.

[8개 기본객체]
servletContext
servletConfig
JspWriter
Object
PageContext
HttpServletRequest
HttpServletResponse
HttpSession
 -->
 <%--
 [자바코드로 인식되는 모양 4가지]
 1. <%@ %> 
 - 자동완성 import 설정
 
 2. <%! %> 
 - 전역 변수. 클래스 안에 만들어진다. 
 - 필드 혹은 메소드 선언 가능.
 
 4. <% %> - 자주 사용
 - 자바 코딩, 지역변수
 - 서블릿의 service() 메소드 안쪽이라고 생각하면 된다.
 
 3. <%= %> - 자주 사용
 - 문자열, 변수값, 함수리턴값
 - 자바 참조값이나 메소드의 내용을 클라이언트 웹브라우저에 그대로 출력하고 싶을 때
 - 참조값이나 메소드를 호출할 때 ; 를 붙이면 안된다.
 
 [알아두기!]
 웹브라우저는 자바코드는 인식하지 못하고 html 코드만 인식한다.
 
 톰캣 웹서버는 .jsp 요청이 들어오면 문자열을 그대로 출력하지 않고, 
 문자열을 해석한 결과를 출력한다. (자바는 빼고)
 그냥 html 로 작성한 것은 그대로 출력하고 % 기호를 쓴 것은 해석의 결과를 출력함!
 
 fortune.jsp (우리가 많듦) -> fortune_jsp.java (톰캣이 만듦) -> fortune_jsp.class (자바 소스코드로 바꾸고 컴파일해서 class를 만듦)
 
 [jsp.java 찾는 루트] C:\acorn2021\web_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Step01_Servlet\org\apache\jsp\sub
 
 [알아두기!]
 emmet (jsp 파일에서 자바 자동완성 시키기)
 window - preferences - emmet - jsp 추가
 --%>