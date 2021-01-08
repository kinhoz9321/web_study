<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">회원가입 폼 작성</li>
		</ul>
	</nav>
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="nick">닉네임</label>
			<input class="form-control" type="text" name="nick" />
			<small class="form-text text-muted">짧은 닉네임을 적어주세요</small>
		</div>
		<div class="form-group">
			<label for="email">이메일 수신 여부</label>
			<input type="radio" name="email" value="yes" checked="checked"/> 네
			<input type="radio" name="email" value="no"/>아니요
		</div>
		<div class="form-group">
			<label for="concern">관심사</label>
			<!-- selected="selected" 사용가능 -->
			<select class="form-select" name="concern" >
				<option value="">선택</option><!-- 선택을 안하면 빈문자열이 출력됨. -->
				<option value="game">게임</option>
				<option value="movie">영화</option>
				<option value="etc">기타</option>
			</select>
		</div>
		<div class="form-group">
			<label for="language">배우고 싶은 언어 체크</label><br />
			<input type="checkbox" id="Java" name="language" value="Java"/>자바
			<input type="checkbox" id="Python" name="language" value="Python"/>파이선
			<input type="checkbox" id="C++" name="language" value="C++"/>C++
		</div>
		<!-- 
		checkbox는 name 을 똑같이 작성해도 그룹으로 묶이지 않는다.
		동일한 파라미터 명으로 여러개의 value 가 2개 혹은 3개가 전달되어야 한다.
		
		만일 GET 방식으로 전달한다면
		?language=Java&language=Python&language=C++
		이런 모양이 된다.
		
		*여러개의 파라미터 값을 전달할 때는 &를 사용한다는 것 기억하기!*
		 -->
		<div class="form-group">
			<label for="comment">남기고 싶은 말</label>
			<textarea class="form-control" name="comment" cols="30" rows="10"></textarea>
			<small class="form-text text-muted">짧은 코멘트를 적어주세요</small>
		</div>
		<button class="btn btn-success" type="submit">가입</button>
		<button class="btn btn-danger" type="reset">취소</button>
	</form>
</div>
</body>
</html>
<!-- 
String[] language=request.getParameterValues("language");
이 때 아무것도 선택하지 않았다면 null 이 리턴된다.
null이 리턴되면, 
NullpointException이 발생 -> 500번 버스 탑승 (서버에서 작업하다 exception 이 발생하면 타는 버스)
404번 버스 (페이지가 존재하지 않을 때 타는 버스)
 -->