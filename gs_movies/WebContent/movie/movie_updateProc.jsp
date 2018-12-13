<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
 <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

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
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Sign-up</b></span><br> <span class="w3-hide-small w3-text-light-grey">Introduction & brief story of Movie</span></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  
<!--   Sign-up Section -->
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #000000;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the login button */
.loginbtn {
    padding: 14px 20px;
    color: black;
    border: 1px solid #f1f1f1;
    background-color: #ffffff;
}

/* Float login and signup buttons and add an equal width */
.loginbtn, .homebtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for login button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .loginbtn, .homebtn {
       width: 100%;
    }
}
</style>
<body>

  <div class="container" style="border:1px solid #ccc">
  <%if(flag){%>
     <h1>Movies 게시판 새 글 수정이 완료되었습니다. 감사합니다.</h1>
     <%}else{%>
     <h1>Movies 게시판 새 글 수정이 실패하였습니다. 다시 한번 시도해주세요.</h1>
  	 <%} %>
   
    <hr>
    
 
    <div class="clearfix">
      <button type="button" class="loginbtn" onclick="location.href='loginForm.jsp'">Login</button>
      <button type="button" class="homebtn" onclick="location.href='movie_list.jsp'">Movie list</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>


