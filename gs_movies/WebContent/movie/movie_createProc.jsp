<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>

<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin-bottom: 8%
    
}

#homebtn, #againbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #againbtn:hover {
	opacity: 0.8;
}
</style>

<%
String tempDir = application.getRealPath("/movie/temp");
String upDir = application.getRealPath("/movie/storage");

UploadSave upload = new UploadSave(request, -1, -1, tempDir);


dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setViewLevel(UploadSave.encode(upload.getParameter("viewLevel")));
dto.setRyear(UploadSave.encode(upload.getParameter("ryear")));
dto.setDirector(UploadSave.encode(upload.getParameter("director")));
dto.setCountry(UploadSave.encode(upload.getParameter("country")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setViewer(UploadSave.encode(upload.getParameter("viewer")));
dto.setGenre(UploadSave.encode(upload.getParameter("genre")));

FileItem fileItem = upload.getFileItem("mainPoster");
FileItem fileItem2 = upload.getFileItem("poster");

int filesize = (int) fileItem.getSize();
int filesize2 = (int) fileItem2.getSize();

String mainPoster = null;
String poster = null;

if(filesize>0 && filesize2>0){
	mainPoster = UploadSave.saveFile(fileItem,upDir);
	poster = UploadSave.saveFile(fileItem2,upDir);
} else {
	mainPoster = "noimg.png";
	poster = "noimg.png";
}

dto.setMainPoster(mainPoster);
dto.setPoster(poster);

boolean flag = dao.create(dto);

System.out.println("movie 글등록 결과 : " +flag);
%>
 
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Sign-up</b></span><br> <span class="w3-hide-small w3-text-light-grey">Introduction & brief story of Movie</span></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  

<body>

  <div class="container" style="border:1px solid #ccc">
  <%if(flag){%>
     <h1>Movies 게시판 새 글 등록이 완료되었습니다. 감사합니다.</h1>
     <%}else{%>
     <h1>Movies 게시판 새 글 등록이 실패하였습니다. 다시 한번 시도해주세요.</h1>
  	 <%} %>
   
    <hr>
    
 
    <div>
    <%if(flag==false){ %>
     <button type="button" id="againbtn" onclick="history.back()">다시시도</button>
     <%} %>
      <button type="button" id="homebtn" onclick="location.href='movie_list.jsp'">Movie list</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>