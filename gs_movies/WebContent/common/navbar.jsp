<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
String root = request.getContextPath(); 

String user_id = (String)session.getAttribute("id");
String user_grade=(String)session.getAttribute("grade");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-white w3-wide w3-padding w3-card">
    <a href="#home" class=" w3-button"><b>M.M</b> MyMovies</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small" style="border:1px solid black; width:80%;">
     

 <!-- drop down menu for admin -->    
<div class="dropdown" style="border:1px solid black">
 <a href="<%=root %>/home.jsp" class="w3-button">Home</a>
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Movie
    </button>
    <ul class="dropdown-menu">
      <li><a class="dropdown-item" href="<%=root%>/movie/movie_list.jsp">List</a></li>
      <li><a class="dropdown-item" href="<%=root%>/movie/movie_create.jsp">Movie 글 작성</a></li>
    </ul>
<a href="<%=root%>/review/review_list.jsp" class=" w3-button">Reviews</a>
      <a href="#Notice" class="w3-button">Notice</a>
      <a href="#About" class="w3-button">About</a>
      <%
      if (user_id!=null){
      %>
      	<a href="<%=root%>/member/myPage.jsp" class=" w3-button">My Page</a>
      	<a href="<%=root%>/member/logout.jsp" class=" w3-button">Logout</a>
      <%}else{ 
      %>
    	<a href="<%=root%>/member/loginForm.jsp" class=" w3-button">Login</a>
      	<a href="<%=root%>/member/signupForm.jsp" class=" w3-button">Sign-up</a>
      <%}%>
 </div>
 <!-- drop down menu end --> 
      
      
    </div>
  </div>
</div>
</body>
