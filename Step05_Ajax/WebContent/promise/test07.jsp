<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test07.jsp</title>
</head>
<body>
	<h1>Promise 테스트6</h1>
	<script>
		//Promise() 객체를 리턴해주는 함수
		function getPromise(job){
			let p1=new Promise(function(resolve, reject){
				console.log(job+" 수행함");
				resolve();
			});
			return p1;
		}
		
		getPromise("달리기")//1
		.then(function(){
			return getPromise("쉬기");//3
		})
		.then(function(){
			return getPromise("물 마시기");//4
		})
		.then(function(){
			console.log("finish!");//5
		});
		
		console.log("bye!");//2
	</script>
</body>
</html>
<!-- 
[Memo]
콘솔창에 순서대로 달리기, 쉬기, 물마시기 출력
마지막 finish! 부분은 끝내기 위해 return getPromise() 하지 않았다.

//번호 = 콘솔창에 출력되는 순서
 -->