<%@page import="java.net.URLEncoder"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한페이지에 몇개씩 표시할 것인지 (변화줘보기) 상수로 변경 (member list에서 복사 붙여넣기 한페이지 몇개 표시할 것이지 수정)
	//int pageRowCount=5;
	final int PAGE_ROW_COUNT=12;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;

	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면 (파라미터가 안넘어오면 null 1페이지를 보여준다.)
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 저장한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");
	//만일 키워드가 넘어오지 않는다면
	if(keyword==null){
		//키워드와 검색 조건에 빈 문자열을 넣어준다.
		//클라이언트 웹브라우저에 출력할 때 "null"을 출력되지 않게 하기 이해서
		keyword="";//키워드
		condition="";//검색조건
	}
	
	//특수기호를 인코딩한 키워드를 미리 준비한다.
	String encodedK=URLEncoder.encode(keyword);
	
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
	List<GalleryDto> list=null;
	
	//전체 row의 갯수를 담을 지역변수를 미리 만든다.
	int totalRow=0;
	
	//만일 검색 키워드가 넘어온다면 (3개의 블럭) 메소드 총 6개 추가하기
	if(!keyword.equals("")){//오늘의 로직처리 부분!(키워드가 있을때 어떻게 달라지는지!)
		//검색 조건이 무엇이냐에 따라 분기하기
		if(condition.equals("writer")){//작성자 검색인 경우
			dto.setWriter(keyword);
			list=GalleryDao.getInstance().getListW(dto);
			totalRow=GalleryDao.getInstance().getCountW(dto);
			
		}//다른 검색 조건을 추가하고 싶다면 아래에 else if() 를 계속 추가하면 된다.
	}else{//검색 키워드가 넘어오지 않는다면 (1개의 블럭)
		//키워드가 없을때 호출하는 메소드를 이용해서 파일 목록을 얻어온다.
		list=GalleryDao.getInstance().getList(dto);
		//키워드가 없을때 호출하는 메소드를 이용해서 전체 row의 갯수를 얻어온다.
		totalRow=GalleryDao.getInstance().getCount();
	}
	/*
	각각의 블럭에서 하는 일
	- 검색 조건에 맞는 글 목록과 글의 갯수 얻어오기
	
	[팁]
	컨트롤 누른 상태에서 gallerydao 클릭하면 바로 gallerydao로 넘어갈 수 있다.
	*/
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount;
	}
	
	//로그인된 아이디가 있는지 읽어와본다.(로그인을 하지 않았으면 null 이다.)
	String id=(String)session.getAttribute("id");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/imgLiquid.js"></script>
<style>
	/*card 이미지 부모요소의 높이 지정*/
	.img-wrapper{/*width=100% div니까*/
		height: 250px;
		/*
		transform 을 적용할 때 0.3s 동안 순차적으로 적용시키기 (사진이 커지는 모습이 부드럽고, 안부드럽고 차이)
		변화시킬때 시간 텀을 두고 변화시키는 게 transition
		all은 전부 (transform, background-color)
		*/
		transition: all 0.3s ease-out;
		
	}
	/*.img-wrapper 에 마우스가 hover 되었을때 적용할 css*/
	.img-wrapper:hover{
		/*transform: rotateZ(10deg) scale(1.1); - 화면이 돌아감*/
		/*원본크기의 1.1배로 확대 시키기*/
		transform: scale(1.05);
		background-color:orange;
	}
	
	.card .card-text{ /*내용이 한줄을 넘어가면 .. 으로 표시되는 css*/
		display:block;
		white-space:nowrap;
		text-overflow:ellipsis;
		overflow:hidden;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
	<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">Home</a>
			</li>
			<li class="breadcrumb-item">갤러리 목록</li>
		</ul>
	</nav>
	</div>
	<div class="container">
		<button class="btn btn-success">
			<a style="color:white" href="private/upload_form.jsp">사진 업로드</a>
		</button>
		<div class="row"><!-- row 안에 칼럼의 크기를 만들고 있다. -->
		<%for(GalleryDto tmp:list){ %>
		<div class="col-6 col-md-4 col-lg-3">
			<div class="card mb-3"><!-- mb-3 갤러리에 아래 위 공간 -->
				<a href="detail.jsp?num=<%=tmp.getNum()%>">
					<div class="img-wrapper">
						<img class="card-img-top" src="${pageContext.request.contextPath }<%=tmp.getImagePath() %>" />
					</div>
				</a>
				<div class="card-body">
					<h2 class="card-text"><%=tmp.getCaption() %></h2>
					<p class="card-text"> 작성자 : <strong><%=tmp.getWriter() %></strong></p>
					<p class="card-text"><%=tmp.getRegdate() %></p>
				</div>
			</div>
		</div>
		<%} %>
		</div>
		<nav>
		<ul class="pagination pagination justify-content-center">
			<%if(startPageNum!=1){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition%>&keyword=<%=encodedK%>">Prev</a>
				</li>
			<%}else{ %>
			<!-- 
			disabled 존재하지만 누를 수 없게 만듦 javascript: 자바스크립트를 비워두겠다. 동작하지 않도록. 
			출력은 하지만 동작하지 않음.
			-->
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %><!-- 반복문 돌면서 li가 총 5개 만들어짐 (s1-e5)-->
				<%if(i==pageNum){ %><!-- i가 현재페이지 번호와 같으면 active가 들어가야 한다. -->
					<li class="page-item active"><!-- class 자동 부트스트랩 효과 추가 -->
						<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
						<!-- i가 1이 찍혀있으면 pageNum도 1이 찍혀 있어야 한다. -->
					</li>
				<%}else{ %><!-- i가 현재페이지 번호와 같지 않으면 active가 안들어간다. -->
					<li class="page-item"><!-- class 자동 부트스트랩 효과 추가 -->
						<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition%>&keyword=<%=encodedK%>">Next</a>
				</li>
			<%}else{ %>
			<!-- 
			disabled 존재하지만 누를 수 없게 만듦 javascript: 자바스크립트를 비워두겠다. 동작하지 않도록. 
			출력은 하지만 동작하지 않음.
			-->
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Next</a>
				</li>
			<%} %>
		</ul>
	</nav>
	<!-- filedao dynamic query 사용해야함. -->
	<form class="row g-3 justify-content-center" action="list.jsp" method="get">
		<div class="col-auto">
			<select class="form-control" style="width:200px" name="condition" id="condition">
				<option value="writer" <%=condition.equals("writer")?"selected":"" %>>작성자</option>
			</select>
		</div>
		<div class="col-auto">
			<input class="form-control" style="width:500px" type="text" name="keyword" placeholder="검색어" value="<%=keyword%>"/><!-- keyword 원본 문자열 -->
		</div>
		<div class="col-auto">
			<button class="btn btn-success" type="submit">검색</button>
		</div>
	</form>
	<%--
		만일 검색 키워드가 존재한다면 몇개의 글이 검색되었는지 알려준다. 
		
	--%>
	<%if(!keyword.equals("")){ %>
		<div class="alert text-center">
			<strong><%=totalRow %></strong> 개의 자료가 검색 되었습니다.
		</div>
	<%} %>
	<br />
	<button class="btn btn-warning">
		<a href="${pageContext.request.contextPath}/index.jsp" style="color:white">Home</a>
	</button>
</div>
<script>
	function deleteConfirm(num){
		let isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
	//card 이미지의 부모 요소를 선택해서 imgLiquid 동작(jquery plugin 동작) 하기
	$(".img-wrapper").imgLiquid();
	//자바스크립트에는 원래 없다. imgLiquid.js 를 추가했기 때문에 사용 가능한 것
</script>
</body>
</html>