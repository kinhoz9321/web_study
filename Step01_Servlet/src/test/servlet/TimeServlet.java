package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/time")
public class TimeServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		
		//응답 컨텐츠 type 설정
		//(웹브라우저에게 어떤 컨텐츠를 응답할 것인지 알려서 준비 시킨다.)
		resp.setContentType("text/html; charset=utf-8");
		//html 파일을 응답하라 알려주기. (준비하고 받아라.)
		
		//클라이언트에게 출력할 수 있는 객체의 참조값 얻어오기 
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>현재 시간 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		//날짜 객체를 생성해서
		Date d=new Date();
		
		//현재 (service() 메소드가 호출되는 시점) 날짜 시간 정보를 문자열로 얻어낸다.
		String info=d.toString();
		
		//얻어낸 문자열을 html 문서에 끼워넣어서 출력한다.
		pw.println("<p>현재 시간 : "+info+" </p>");
		
		//상대 경로로 /WebContent/images/kim1.png 출력하기
		pw.println("<img src='images/kim1.png'/>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
/*
	*Memo*
	[Date d=new Date();]
	날짜 객체 - 틀은 정해져 있는데 그 틀 안의 내용은 다이나믹 하다. (계속 바뀐다는 뜻)
	다이나믹한 부분을 자바 jsp 로 처리한다.
	
	[pw.println("<p>현재 시간 : "+info+" </p>");]
	어떤 로직의 결과 데이터를 html 문서의 원하는 위치에 끼워 넣어서 출력할 수 있다. 
	ex)info
	그 얘기는 얼마든지 DB에 있는 내용을 select 해서 호출되는 시점에 넣어줄 수도 있다는 뜻이다.
	
	[알아두기 !]
	html 문서 (index.html) 에서는 자바 코딩을 할 수 없다. 하게 되면 그냥 문자열로 출력된다.
	Servlet은 자바 코딩을 할 수 있다는데에 의의가 있다.
	웹페이지의 바뀌는 부분 (실시간 검색어, 광고 등)은 dynamic 이다. 
	DB에 있는 내용을 select 해서 출력하고 있는 것.
	(내용을 바꾸기 위해선 DB가 필요하고, 그러기 위해선 프로그래밍 언어가 필요하다.)
	웹페이지에는 안바뀌는 부분보다 바뀌는 부분이 더 많다. 그만큼 dynamic은 중요하다.
	
	[pw.println("<img src='images/kim1.png'/>");]
	이미지가 출력되는 과정 알기!
	
	웹브라우저에서 페이지 소스보기를 하면 톰캣 서버가 img src='images/kim1.png' 문자열을 웹브라우저에게 주었다는 것을 알 수 있다.
	하지만 웹브라우저는 이미지로 파일을 출력했다.
	어떻게 된 것일까?
	
	1. 톰캣 서버가 html String 으로 웹브라우저에게 이미지 파일을 준다. 
	2. 웹브라우저는 자동으로 톰캣에게 현재 경로 /time 대신에 /images/kim.png를요청한다. (Webcontent/images/kim1.png)
	3. 톰캣은 웹브라우저에게 이미지 바이트 알갱이를 가져다준다.
	(이 때 시간이 걸린다. 이미지 파일이 큰것들은 조금조금씩 완성되기도 하는 것을 떠올려보자.)
	* 이 때 알 수 있는 것 - 웹브라우저는 해석하면서 뒤로 서버에게 다시 요청하기도 한다는 것 ex) 이미지
	
	http://localhost:8888/Step01_Servlet/images/kim1.png
	톰캣 서버는 김구라 이미지만 응답해준다. (물리적 파일을 읽어줌)
	
	http://localhost:8888/Step01_Servlet/css/bootstrap.css
	/css/bootstrap.css 웹브라우저는 서버에 이런 요청을 해서 받아냄.(?)
	
	[알아두기 !]
	run은 index에서 하기
	??는 한글이 깨졌다는 뜻
*/