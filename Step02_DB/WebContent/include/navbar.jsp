<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//"thisPage" 라는 파라미터 명으로 전달된 문자열 읽어오기
String thisPage=request.getParameter("thisPage");
//NullPointException 방지 (500번 버스 방지)
if(thisPage==null){
	thisPage="";
}
%>
<!-- container 밖으로 navbar 빼기 -->
<nav class="navbar navbar-dark bg-warning navbar-expand-sm">
	<!-- 
	navbar 안에 새로운 div 생성
	navbar 는 화면 전체를 차지하고 안의 내용은 container 만큼 차지해서 정렬됨.
	 -->
	<div class="container">
		<a href="${pageContext.request.contextPath}/" class="navbar-brand">Acorn</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
		<!-- 
		class="navbar-toggler" 화면을 줄이면 왼쪽 상단에 3줄 버튼이 등장 (숨겨진 목록 출력용)
		data-target="#topNav" 숨겨진 목록 만들기에 이용할 아이디 작성
		 -->
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 버튼 안에 숨길 목록 작성하기 -->
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<!-- 가급적이면  context 경로 (절대 경로)를 쓰기 -->
					<a href="${pageContext.request.contextPath}/member/list.jsp" class="nav-link">회원 목록</a>
				</li>
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/todo/list.jsp" class="nav-link">할일 목록</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- 
특정 jsp 에 포함시킬 내용을 jsp 페이지에 작성할 수 있다.
bootstrap css는 이곳에 포함시키지 않는다. 
css가 동작 하기 위해선 navbar.jsp 가 포함되는 페이지에 직접 로딩 되어야 한다.

<%-- jsp 페이지 안에서의 주석 --%> 
여기에 작성한 내용은 jsp 가 해석하지 않는다. 클라이언트 웹브라우저에 출력되지도 않는다.

html 페이지 안에서의 주석
여기 작성한 내용은 그대로 클라이언트에게 출력된다. 하지만 클라이언트 웹브라우저는 여기 작성한 내용을 해석하지 않는다.
 -->