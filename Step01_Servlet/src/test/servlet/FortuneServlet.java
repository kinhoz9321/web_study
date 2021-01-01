package test.servlet;

/*
 * 오늘의 운세를 html 형식으로 출력하는 서블릿을 만들어 보세요.
 * 오늘의 운세는 필드에 저장된 배열의 내용 중에서 1개가 랜덤하게 출력되도록 하세요.
 * 
 * - hint
 * Random ran=new Random();
 * int index=ran.nextInt(5);
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//sub 라는 폴더는 존재하지 않지만 sub 폴더 안에 있는 fortune.html 같은 느낌을 준다.
@WebServlet("/sub/fortune")
public class FortuneServlet extends HttpServlet{

	String[] list= {
			"2021년에는 재산이 축적되요",
			"2021년에는 마음이 즐거워요",
			"2021년에는 좋은 사람을 만나요",
			"2021년에는 가족이 건강해요",
			"2021년에는 모든 일이 잘 풀려요"
	};
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8"); 
		resp.setContentType("text/html;charset=utf-8");
		
		//클라이언트에게 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>오늘의 운세</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		//배열의 인덱스로 사용할 정수를 랜덤하게 얻어낸다. (랜덤 객체 만들기)
		Random ran=new Random();
		//0~4 사이의 랜덤한 정수
		int index=ran.nextInt(5);
		//오늘의 운세
		String fortuneToday=list[index];
		//String type 으로 안받고 list[index]를 바로 fortuneToday 자리에 넣어줘도 된다.
		pw.println("<p>오늘의 운세 : "+fortuneToday+"</p>");
		//상대 경로로 kim1.png 이미지를 출력하도록 해보세요.
		pw.println("<img src='../images/kim1.png'/>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
	
}
/*
	[pw.println("<img src='../images/kim1.png'/>");]
	
	"/sub/fortune"
	/sub/ 때문에 한단계 상위 경로(../)로 나가서 이미지 파일을 가져와야 한다.
	../ 한단계 위로 올라가기 - root path 로 간다.
	참고) ../../ 두단계 위로 올라가기
	images/kim1.png 이렇게 하게 되면 서버가 sub 폴더 안의 image 파일을 찾게 된다.
	
	http://localhost:8888/Step01_Servlet/sub/fortune
	sub라는 폴더는 존재하지 않지만 sub폴더 안에 있는 fortune.html 같은 느낌을 준다.
	sub는 가상의 폴더 - * 경로에 있는 이름이 반드시 폴더로 존재하는 건 아니다. *
	depth - 심도, 깊이
	
	[알아두기!]
	jsp = Java Server Page (Java+html)
	회색 동그라미 L은 지역변수라는 의미
*/