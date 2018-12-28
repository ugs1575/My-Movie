<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="mdao" class="member.MemberDAO"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/>

<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
	width: 50%;
	margin-bottom: 8%;
    
}

#homebtn, #againbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #againbtn:hover{
	opacity: 0.8;
}
</style>

<%
String id = request.getParameter("id");
String psw = request.getParameter("psw");


Map map = new HashMap();
map.put("id", id);
map.put("psw", psw);

boolean flag = mdao.loginCheck(map);
System.out.println(flag);
mdto = mdao.read(id);


if(flag){
	String grade = mdao.getGrade(id);
	session.setAttribute("id",id);
	session.setAttribute("grade",grade);
}

%>
 
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Login 결과</b></span><br></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  

<body>

  <div class="container">
  <%if(flag){%>
     <h1>로그인 성공 !</h1>
    <%} else{ %>
     <h1>로그인 실패 ㅠㅠ</h1>
    <%} %>
   
    <hr>
    
 
  <div>
  <%if(flag==false){ %>
  	<button type="button" id="againbtn" onclick="history.back()">다시시도</button>
  	<%} %>
      <button type="button" id="homebtn" onclick="location.href='../home.jsp'" style="float:right">Home</button>
    </div>
  </div>

</body> 