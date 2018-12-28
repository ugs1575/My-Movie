<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="mdao" class="member.MemberDAO"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/>

<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
    margin-bottom: 8%;
	width: 50%;
    
}

#homebtn, #againbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #agianbtn:hover{
	opacity: 0.8;
}
</style>


<%
String tempDir = application.getRealPath("/member/temp");
String upDir = application.getRealPath("/member/storage");

UploadSave upload = new UploadSave(request, -1, -1, tempDir);

mdto.setId(upload.getParameter("id"));
mdto.setName(UploadSave.encode(upload.getParameter("name")));
mdto.setEmail(upload.getParameter("email"));
mdto.setPsw(upload.getParameter("pwd"));

FileItem fileItem = upload.getFileItem("fname");

int filesize = (int) fileItem.getSize();

System.out.println("filesize:>>>>>>>>>>>>"+filesize);

String fname = null;

if(filesize>0){
	fname = UploadSave.saveFile(fileItem,upDir);
} else {
	fname = "member.jpg";
}

mdto.setFname(fname);
System.out.println("file name : " +fname);

boolean flag = mdao.create(mdto);

System.out.println("회원가입결과 : " +flag);
%>
 
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Sign-up 결과</b></span><br></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  

<body>

  <div class="container">
  <%if(flag){%>
     <h1>회원가입을 축하드립니다 !</h1>
     <p>Thank you for join us :)</p>
    <%} else{ %>
     <h1>회원가입 실패. 다시 한번 시도해 주세요</h1>
     <p>Plz try again</p>
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
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>