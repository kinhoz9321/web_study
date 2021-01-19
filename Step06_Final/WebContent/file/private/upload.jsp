<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	int sizeLimit=1024*1024*50; //50MByte 라는 뜻
	
	//<form enctype="multipart/form-data">로 전송된 값은 아래의 객체를 이용해서 추출한다.
	//realPath는 신경쓰고, 나머지는 그냥 전달.
	MultipartRequest mr=new MultipartRequest(
			request,
			realPath, //중요
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());//알아서 파일명을 바꿔주는 객체
	//폼 전송된 내용 추출하기
	//파일 제목
	String title=mr.getParameter("title");
	//원본 파일명
	String orgFileName=mr.getOriginalFileName("myFile");
	//저장된 파일명
	String saveFileName=mr.getFilesystemName("myFile");
	//파일의 크기 (byte type - byte 타입은 꽤 크기 때문에 long 타입으로 받아준다.)
	long fileSize=mr.getFile("myFile").length();
	//작성자 (로그인해야만 작성을 할 수 있으니까 세션에서 찾기)
	String writer=(String)session.getAttribute("id");
	
	//업로드 된 파일의 정보를 FileDto에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	
	//DB에 저장하고
	boolean isSuccess=FileDao.getInstance().insert(dto);
	
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
<script>
	<%if(isSuccess){%>
		alert("파일이 업로드 되었습니다.");
		location.href="${pageContext.request.contextPath}/file/list.jsp";
	<%}else{%>
		alert("파일 업로드를 실패하였습니다.");
		location.href="${pageContext.request.contextPath}/file/upload_form.jsp";
	<%}%>
</script>
</body>
</html>