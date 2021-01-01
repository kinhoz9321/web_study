package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *	/hello 요청에 대해 응답을 할 서블릿 정의하기
 *	1. HttpServlet 클래스를 상속 받는다. (원칙)
 *	2. service() 메소드를 오버라이드 한다. service ctrl+space
 *	3. 어떤 요청을 처리할지 어노테이션(@WebService)을 클래스 위에 작성한다.
 */

//3. 어노테이션 작성 
//("/hello") 라는 요청이 들어오면 오버라이드 메소드 안에서 응답하겠다 라는 요청 경로
@WebServlet("/hello")
public class HelloServlet extends HttpServlet{//1. HttpServlet 상속 받기
	
	//2. service() 메소드 오버라이드 하기
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//req, resp 라는 인자 2개가 있는데, 어떤 동작을 할지만 우리가 결정한다.
		
		//클라이언트에게 문자열을 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		
		//클라이언트에게 문자열 출력하기
		pw.print("kim hong ju");
		
		pw.flush();//방출
		pw.close();//닫기
	}
}
/*
	클라이언트는 요청만 하는 것이 아니라 어떤 것을 전송하기도 한다.
	ex) data, form 등...
	그러면 서버는 전송한 것을 읽어내어 insert, update, delete 해야하기도 한다.
	
	[배워야 하는 것]
	1. 전송과 응답
	2. 부분 프로그래밍 (전체를 프로그래밍 하는 일은 거의 없을 것이다.)
	
	req, resp 인자 = 도구
	HttpServletRequest req, HttpServletResponse resp
	도구의 사용법을 배워야 한다.
	호출 뿐만 아니라 객체의 참조값도 전달.
	
	ex) 채팅 시스템을 만든다고 생각하면,
	actionPerformed 만 작성하는 느낌이라고 생각하면 된다.
	일부분의 미완성을 채워넣어 완성한다 라고 이해하기.
	
	이제 main 메소드는 쓰지 않는다. 
	(main 메소드가 존재한다는 것은 처음부터 다 만든다는 것)
	서버를 실행하면 이미 만들어진 어떤 main 메소드가 실행이 되고, 그것에 관해서는 알 필요가 없다고 생각하면 된다.
	
	Servlet = 클라이언트의 요청을 처리할 수 있는 객체
	우리가 만든 서블릿이 톰캣 서버에서 특별한 일을 해야하고, 
	웹브라우저의 부품이 되게 해야한다.
	그러기 위해선 마음대로 만들어선 안되고, 형식에 맞게 만들어야 한다.
	
	규격을 맞추는 방법
	1. class를 extends(상속)
	2. implements를 구현
	
	중요한 부품의 설계도를 납품한다고 생각하면 된다.
	
	http://localhost:8888/Step01_Servlet/hello
	
	/hello 를 요청했을 때 응답을 했다는 것은 누군가(톰캣)가
	HttpServlet s=new HelloServlet();
	s.service(); 했다는 것
*/