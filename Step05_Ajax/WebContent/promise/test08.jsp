<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test08.jsp</title>
</head>
<body>
	<h1>Promise 테스트7</h1>
	<script>
		//Promise() 객체를 리턴해주는 함수
		function getPromise(job){
			let p1=new Promise(function(resolve, reject){
				//작업하는데 2초가 걸린다고 가정해보자.
				setTimeout(function(){
					console.log(job+" 수행함");
					resolve();
				},2000);//임의로 시간 제한 두기
			});
			return p1;
		}
		
		getPromise("달리기")//2 (5초뒤 첫번째 console.log()+resolve() = "달리기 수행함")
		.then(function(){
			return getPromise("쉬기");//3 (5초뒤 두번째 console.log()+resolve() = "쉬기 수행함")
		})
		.then(function(){
			return getPromise("물 마시기");//4 (5초뒤 세번째 console.log()+resolve() = "물 마시기 수행함")
		})
		.then(function(){
			//원래 코드
			//console.log("finish!");//4
			
			//return getPromise와 시간을 맞추기 위해 내가 새로 짠 코드 (2초 뒤에 finish 출력)
			setTimeout(function(){
				console.log("finish!");//5	
			}, 2000);
		});
		
		console.log("bye!");//1
	</script>
</body>
</html>
<!-- 
[Memo]
//번호 = 콘솔창에 출력되는 순서

[기억하기!]
setTimeout(function(){},n);
 -->