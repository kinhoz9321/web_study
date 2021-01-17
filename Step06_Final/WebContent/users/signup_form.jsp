<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<form action="signup.jsp" method="post" id="myForm">
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id"/>
				<small>아이디는 4글자 이상 입력해야 합니다.</small>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd"/>
				<small>비밀번호는 4글자 이상 입력해야 합니다.</small>
				<div class="valid-feedback">사용 가능한 비밀번호 입니다.</div>
			</div>
			<div>
				<label for="pwd2">비밀번호 확인</label>
				<input type="password" name="pwd2" id="pwd2"/>
				<div class="invalid-feedback">비밀번호를 확인하십시오.</div>
				<div class="valid-feedback">비밀번호를 확인하였습니다.</div>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email"/>
			</div>
			<button type="submit">가입</button>
			<button type="reset">취소</button>
		</form>
	</div>
	<script>
		//아이디의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
		let isIdValid=false;
		
		//폼에 submit 이벤트가 일어났을 때 jquery 를 활용해서 폼에 입력한 내용 검증하기
		$("#myForm").on("submit", function(){
			//만일 아이디를 제대로 입력하지 않았으면 폼 전송을 막는다.
			if(isIdValid == false){//(!=isValid) 아이디가 유효하지 않다면
				return false;//아이디가 맞든 안 맞든, 여기까지 코딩하면 무조건 제출이 막아진다.
				//문자열의 길이가 4보다 크고, 사용가능한 아이디일 경우 true로 바뀌어야 한다.
			}
		});
		//document.querySelector("#myForm").addEventListener("submit", function(){}); => jquery 형식으로 쓴 것.
		
		//아이디 입력란에 입력했을 때 실행할 함수 등록
		$("#id").on("input", function(){
			//1. 입력한 아이디를 읽어와서 
			let inputId=$("#id").val();
			
			//2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
			//일단, 모든 검증 클래스를 제거하고
			$("#id").removeClass("is-valid is-invalid");
			
			//입력한 문자열의 길이를 얻어낸다.
			let length=inputId.length;
			//만일 문자열의 길이가 4보다 작으면
			if(length<4){
				//아이디가 유효하지 않다고 표시하고
				$("#id").addClass("is-invalid");//addClass=클래스를 추가
				//함수를 여기서 종료한다.
				return; //서버에 보내지도 않는다.
			}
			
			$.ajax({
				url:"checkid.jsp",
				method:"GET",
				data:"inputId="+inputId,
				success:function(responseData){//(=fetch) 응답된 데이터
				//요청이 성공적으로 처리되었을 때 자동적으로 함수가 호출되고 함수 안에서 처리를 한다. (인자로 전달받음)
					console.log(responseData);
					if(responseData.isExist){//이미 존재하는 아이디인 경우
						$("#id").addClass("is-invalid");
						//아이디가 유효하지 않다고 표시한다.
						isIdValid=false;
					}else{//존재하지 않는 아이디 즉 사용 가능한 아이디인 경우
						$("#id").addClass("is-valid");
						//아이디가 유효하다고 표시한다.
						isIdValid=true;
						//isIdValid 가 false 로 쭉 내려오다가 모든 조건이 맞으면 마지막에 isIdValid=true 가 되면서 폼 전송이 된다.
					}
				}
			});//jquery 이용
			
			/*
			 function(responseData){} => fetch.ver
			 
			 fetch("checkid.jsp?inputId="+inputId)
			 .then(function(response){
				 return response.json();
			 })
			 .then(function(data){
				 
			 });
			*/
		});
		
		//비밀번호의 유효성 여부와 그의 확인을 관리할 변수 만들고 초기값 부여하기
		let isPwdValid=false;
		let isPwd2Valid=false;
		
		//id가 pwd와 pwd2 인 요소에 input(입력) 이벤트가 일어났을 때 실행할 함수 등록 (콘솔창에 input 출력)
		//여기까지만 하면 비밀번호와 비밀번호 확인이 달라도 가입이 가능. 비밀번호에 친 비밀번호로 가입됨.
		$("#pwd, #pwd2").on("input", function(){
			//비밀번호, 비밀번호 확인 창에 글자를 입력하면 콘솔창에 input 출력됨.
			//console.log("input");
			
			//입력한 두 비밀번호를 읽어온다.
			let pwd=$("#pwd").val();
			let pwd2=$("#pwd2").val();
			
			//만약 비밀번호를 4글자 이상 입력하지 않았다면
			if(pwd.length<4){//pwd와 pwd2가 동일한지 확인할거니까 pwd의 길이만 확인.
				//비밀번호가 유효하지 않는다고 표시하고
				$("#pwd").addClass("is-invalid");
				isPwdValid=false;
				//함수를 여기서 종료
				return;
			}
			
			//일단 모든 검증 클래스를 제거하고
			$("#pwd").removeClass("is-valid is-invalid");
			$("#pwd2").removeClass("is-valid is-invalid");
			
			//두 비밀번호가 같은지 확인해서
			if(pwd == pwd2){//만일 같으면
				//유효하다는 클래스를 추가
				$("#pwd").addClass("is-valid");
				$("#pwd2").addClass("is-valid");
				isPwdValid=true;
				isPwd2Valid=true;
			}else{//만일 다르면
				//유효하지 않다는 클래스를 추가
				$("#pwd").addClass("is-invalid");
				$("#pwd2").addClass("is-invalid");
				isPwdValid=false;
				isPwd2valid=false;
			}
		});
	</script>
</body>
</html>
<%--
[Memo]

[회원가입 폼의 핵심 로직]
submit 이벤트가 일어났을 때 아이디, 비밀번호, 이메일을 검증할 필요가 있다.
검증해서 제대로 되지 않았다면 폼 전송을 막아버려야 한다.

$.ajax({
	success:function(responseData){}
	
	페이지 전환 없이 checkid.jsp 로 요청하고
	/users/checkid.jsp 에서 responseData 로 응답도 받는다.
	
	checkid.jsp 페에지에서 응답할 때 
	contentType="application/json" 이라고 설정하면
	함수의 인자로 전달되는 responseData 는 object 이다.
	{"isExist":true} or {"isExist":false}
	형식의 object 이기 때문에 파싱할 필요없이 바로 사용이 가능하다.
	
	contentType:"text/html" 은 파싱이 필요하다.
	
페이지 전환 없이 부분 요청을 보내려고 하면 방법은 ajax 밖에 없다.
fetch를 사용하던, jquery를 사용하던 요청만 제대로 하면 된다.
	
[알아두기!]
자바스크립트에서 사용하기 좋은 문자열은 json이다.
json이 자바스크립트의 문자열 형식을 따르기 때문이다.
--%>