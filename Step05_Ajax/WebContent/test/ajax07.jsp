<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/ajax07.jsp</title>
</head>
<body>
	<h1>ajax POST 전송 예제</h1>
	<input type="text" id="inputName" placeholder="이름 입력"/>
	<input type="text" id="inputAddr" placeholder="주소 입력"/>
	<button id="sendBtn">전송</button>
	<script src="${pageContext.request.contextPath}/js/myUtil.js"></script>
	<script>
		//시점은 알 수 없지만, 버튼을 누르면 호출됨을 알 수 있음. (비동기 처리)
		document.querySelector("#sendBtn")
		.addEventListener("click", function(){
			//입력한 문자열 읽어오기
			let name=document.querySelector("#inputName").value;
			let addr=document.querySelector("#inputAddr").value;
			
			//입력한 문자열을 object에 담는다.
			let obj={name:name, addr:addr};
			//유틸리티 함수를 이용해서 ajax 요청을 하고 Promise 를 리턴 받는다.
			
			/*
			ajaxPromise("add.jsp", "POST", obj)
			.then()
			.then();
			*/
			
			//요청 url, 메소드 get or post, 요청과 함께 전송하고 싶은 파라미터를 형식에 맞춰 담아 전달
			ajaxPromise("add.jsp", "POST", obj)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			console.log("bye");
		});
	</script>
</body>
</html>
<!-- 
ajaxPromise(전달) 알아서 수행.
- 언제 호출될지는 모르겠지만, 응답이 오면 호출해주세요. (진동벨 역할)
 -->