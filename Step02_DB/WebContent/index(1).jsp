<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index(1).jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<!-- container 밖으로 navbar 빼기 -->
<nav class="navbar navbar-dark bg-primary navbar-expand-sm">
<!-- navbar-expand-sm 목록을 예쁘게 나열해줌 -->
	<!-- 
	navbar 안에 새로운 div 생성
	navbar 는 화면 전체를 차지하고 안에 내용은 container 만큼 차지해서 정렬됨.
	 -->
	<div class="container">
		<nav class="navbar navbar-dark bg-primary">
			<a href="${pageContext.request.contextPath}/" class="navbar-brand">Acorn</a>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/member/list.jsp" class="nav-link">회원 목록</a>
				</li>
				<li class="nav-item">
					<a href="${pageContext.request.contextPath}/todo/list.jsp" class="nav-link">할일 목록</a>
				</li>
			</ul>
		</nav>
	</div>
</nav>
</body>
</html>
<!-- 
nav 요소는 div 요소에 의미를 더한 요소이다. 
- 의미가 있는 div 라고 생각하기
- navigation 요소를 포함하고 있다고 알려준다.

배경색이 어두운 색 계열이면 class="navbar-dark" (밝은색 글씨)
배경색이 밝은색 계열이면 class="navbar-light" (어두운색 글씨)
클래스를 추가해야 한다. (글자색을 결정해줌.)

href="${pageContext.request.contextPath}/member/list.jsp"
가급적이면 절대 경로를 쓰기. (context 경로 걸기 cpath+tab)

[emmet 추가하는 법]
window - Preferences - Emmet - snippets
 -->