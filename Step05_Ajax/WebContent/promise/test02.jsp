<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test02.jsp</title>
</head>
<body>
<h1>Promise 테스트1</h1>
<script>
	//주어진 작업을 처리하는 함수 (주어진 작업을 처리하는데 5초가 걸린다고 가정하자.)
	function work(job, callback){//callback()=함수
		setTimeout(function(){
			console.log(job+" 을(를) 수행 완료 했습니다.");
			callback();
		}, 5000);
	}
	
	//1. Promise 객체를 생성해서 참조값을 p1에 담는다
	let p1=new Promise(function(resolve, reject){//1 호출
		
		//then() 에 있는 함수가 호출되게 하기 위해서 호출
		resolve();//resolve() 와 then() 은 서로 관련이 되어 있다.
		reject();
		console.log("resolve, reject 함수를 호출 했습니다.");
	});
	
	//2. p1 promise 가 resolve 되었을 때 호출되는 함수 등록
	p1.then(function(){//3 호출
		console.log("then 안에 있는 함수가 호출 되었습니다.")
	});
	
	//3. p1 promise 가 reject 되었을 때 호출되는 함수 등록
	p1.catch(function(){//3 호출
		console.log("catch 안에 있는 함수가 호출 되었습니다.")
	});
	
	//2 호출
	console.log("bye!");
</script>
</body>
</html>
<!-- 
new Promise(function(resolve, reject){} 에서 
resolve(); 를 지우고 웹브라우저를 실행 시키면
reject() 가 호출되면서 catch 안에 있는 함수가 호출된다.

resolve() 는 호출되지 못했으니 .then() 은 그냥 뛰어넘는다.

[연관성 기억하기!]
resolve() - then()
reject() - catch()
 -->