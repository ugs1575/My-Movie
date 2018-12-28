<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
String root = request.getContextPath(); 

String user_id = (String)session.getAttribute("id");
String user_grade=(String)session.getAttribute("grade");

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.navbar {
  overflow: hidden;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: #f9f9f9;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
<!-- Navbar (sit on top) -->

<div class="navbar w3-white w3-wide w3-padding w3-card">
  <a href="<%=root %>/home.jsp" class=" w3-button"><b>M.M</b> MyMovies</a>
  <a href="<%=root %>/home.jsp">Home</a>
  
<%
if (user_id!=null&&user_grade.equals("A")){
%>
  <div class="dropdown">
    <button class="dropbtn">Movie 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="<%=root%>/movie/movie_list.jsp">Movie 목록</a>
      <a href="<%=root%>/movie/movie_create.jsp">Movie 글작성</a>
    </div>
  </div>
<%}else{ %>
   <a href="<%=root%>/movie/movie_list.jsp">Movie</a>
<%}%>

<%
if (user_id!=null&&user_grade.equals("A")){
%>
  <div class="dropdown">
    <button class="dropbtn">Notice 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="<%=root%>/notice/notice_list.jsp">공지 목록</a>
      <a href="<%=root%>/notice/notice_create.jsp">공지 글작성</a>
    </div>
  </div>
<%}else{ %>
   <a href="<%=root%>/notice/notice_list.jsp">Notice</a>
<%}%>

<div class="dropdown">
    <button class="dropbtn">영화리뷰 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="<%=root%>/review/review_list.jsp">리뷰 목록</a>
      <a href="<%=root%>/review/review_create.jsp">리뷰 글작성</a>
    </div>
  </div>

<%
if (user_id!=null){
%>
<a href="<%=root%>/member/logout.jsp">Logout</a>
<%}else{ 
%>
<a href="<%=root%>/member/loginForm.jsp">Login</a>
<a href="<%=root%>/member/signupForm.jsp">Sign-up</a>
<%}%>

</div>


</body>
</html>
