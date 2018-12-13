<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
String root = request.getContextPath(); 
/* String id = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade"); */
%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="#home" class="w3-bar-item w3-button"><b>M.M</b> MyMovies</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="../home.jsp" class="w3-bar-item w3-button">Home</a>
      <a href="<%=root%>/movie/movie_list.jsp" class="w3-bar-item w3-button">Movies</a>
      <a href="<%=root%>/review/review_list.jsp" class="w3-bar-item w3-button">Reviews</a>
      <a href="#Notice" class="w3-bar-item w3-button">Notice</a>
      <a href="#About" class="w3-bar-item w3-button">About</a>
      <a href="#Login" class="w3-bar-item w3-button">Login</a>
      <a href="<%=root%>/others/signupForm.jsp" class="w3-bar-item w3-button">Sign-up</a>
    </div>
  </div>
</div>