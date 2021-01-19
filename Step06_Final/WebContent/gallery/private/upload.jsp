<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%-- json 응답할 때는 application/json 주석 ! 쓰면 에러남. json 에러. 주의하기 --%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Tomcat 서버를 실행했을 때 WebContent/upload 폴더의 실제 경로 얻어오기
	String realPath=application.getRealPath("/upload"); 
	System.out.println("realPath:"+realPath);
	
	File f=new File(realPath);
	if(!f.exists()){
		f.mkdir();
	}
	//최대 업로드 사이즈 설정
	int sizeLimit=1024*1024*50; //50 MByte
	
	//<form enctype="multipart/form-data"> 로 전송된 값은 아래의 객체를 이용해서 추출한다.
	MultipartRequest mr=new MultipartRequest(request,
			realPath, 
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());//알아서 파일명을 바꿔주는 객체
	//업로드 된 이미지 파일의 저장 경로만 json으로 응답하면 된다.
	String saveFileName=mr.getFilesystemName("image");
	String imagePath="/upload/"+saveFileName;
%>
{"imagePath":"<%=imagePath %>"}