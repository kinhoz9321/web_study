<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test03.jsp</title>
</head>
<body>
<h1>Promise 테스트2</h1>
<script>
	/*
	p1에 담지 않고 이런 모양으로 쓸수도 있다.
	아래와 같은 형식으로 작성할 수도 있다.
	*/
	new Promise(function(resolve, reject){//1 호출
		
		//then() 에 있는 함수가 호출되게 하기 위해서 호출
		resolve();//resolve() 와 then() 은 서로 관련이 되어 있다.
		console.log("resolve 함수를 호출 했습니다.");
	})
	.then(function(){//3 호출
		console.log("then 안에 있는 함수가 호출 되었습니다.")
	})
	.catch(function(){//3 호출
		console.log("catch 안에 있는 함수가 호출 되었습니다.")
	});
	
	//2 호출
	console.log("bye!");
</script>
</body>
</html>
<!-- 
test02 처럼 p1에 .찍어서 then, catch를 따로하나 이렇게 연속으로 하나 똑같다.
 -->