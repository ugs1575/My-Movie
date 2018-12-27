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
    margin-bottom: 8%
    
}

#homebtn, #againbtn{
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover,  #againbtn:hover{
	opacity: 0.8;
}
</style>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	dto = dao.read(no);
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	String oldMainposter = dto.getMainPoster();
	String oldposter = dto.getPoster();
	
	

	boolean flag = dao.delete(no);
	String upDir = application.getRealPath("/movie/storage");
	
	if(flag){
		UploadSave.deleteFile(upDir, oldMainposter);
		UploadSave.deleteFile(upDir, oldposter);
	}


System.out.println("movie 글삭제 결과 : " +flag);
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
  

<script type="text/javascript">
function mlist(){
	var url ="movie_list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href = url;
	}
</script>	
<body>

  <div class="container" style="border:1px solid #ccc">
  <%if(flag){%>
     <h1>Movies 게시판 새 글 삭제가 완료되었습니다. 감사합니다.</h1>
     <%}else{%>
     <h1>Movies 게시판 새 글 삭제가 실패하였습니다. 다시 한번 시도해주세요.</h1>
  	 <%} %>
   
    <hr>
    
 
    <div> 
    <%if(flag==false){ %>
     <button type="button" id="againbtn" onclick="history.back()">다시시도</button>
     <%} %>
      <button type="button" id="homebtn" onclick="mlist()"  style="float:right">Movie list</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>