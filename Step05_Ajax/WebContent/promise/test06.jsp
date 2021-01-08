<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test06.jsp</title>
</head>
<body>
<h1>Promise 테스트5</h1>
<script>
	//Promise() 객체를 리턴해주는 함수
	function getPromise(){
		let p1=new Promise(function(resolve, reject){//1 호출
			resolve();
		});
		return p1;
	}
	
	//Promise 객체를 리턴해주는 함수를 호출해서 사용하기
	getPromise()
	.then(function(result){
		console.log("첫번째 then() 호출됨");
		//1. then 안의 함수에서 새로운 Promise 객체를 리턴하면
		return getPromise();
	})
	.then(function(){
		//2. 새로운 Promise 가 resolve 되면 두번째 then() 안에 있는 함수가 호출된다.
		console.log("두번째 then() 호출됨");	
	});
	
</script>
</body>
</html>
<!-- 
순서대로 호출하기 예제?
 -->