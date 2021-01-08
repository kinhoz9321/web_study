<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test04.jsp</title>
</head>
<body>
<h1>Promise 테스트3</h1>
<script>
	/*
	p1에 담지 않고 이런 모양으로 쓸수도 있다.
	아래와 같은 형식으로 작성할 수도 있다.
	*/
	new Promise(function(resolve, reject){//1 호출
		//비동기 작업의 결과 데이터가 있다면
		let data={num:1, name:"김구라"};
	
		//resolve() 함수를 호출하면서 전달할 수 있다.
		resolve(data);//resolve() 호출하면서 data 전달
		console.log("resolve 함수를 호출 했습니다.");
	})
	.then(function(result){//3 호출
		//resolve() 함수에 전달된 값(data)이 then() 안에 있는 함수의 인자(result)로 전달된다.
		console.log(result)
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
resolve, reject, data, result 등 이름은 내 마음대로 짓는 것이다.
이름에 너무 연연해 하지 말고, 서로의 관계를 잘 알아둘 것.
 -->