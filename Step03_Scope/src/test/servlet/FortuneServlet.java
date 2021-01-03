package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 오늘의 운세를 얻어오는 비즈니스 로직을 수행했다고 가정하자
		String fortuneToday="2021년엔 행복한 일들만 가득해요!";
		
		//2. 로직의 수행결과 데이터 (모델) 을 HttpServletRequest 객체에 담는다.
		req.setAttribute("fortuneToday", fortuneToday);
		
		//3. jsp 페이지로 forward 이동해서 응답한다.
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		
		rd.forward(req, resp);
	}
}
/*
2. 로직의 수행결과 데이터 (모델) 을 HttpServletRequest 객체에 담는다.
- request scope(요청 영역)에 담는다고도 한다.

[setAttribute(String name, Object o)]
= req.setAttribute("fortuneToday", fortuneToday);
"fortuneToday"라는 키값으로 String type fortuneToday에 담기
(Object 이기 때문에 어떤 타입이든 담을 수 있다.)

[기억하기!]
setAttribute : request 객체에 어떤 객체를 담는 것
getAttribute : request 객체에 담은 걸 읽어오는 것

3. jsp 페이지로 forward 이동해서 응답한다.
- forward 이동은 서블릿이 jsp에게 응답을 위임하는 이동 방법이다.
(서버 내에서 일어나는 이동이므로 아무런 표시가 나지 않는다.)
- forward 이동을 할 때는 context path를 사용하지 않는다.
ex)req.getRequestDispatcher("/test/fortune.jsp");
- RequestDispatcher 객체의 forward() 메소드를 호출하면서
HttpServletRequest 객체와 HttpServletResponse 객체의 참조값을 전달하면 forward 이동이 된다.
ex)rd.forward(req, resp);

[요약!]
요청을 받는 것과 로직처리는 servlet에서 하고, 응답은 jsp에서 한다.
필요한 내용은 httpservlet에 담아놨으니 (요청영역(request scope)) forward 해서 확인하면 된다.

- servlet과 jsp 가 협동 작업을 한다는 것이 요점!

나중에 스프링에서는 servlet에서 복잡한 작업을 하고
jsp 에서는 응답에만 집중하는 작업을 할 것이다.
*/