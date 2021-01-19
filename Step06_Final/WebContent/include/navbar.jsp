<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//"thisPage" 라는 파라미터 명으로 전달된 문자열 얻어오기
	String thisPage=request.getParameter("thisPage");
	//NullPointException 방지 (500번 버스 안타기)
	if(thisPage == null){
		thisPage = "";
	}
	
	String id=(String)session.getAttribute("id");
%>
<nav class="navbar navbar-light navbar-expand-sm fixed-top" style="background-color: #FBF1D7;">
  <div class="container">
  	<a href="${pageContext.request.contextPath}/" class="navbar-brand">
  		<img style="width:35px","heighte="35px" src="${pageContext.request.contextPath}/images/doodle_girl.png" />
  	</a>
  	<a href="${pageContext.request.contextPath}/" class="navbar-brand">Oh!myPage!</a>
  	<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collpse navbar-collapse" id="topNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item <%=thisPage.equals("cafe")?"active":"" %>">
				<a href="${pageContext.request.contextPath}/cafe/list.jsp" class="nav-link">게시판</a>
			</li>
			<li class="nav-item <%=thisPage.equals("file")?"active":"" %>">
				<a href="${pageContext.request.contextPath}/file/list.jsp" class="nav-link">자료실</a>
			</li>
			<li class="nav-item <%=thisPage.equals("gallery")?"active":"" %>">
				<a href="${pageContext.request.contextPath}/gallery/list.jsp" class="nav-link">갤러리</a>
			</li>
		</ul>
		<%if(id == null){ %>
			<button class="btn btn-outline-warning me-2" type="button"><a href="${pageContext.request.contextPath}/users/loginform.jsp" style="color:#FBBA27">Login</a></button>
		<%}else{ %>
			<span class="navbar-text">
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %> </a> 님 로그인 중 
			</span>
			<a class="btn btn-outline-warning btn-sm ml-1" href="${pageContext.request.contextPath}/users/logout.jsp" style="color:#FBBA27">LogOut</a>
		<%} %>
	</div>
  </div>
</nav>