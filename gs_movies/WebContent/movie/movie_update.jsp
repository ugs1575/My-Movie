<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	dto = dao.read(no);
%>

  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">

textarea {
   resize: none;
}

.bottom{
	text-align: center;
	padding: 2%;  
}

input[type=button], input[type=submit]{
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

input[type=button]:hover, input[type=submit]:hover {
	opacity: 0.8;
}


</style>
<script type="text/javascript">
function inputCheck(f){
	alert("inputcheck 실행");
	
	if(f.mainPoster.value==null){
		alert("메인포스터를 업로드 해주세요");
		f.mainPoster.focus();
		return false;
	}
	
	if(f.poster.value==null){
		alert("스틸컷을 업로드 해주세요");
		f.poster.focus();
		return false;
	}
	
	if(f.title.value==""){
		alert("제목을 입력해 주세요");
		f.title.focus();
		return false;
	}
	
	if(f.genre.value==""){
		alert("장르를 선택해 주세요");
		f.genre.focus();
		return false;
	}
	
	if(f.ryear.value==""){
		alert("개봉년도를 입력해 주세요");
		f.ryear.focus();
		return false;
	}
	
	if(f.country.value==""){
		alert("제작국가를 입력해 주세요");
		f.country.focus();
		return false;
	}
	
	if(f.viewLevel.value==""){
		alert("관람등급을 선택해 주세요");
		f.viewLevel.focus();
		return false;
	}
	
	if(f.director.value==""){
		alert("감독을 입력해 주세요");
		f.director.focus();
		return false;
	}
	
	if(f.viewer.value==""){
		alert("관객수를 입력해 주세요");
		f.viewer.focus();
		return false;
	}
	
	if(f.content.value==""){
		alert("줄거리를 입력해 주세요");
		f.content.focus();
		return false;
	}
	
	
	
	

}
</script>
</head>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Movies</b></span><br></h1>
  </div>
</header>

<body>  
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<!-- Movies Section -->
<div class="w3-container w3-padding-32" id="projects">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Movies 글 수정</h3>
</div>

<div class="container" style="width: 50%; margin:auto;">
 
<FORM name='frm' method='POST' action='./movie_updateProc.jsp' enctype="multipart/form-data" onsubmit="return inputCheck(this)">
<input type="hidden" name="no" value="<%=dto.getNo() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<%

System.out.println("update:"+request.getParameter("col")+","+request.getParameter("word")+","+request.getParameter("nowPage"));

%>
<input type="hidden" name="oldMainposter" value="<%=dto.getMainPoster() %>">
<input type="hidden" name="oldposter" value="<%=dto.getPoster() %>">
  <TABLE class="w3-table w3-hoverable">
    <TR>
      <TH>메인 포스터</TH>
      <TD><input type="file" name="mainPoster"></TD>
    </TR>
    <TR>
      <TH>스틸컷</TH>
      <TD><input type="file" name="poster"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
    <TR>
      <TH>장르</TH>
      <TD>
      <select name="genre">
			<option value="가족">가족</option>
			<option value="공포">공포</option>
			<option value="드라마">드라마</option>
			<option value="로맨스/멜로">로맨스/멜로</option>
			<option value="뮤지컬">뮤지컬</option>
			<option value="미스터리">미스터리</option>
			<option value="범죄">범죄</option>
			<option value="스릴러">스릴러</option>
			<option value="시대극">시대극</option>
			<option value="애니메이션">애니메이션</option>
			<option value="액션">액션</option>
			<option value="어드벤처">어드벤처</option>
			<option value="전쟁">전쟁</option>
			<option value="코미디">코미디</option>
			<option value="판타지">판타지</option>
			<option value="SF">SF</option>
	  </select>
	  <script type="text/javascript">
	 document.frm.genre.value="<%=dto.getGenre()%>";
	</script>
      </TD>
    </TR>
     <TR>
      <TH>개봉 년도</TH>
      <TD><input type="text" name="ryear" value="<%=dto.getRyear() %>"></TD>
    </TR>
     <TR>
      <TH>제작 국가</TH>
      <TD><input type="text" name="country" value="<%=dto.getCountry() %>"></TD>
    </TR>
     <TR>
      <TH>관람 등급</TH>
      <TD>
      <select name="viewLevel" >
			<option value="전체">전체관람가</option>
			<option value="12세">12세 이상 관람가</option>
			<option value="15세">15세 이상 관람가</option>
			<option value="청불">청소년 관람불가</option>
	  </select>
	   <script type="text/javascript">
	 document.frm.viewLevel.value="<%=dto.getViewLevel()%>";
	</script>
      </TD>
    </TR>
    <TR>
      <TH>감독</TH>
      <TD><input type="text" name="director" value="<%=dto.getDirector() %>"></TD>
    </TR>
    <TR>
      <TH>관객수</TH>
      <TD><input type="text" name="viewer" value="<%=dto.getViewer() %>"></TD>
    </TR>
    <TR>
      <TH>줄거리</TH>
      <TD colspan="2"><textarea rows="10" cols="45" name="content" ><%=dto.getContent() %></textarea></TD>
    </TR>
   
  </TABLE>
  
  <div class='bottom'>
    <input type='submit' value='수정하기'>
    <input type='button' value='수정취소' onclick="history.back()">
  </DIV>
</FORM>
</div>

 
<!-- End page content -->
</div>  
</body>
</html>  

<%-- <%@ include file = "../common/footer.jsp" %> --%>
