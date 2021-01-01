package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//클라이언트가 요청과 함께 전송한 문자열을 추출하기
		String line=req.getParameter("msg");
		System.out.println("클라이언트가 전송한 문자열 : "+line);
		
		//간단한 문자열 응답하기
		PrintWriter pw=resp.getWriter();
		pw.println("/send okay!");
		pw.close();
	}
}
/*
[클라이언트가 폼을 활용해서 문자열을 전송할 수 있음을 확인]
<form action="send" method="get">
<input type="text" name="msg" placeholder="문자열 입력"/>
action="send" - @WebServlet("/send")
name="msg" - req.getParameter("msg")
연관성 알아두기 (액션 속성의 value가 요청명이 된다.)

[알아두기!]
폼 전송은 servlet 에서도 추출할 수가 있고, jsp 에서도 추출할 수가 있다.
폼 전송을 하는 것 자체가 페이지 이동이 필요한 일.
*/