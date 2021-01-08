<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
<h1>비동기 테스트</h1>
<script>
	//주어진 작업을 처리하는 함수 (주어진 작업을 처리하는데 5초가 걸린다고 가정하자.)
	function work(job, callback){//callback()=함수
		setTimeout(function(){
			console.log(job+" 을(를) 수행 완료 했습니다.");
			callback();
		}, 5000);
	}
	
	//비동기지만 동기처럼 처리해보기
	//1. 콜백 지옥 (코드가 보기 불편함)
	/*
	work("달리기", function(){
		work("쉬기", function(){
			work("물마시기", function(){
				
			});
		});
	});
	*/
	
	//2. promise (코드가 훨씬 깔끔해진다)
	/*
	xxx
	.then(function("달리기"){});
	.then(function("쉬기"){});
	.then(function("물마시기"){});
	*/
	
	//1. Promise 객체를 생성해서 참조값을 p1에 담는다
	let p1=new Promise(function(resolve){//1 호출
		
		//then() 에 있는 함수가 호출되게 하기 위해서 호출
		resolve();//resolve() 와 then() 은 서로 관련이 되어 있다.
		console.log("resolve 함수를 호출 했습니다.");
	});
	
	//2. p1 promise 가 resolve 되었을 때 호출되는 함수 등록
	p1.then(function(){//3 호출
		console.log("then 안에 있는 함수가 호출 되었습니다.")
	});
	
	//2 호출
	console.log("bye!");
</script>
</body>
</html>
<!-- 
[중요! promise란?]

new Promise(function(resolve, reject){}

- 함수 인자로 전달되는 resolve와 reject는 함수이다.
resolve 는 작업을 완료 했을 때 호출하는 함수이다.
reject 는  작업이 실패 했을 때 호출하는 함수이다.
resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.

[생각해보기!]
웹브라우저가 로딩되고 콘솔창에 

resolve 함수를 호출 했습니다.
bye!
then 안에 있는 함수가 호출 되었습니다.

순서로 호출되는 이유가 무엇일까?
- 

 -->