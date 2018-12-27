<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="mdao" class="member.MemberDAO"/>
<jsp:useBean id="mdto" class="member.MemberDTO"/>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%
String mypage_id = (String)session.getAttribute("id");
String mypage_grade=(String)session.getAttribute("grade");
mdto = mdao.read(mypage_id);
%>

<style>
body {
font-family: Arial, Helvetica, sans-serif;
}


form {
border: 3px solid #f1f1f1;
width: 70%;
height: 100%;
margin: auto;
margin-bottom: 8%

}

input[type=text]{
	width: 100%;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid grey;
}

#infocontainer{
 	 padding: 40px;
}

#imgcontainer{
	padding-top: 60px; 
	padding-bottom: 60px;
 	height: 430px;
}


#userPic {
    width: 80%;
    border-radius: 50%;
}

.container {
    padding: 16px;
    background-color:#f1f1f1;
}


#nextbtn:hover {
	opacity: 0.8;
}

#nextbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    margin-left: 88%;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

</style>



<script type="text/javascript">
 function inputCheck(f){
	alert("inputcheck 실행");
	
	if(f.id.value!="" && f.pwd.value!="" && f.name.value!="" && f.email.value!=""){
		alert("duplicate 실행");
		var send = valid(duplicateId(f.id.value),duplicateEmail(f.email.value));
		return send;
	}
	
	if(f.id.value==""){
		alert("아이디를 입력해 주세요");
		f.id.focus();
		return false;
	}
	
	if(f.pwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.pwd.focus();
		return false;
	}else if(f.pwd.value!=""){
		alert("비번 길이");
		alert(f.pwd.value.length);
	}

	if(f.name.value==""){
		alert("이름을 입력해 주세요");
		f.name.focus();
		return false;
	}
	if(f.email.value==""){
		alert("이메일을 입력해 주세요");
		f.email.focus();
		return false;
	}

}

</script>
</head>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Sign-up</b></span><br> <span class="w3-hide-small w3-text-light-grey">Introduction & brief story of Movie</span></h1>
  </div>
</header>

<body>

 <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Sign-up Form</h3>
  </div>  


<form name='frm' id='frm' method='POST' enctype="multipart/form-data" action='./signupProc.jsp' onsubmit="return inputCheck(this)">
<div class="w3-row">
	<div class="w3-col l8" id="infocontainer">
	  <p>
	  <label for="id">ID</label><br>
	  <span><%=mypage_id %></span><br>
	  <span id="checkId"></span>
	  </p>
	  
	  
	  <p>
	  <label for="name">Name</label><br>
	  <span><%=mdto.getName() %></span><br>
	  </p>
	  
	  <p>
	  <label for="email">Email</label><br>
	  <span><%=mdto.getEmail() %></span>
	  </p>
	  
	</div>
	  
	  
	<div class="w3-col l4 w3-center">
		<div id="imgcontainer">
	    <img id="userPic" src="../member/storage/<%=mdto.getFname() %>">
	   	</div>
	</div>
</div>
	

  <div class="container">
 	<input type="submit" value="Next" id="nextbtn">
  </div>

 
</form>

</body>
</html>
