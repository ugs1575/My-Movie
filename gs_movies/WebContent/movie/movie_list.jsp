<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>


#readspan{
 color:white; 
 float:right; 
 font-size:40px;
}

#blackbox{
	width:1300px; 
	height:730px; 
	margin-left:auto; 
	margin-right:auto;
	margin-top:40px; 
	margin-bottom:20px;
	background-color:rgba(0,0,0,0.8);
}

#minibox{
	width:900px; 
	height:730px; 
	margin:auto; 
	border:1px solid transparent;
}
table{
	width:700px; 
	height:630px; 
	margin-top:23px; 
	margin-bottom:23px; 
	margin-left:100px; 
	margin-right:80px; 
	color:white; 
	text-align:center;
}

input[type=text]{
	background-color:transparent; 
	border:none;
}
#readimg{
	max-width:350px; 
	height:300px;
}
</style>

<%
// 검색 관련 처리
String col = utility.checkNull(request.getParameter("col"));
String word = utility.checkNull(request.getParameter("word"));

if (col.equals("total")) {
	word = "";
}

//페이징 관련 처리

int nowPage = 1; // 외출
int recordPerPage = 6;

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage")); //위험함! numberformatException 가능성	
}

//DB에서 가져올 레코드의 순번
int sno = ((nowPage - 1) * recordPerPage) + 1; //공식임 ㅎ
int eno = nowPage * recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

List<MovieDTO> list = dao.list(map);
//전체 레코드 개수(col, word)
int totalRecord = dao.total(map);
%>

<script type="text/javascript" src="./httpRequest.js"></script>
<script type="text/javascript">
 
function sendR(no) {
	 var params = "no="+no;

	 var displayArea = document.getElementById("modal01");
	 displayArea.innerHTML = "";
	   
	   sendRequest("./movie_read.jsp", params, responseR, "post");
}
	 
function responseR() {
	        
	        if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
	            if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
	            	
	                var displayArea = document.getElementById("modal01");
	                displayArea.style.display = "block";
	                displayArea.innerHTML = httpRequest.responseText;
	                
	            }
	        }
}

function mupdate(no){
	var url = "movie_update.jsp";
	url = url + "?no="+no;
	url = url + "&col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	
	location.href=url;
}
function mdel(no){
	var r = confirm("정말 삭제하시겠습니까? 삭제하신 데이터는 복구되지 않습니다.");
    if (r == true) {
        var url = "movie_delete.jsp";
    	url = url + "?no="+no;
    	url = url + "&col=<%=col%>"
    	url = url + "&word=<%=word%>"
    	url = url + "&nowPage=<%=nowPage%>"
    	
    	location.href=url;
    }
    
	
}

</script>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Movies</b></span><br></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Movie List</h3>
    
    <div class="search w3-display-bottomright" style="padding:20px 50px">
		<form method="post" action="./movie_list.jsp">
			<input type="hidden" name="col" value="title">
			<input type="text" name="word" value="<%=word%>" style="border:1px solid black">
			 <button type="submit" class="btn btn-default btn-sm">
          		<span class="glyphicon glyphicon-search"></span> Search 
        	</button>
		</form>
	</div>
    
    
  </div>
  
  
  
  <!-- First Photo Grid-->
  <%
  int i = 0;
  for(i=0;i<list.size(); i++)
  {%>
  	<%
	    if (list.size() == 0) {
	%>
	<div class="w3-container">검색 결과가 없습니다.</div>
	<%} %>
	  <%if(i%3==0){ %> 
	  <div class="w3-row-padding"><%}
  	  dto = list.get(i);%> 
  
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="./storage/<%=dto.getPoster() %>" name ="poster" width=100% height=310px class="w3-hover-opacity" 
      onclick="sendR(<%=dto.getNo()%>)">
      <div class="w3-container w3-white">
        <p><b><%=dto.getTitle() %></b></p>
        <p><%=dto.getContent() %></p>
      </div>
    </div>
    <% if(i%3==2){ %>
	  </div><%}%>
<%}%>
    

   
  <!-- End page content -->
</div>

   <!-- Pagination -->
   
    <div style="padding:3%">
    <%=utility.movie_paging(totalRecord, nowPage, recordPerPage, col, word)%>
  </div>

    <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal" style="padding-top:0; background-color:rgba(0,0,0,0.7)">
  </div>
  
  

<%-- <%@ include file = "../common/footer.jsp" %> --%>