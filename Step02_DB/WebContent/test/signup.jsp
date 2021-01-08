<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 회원가입 폼에 입력한 내용을 하나하나 모두 추출해서 콘솔창에 출력해보세요. */
	
	//한글이 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//폼 전송되는 파라미터 추출
	//1. <input type="text" name="nick" />에 입력한 문자열 추출
	String nick=request.getParameter("nick");
	
	//2. <input type="radio" name="email" value="yes or no" />에 선택된 값 추출
	String email=request.getParameter("email");
	
	//3. <select name="concern" >에 선택된 option 값 추출
	String concern=request.getParameter("concern");
	
	//4. <input type="checkbox" name="language" value="Java or Python or C++"/>에 입력한 문자열 추출
	String[] language=request.getParameterValues("language");
	/*
	하나의 파라미터로 여러 개의 값이 들어오면 getParameterValues() 메소드를 사용한다. 
	String 배열을 리턴해주는 메소드.
	*/
	
	//5. <textarea name="comment"/>에 입력한 문자열 추출
	String comment=request.getParameter("comment");
	
	//콘솔에 결과 출력하기
	System.out.println("nick: "+nick);
	System.out.println("email: "+email);
	System.out.println("concern: "+concern);
	
	System.out.println("----language----");
	
	//체크박스의 values를 저장할 arrayList 객체 생성
	List<String> languageList=new ArrayList<>();
	
	//만일 체크박스를 하나라도 체크 했다면
	if(language!=null){
		for(int i=0; i<language.length; i++){//for(String tmp:language)
			System.out.println(language[i]);//System.out.println(tmp);
			languageList.add(language[i]);//list에 쌓임.
		}
	}
	
	System.out.println("comment: "+comment);
	
	/* DB 에 저장하기 */
	
	//체크박스에 체크된 내용을 DB에 저장하기 위해서 가공하기
	//pstmt.setString(4, lan); setString 메소드를 위해서 빈 String 객체를 만들어준다.
	String lan=null;
	
	if(language!=null){
		//일단 빈 문자열을 넣어주고
		lan="";
		for(int i=0; i<language.length; i++){
			//만약 i가 배열의 마지막 인덱스가 아니라면
			if(i!=language.length-1){
				//lan 에 문자열을 이어 붙이고 뒤에 ,를 붙인다.
				lan += language[i]+",";
			}else{
				//마지막 인덱스이면 lan에 문자열을 이어 붙이고 뒤에, 는 붙이지 않는다.
				lan += language[i];
			}
		}
	}
	
	/*
	[알아두기!]
	i!=language.length-1 (배열의 인덱스를 구할 때 통상적으로 쓰이는 구문 -1) 어색한 문법이 아니다.
	
	language가 배열의 끝 index가 아니라면, 다 ','를 붙여라.
	*/
	
	//1. 전송된 정보를 dto 에 넣은 다음 (생략)
	
	//2. Dao 를 이용해서 DB에 저장 (따로 Dao를 만들지 않고 바로 저장시키기)
	Connection conn=null;
	PreparedStatement pstmt=null;
	int flag=0;
	
	try{
		conn=new DbcpBean().getConn();
		
		String sql= "INSERT INTO form_test"
				+ " (nick,email,concern,lan,comm)"
				+ " VALUES(?,?,?,?,?)";
		
		//?에 바인딩 할 게 있으면 여기서 바인딩 한다.
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, nick);
		pstmt.setString(2, email);
		pstmt.setString(3, concern);
		pstmt.setString(4, lan);
		pstmt.setString(5, comment);
		
		flag=pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
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
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/test/signup_form.jsp">회원가입 폼 작성</a>
			</li>
			<li class="breadcrumb-item">폼에 입력한 내용</li>
		</ul>
	</nav>
	<button class="btn btn-warning"><a href="info.jsp?nick<%=nick%>">DB에 저장된 내용 불러오기(null)</a></button>
	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="nick">닉네임</label>
			<input class="form-control" type="text" name="nick" value="<%=nick%>"/>
		</div>
		<div class="form-group">
			<label for="email">이메일 수신 여부</label>
			<%if(email.equals("yes")){ %>
				<input type="radio" name="email" value="yes" checked="checked" /> 네
				<input type="radio" name="email" value="no"/> 아니요
			<%}else if(email.equals("no")){ %>
				<input type="radio" name="email" value="yes" /> 네
				<input type="radio" name="email" value="no" checked="checked"/> 아니요
			<%} %>
		</div>
		<div class="form-group">
			<label for="concern">관심사</label>
			<select class="form-select" name="concern">
			<%if(concern.equals("")){ %>
				<option value="" selected="selected">선택</option>
			<%}else if(concern.equals("game")){ %>
				<option value="game" selected="selected">게임</option>
			<%}else if(concern.equals("movie")){ %>
				<option value="movie" selected="selected">영화</option>
			<%}else if(concern.equals("etc")){ %>
				<option value="etc" selected="selected">기타</option>
			<%} %>
			</select>
		</div>
		<div class="form-group">
			<label for="language">배우고 싶은 언어 체크</label><br />
			<input type="checkbox" name="language" value="Java" <%=languageList.contains("Java") ? "checked" : "" %>/> 자바
			<input type="checkbox" name="language" value="Python" <%=languageList.contains("Python") ? "checked" : "" %>/> 파이선
			<input type="checkbox" name="language" value="C++" <%=languageList.contains("C++") ? "checked" : "" %>/> C++
		</div>
		<!-- 
		List<String> languageList=new ArrayList<>();
		
		boolean a=list.contains("Java");
		list의 contains() - 어떤 아이템이 있는지 없는지 boolean 값을 리턴해준다.
		
		삼항연산자 사용 가능
		languageList.contains("Java") ? "checked" : ""
		 -->
		<div class="form-group">
			<label for="comment">남기고 싶은 말</label><br />
			<textarea class="form-control" name="comment" cols="30" rows="10"><%=comment %></textarea>
		</div>
	</form>
	<button class="btn btn-success"><a href="${pageContext.request.contextPath}/index.jsp">설문 조사 완료</a></button>
</div>
</body>
</html>