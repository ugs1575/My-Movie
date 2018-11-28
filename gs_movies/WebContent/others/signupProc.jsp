<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>


<%
String tempDir = application.getRealPath("/movie/temp");
String upDir = application.getRealPath("/movie/storage");

UploadSave upload = new UploadSave(request, -1, -1, tempDir);

dto.setId(upload.getParameter("id"));
dto.setName(UploadSave.encode(upload.getParameter("name")));
dto.setEmail(upload.getParameter("email"));
dto.setPsw(upload.getParameter("pwd"));

FileItem fileItem = upload.getFileItem("fname");

int filesize = (int) fileItem.getSize();

System.out.println("filesize:>>>>>>>>>>>>"+filesize);

String fname = null;

if(filesize>0){
	fname = UploadSave.saveFile(fileItem,upDir);
} else {
	fname = "member.jpg";
}

dto.setFname(fname);
System.out.println("file name : " +fname);

boolean flag = dao.create(dto);

System.out.println("회원가입결과 : " +flag);
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
     <h1>회원가입을 축하드립니다 !</h1>
     <p>Thank you for join us :)</p>
    <%} else{ %>
     <h1>회원가입 실패. 다시 한번 시도해 주세요</h1>
     <p>Plz try again</p>
    <%} %>
   
    <hr>
    
 
    <div class="clearfix">
      <button type="button" class="loginbtn" onclick="location.href='loginForm.jsp'">Login</button>
      <button type="button" class="homebtn" onclick="location.href='../home.jsp'">Home</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>