<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>

<%
List<MovieDTO> list = dao.list();
%>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
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
  
  

   <%
  for(int i=0; i<list.size(); i++){
		dto = list.get(i);
  %>
  <div class="w3-row w3-margin">
  <div class="w3-third">
  	<img src="../movie/<%=dto.getPoster() %>" style="width:100%;height:300px">
  </div>
  <div class="w3-twothird w3-container">
 
  	<h2><%=dto.getTitle() %></h2>
  	<p><%=dto.getContent() %></p>
  	
  </div>
  </div>
  <%}%>

 <!-- End page content -->
</div>

  
  

<%@ include file = "../common/footer.jsp" %>