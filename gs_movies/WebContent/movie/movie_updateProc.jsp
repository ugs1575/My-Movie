<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
    margin-bottom: 8%;
	width: 50%;
    
}

#homebtn, #loginbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #loginbtn:hover{
	opacity: 0.8;
}
</style>

<%
request.setCharacterEncoding("utf-8");

String tempDir = application.getRealPath("/movie/temp");
String upDir = application.getRealPath("/movie/storage");

UploadSave upload = new UploadSave(request,-1,-1,tempDir);//매개변수가 포함된 생성자는 uesbean사용 x

//form의 값 받기
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setRyear(UploadSave.encode(upload.getParameter("ryear")));
dto.setDirector(UploadSave.encode(upload.getParameter("director")));
dto.setCountry(UploadSave.encode(upload.getParameter("country")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setViewLevel(UploadSave.encode(upload.getParameter("viewLevel")));
dto.setViewer(UploadSave.encode(upload.getParameter("viewer")));
dto.setGenre(UploadSave.encode(upload.getParameter("genre")));


//hidden 값 받기
dto.setNo(Integer.parseInt(upload.getParameter("no")));
String col = upload.getParameter("col");
String word = UploadSave.encode(upload.getParameter("word"));
String nowPage = upload.getParameter("nowPage");
System.out.println("updateProc:"+col+","+word+","+nowPage);
String oldMainposter = UploadSave.encode(upload.getParameter("oldMainposter"));
String oldposter = UploadSave.encode(upload.getParameter("oldposter"));

//업로드 파일 받기
FileItem fileItem = upload.getFileItem("mainPoster");
FileItem fileItem2 = upload.getFileItem("poster");

int filesize = (int) fileItem.getSize();
int filesize2 = (int) fileItem2.getSize();

String mainPoster = null;
String poster = null;

boolean flag = false;
if(filesize>0 && filesize2>0){
	if(oldMainposter!=null && oldposter!=null) {
		UploadSave.deleteFile(upDir, oldMainposter);
		UploadSave.deleteFile(upDir, oldposter);
		mainPoster = UploadSave.saveFile(fileItem, upDir);
		poster = UploadSave.saveFile(fileItem2, upDir);
	}
	
}

dto.setMainPoster(mainPoster);
dto.setPoster(poster);

flag = dao.update(dto);

System.out.println("movie 글수정 결과 : " +flag);
%>
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Movies</b></span><br> </h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  

<script type="text/javascript">
function mlist(){
	var url = "movie_list.jsp";
	url = url + "?col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	location.href = url;
}
</script>
<body>

  <div class="container">
  <%if(flag){%>
     <h2>Movies 게시판 새 글 수정이 완료되었습니다. 감사합니다.</h2>
     <%}else{%>
     <h2>Movies 게시판 새 글 수정이 실패하였습니다. 다시 한번 시도해주세요.</h2>
  	 <%} %>
   
    <hr>
    
 
    <div>
      <%if(flag==false){ %>
      <button type="button" id="loginbtn" onclick="history.back()">다시시도</button>
       	<%} %>
      <button type="button" id="homebtn" onclick="mlist()" style="float:right">Movie 목록</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>


