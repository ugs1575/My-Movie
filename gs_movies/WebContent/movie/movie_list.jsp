<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>

<%
List<MovieDTO> list = dao.list();
%>
<script type="text/javascript" src="./httpRequest.js"></script>
<script type="text/javascript">
 
function sendR(no) {
	alert('read실행');
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

function sendU(no) {
	   alert("update실행");
	   var params = "no="+no;
	   var displayArea = document.getElementById("modal01");
	   displayArea.innerHTML = "";
	   
	   sendRequest("./movie_update.jsp", params, responseU, "post");
}
	 
function responseU() {
	        
	        if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
	            if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
	                
	                var displayArea = document.getElementById("modal01");
	                displayArea.style.display = "block";
	                displayArea.innerHTML = httpRequest.responseText;
	            }
	        }
}

function sendUP(f) {
	   alert("update proc 실행");
	   var params = "no="+f.no.value;
	   params= params+"&mainPoster="+f.mainPoster.value;
	   params= params+"&title="+f.title.value;
       params = params + "&ryear="+f.ryear.value;
       params = params + "&director=" + f.director.value;
       params = params + "&country="+f.country.value;
       params = params + "&content=" + f.content.value; 
       params = params + "&viewlevel=" + f.viewlevel.value; 
	   var displayArea = document.getElementById("modal01");
	   displayArea.innerHTML = "";  
	   
	   sendRequest("./movie_updateProc.jsp", params, responseUP, "post");
}
function responseUP() {
    
    if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
        if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
            
        	 var displayArea = document.getElementById("modal01");
             displayArea.style.display = "block";
             displayArea.innerHTML = httpRequest.responseText;
             
        }
    }
}

function sendD(no) {
	   alert("delete 실행");
	   var params = "no="+no;
	
	   var displayArea = document.getElementById("modal01");
	   displayArea.innerHTML = "";  
	   
	   sendRequest("./movie_delete.jsp", params, responseD, "post");
}
function responseD() {
 
 if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
     if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
         
     	 var displayArea = document.getElementById("modal01");
          displayArea.style.display = "block";
          displayArea.innerHTML = httpRequest.responseText;
          
     }
 }
}

function sendDP(no) {
	   alert("delete proc 실행");
	   var params = "no="+no;
	   
	   var displayArea = document.getElementById("modal01");
	   displayArea.innerHTML = "";  
	   
	   sendRequest("./movie_deleteProc.jsp", params, responseDP, "post");
}
function responseDP() {
 
 if (httpRequest.readyState == 4) { // 전송을 전부 받았다면
     if (httpRequest.status == 200) { // 요청한 서버 파일이 실행 됐다면
         
     	 var displayArea = document.getElementById("modal01");
          displayArea.style.display = "block";
          displayArea.innerHTML = httpRequest.responseText;
          
     }
 }
}



</script>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Movies</b></span><br> <span class="w3-hide-small w3-text-light-grey">Introduction & brief story of Movie</span></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Movie List</h3>
  </div>
  
  
  <!-- First Photo Grid-->
  <%
  int i = 0;
  for(i=0;i<list.size(); i++)
  {%>
	  <%if(i%3==0){ %> 
	  <div class="w3-row-padding"><%}
  	  dto = list.get(i);%> 
  
    <div class="w3-third w3-container w3-margin-bottom">
      <img src="../movie/img/<%=dto.getPoster() %>" name ="poster" width=100% height=310px class="w3-hover-opacity" onclick="sendR(<%=dto.getNo()%>)">
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
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div> 
  
    <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal" style="padding-top:0; background-color:rgba(0,0,0,0.7)">
  </div>
  
  

<%-- <%@ include file = "../common/footer.jsp" %> --%>