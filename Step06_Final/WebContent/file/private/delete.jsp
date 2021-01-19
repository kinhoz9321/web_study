<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 전달되는 삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	//2. DB 에서 해당 파일의 정보를 읽어온다.
	FileDto dto=FileDao.getInstance().getData(num);
	
	//만일 로그인 된 아이디와 글 작성자가 다르면 에러를 응답한다.
	//(필터로도 할 수 있고, 직접 할수도 있음.)
	String id=(String)session.getAttribute("id");
	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 자료만 삭제할 수 있습니다.");
		//sendError(숫자, "오류메세지") 403 금지된 코드 (남의 파일은 삭제가 불가능하기 때문)
		return; //메소드 종료
	}
	
	//3. DB에서 파일 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	
	//4. 파일 시스템 (upload 폴더) 에 저장된 파일을 삭제한다. (삭제할 파일의 절대 경로)
	String path=application.getRealPath("/upload")+File.separator+File.separator+dto.getSaveFileName();
	
	//삭제할 파일을 access 할 수 있는 File 객체 생성
	File file=new File(path);
	if(file.exists()){
		file.delete();
	}
	
	//5. 응답한다.
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp"); 
	//리다일렉트 응답을 하기 때문에 HTML 문서는 사용하지 않는다.
%>