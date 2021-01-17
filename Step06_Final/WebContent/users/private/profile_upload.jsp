<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
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
	int sizeLimit=1024*1024*5; //5 MByte(메가바이트)
	
	//신경써야 하는 것 = realPath. 나머지는 그냥 전달하면 됨.
	MultipartRequest mr = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	//업로드된 이미지의 원본 파일명
	String orgFileName=mr.getOriginalFileName("image");
	//upload 폴더에 실제 저장된 파일명
	String saveFileName=mr.getFilesystemName("image");
	
	//로그인된 아이디
	String id=(String)session.getAttribute("id");
	
	//저장된 파일명을 이용해서 프로필 이미지 경로를 구성한다.
	String profile="/upload/"+saveFileName;
	
	//UsersDto 객체에 담아서
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setProfile(profile);
	
	//DB 에 반영하기
	UsersDao.getInstance().updateProfile(dto);
	
	//개인정보 수정 페이지로 리다일렉트 시키기
	//사진을 선택하는 것만으로도 프로필 사진이 바로 교체되면서 개인정보 수정 페이지로 리다일렉트 된다.
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/users/private/updateform.jsp");
%>
<%--
	String realPath=application.getRealPath("/upload");
	운영체제마다 경로를 표시하는 게 다르다.
	하지만 application.getRealPath()메소드를 사용하면 알아서 올바른 표시로 경로를 리턴해준다.
	
	DefaultFileRenamePolicy()
	알아서 파일명을 바꿔주는 객체
--%>