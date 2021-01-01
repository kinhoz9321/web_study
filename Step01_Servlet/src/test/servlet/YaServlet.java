package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// '/'를 빼먹는 실수를 많이 함. '/' 없으면 서버가 시작도 안하기 때문에 반드시 있어야 한다.
@WebServlet("/ya")
public class YaServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//클라이언트에게 문자열을 출력할 수 있는 객체의 참조값 얻어오기
		//getWriter() 사용. PrintWriter 타입으로 받아준다.
		PrintWriter pw=resp.getWriter();
		
		//println 은 개행기호를 같이 출력해준다.
		pw.println("ho");
		
		/*
		 * close() 하면 자동으로 flush 안된 걸 방출한 다음 닫는다. 
		 * 따라서 close() 할거면 flush 생략 가능
		 */
		//pw.flush();
		pw.close();
		
	}
}
/*
서버가 스타트 되어있는 상태에서 새로운 코딩을 하면 서버는 알지 못한다.
시작되는 시점에는 새로운 코딩이 없었으니까.
그러니 새로운 코딩을 적용시키고 싶다면, 서버를 껐다가 다시 시작해야한다.
*/