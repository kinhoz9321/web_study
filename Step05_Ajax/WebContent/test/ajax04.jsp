<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/ajax04.jsp</title>
</head>
<body>
	<h1 class="aaa">폼 테스트</h1>
	<p class="bbb">form 에 submit 이벤트가 일어났을 때 폼전송을 막고 ajax 전송해보기</p>
	<form action="add.jsp" method="get" id="myForm">
		<input type="text" name="name" placeholder="이름 입력"/>
		<input type="text" name="addr" placeholder="주소 입력"/>
		<button type="submit">전송</button>
		<button type="reset">취소</button>
	</form>
	<script>
		//id가 myForm 인 곳에 submit 이벤트가 일어났을 때 실행되는 함수 등록
		document.querySelector("#myForm")
		.addEventListener("submit", function(event){
			//함수의 인자로 전달되는 event 객체의 .preventDefault() 함수를 호출해서 *폼 전송 막기*
			event.preventDefault();//기본동작 막기(event)
			console.log("submit 이벤트가 일어났지만 폼 전송을 막았습니다.");
			//"input[name=name]은 input 요소이면서 name 속성의 값이 name 인 요소 찾기"
			let name=document.querySelector("input[name=name]").value;
			//"input[name=addr]은 input 요소이면서 name 속성의 값이 addr 인 요소 찾기"
			let addr=document.querySelector("input[name=addr]").value;
			//form 의 action 속성의 value 읽어오기
			let url=document.querySelector("#myForm").getAttribute("action");
			
			//fetch() 함수를 이용해서 ajax 전송하기 (직접 제출한다.)
			fetch(url+"?name="+name+"&addr="+addr).then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
		});
	</script>
</body>
</html>
<!-- 
[기억하기!]
event.preventDefault();
- 기본동작 (이벤트)을 막아버리겠다.
- 폼 전송이 안되고, 페이지 이동이 안됨.

폼에 입력한 이름과 주소 읽어오기
let name=document.querySelector("input[name=name]").value;
let addr=document.querySelector("input[name=addr]").value;
- 속성명을 적을 때는 대괄호 안에 적는다.

[알아두기!]
1. 폼의 전송이 일어났을 때 페이지의 기본 전환을 막아버리는 것
2. 폼에 입력한 내용을 페이지 전환 없이 서버에 제출하는 것
 -->