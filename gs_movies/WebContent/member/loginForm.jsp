<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>
body {
font-family: Arial, Helvetica, sans-serif;
}


form {
border: 3px solid #f1f1f1;
width: 50%;
height: 100%;
margin: auto;
margin-bottom: 8%

}

input[type=text]{
	width: 60%;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid grey;
}

#infocontainer{
 	 padding: 70px 70px 70px 70px;
 	text-align:center;
 	
}

.container {
    padding: 16px;
    width:100%;
    background-color:#f1f1f1;
    
}


#nextbtn:hover, #homebtn:hover{
	opacity: 0.8;
}

#loginbtn,#homebtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

</style>



<script type="text/javascript">
 function inputCheck(f){
	alert("inputcheck 실행");
	
	if(f.id.value==""){
		alert("아이디를 입력해 주세요");
		f.id.focus();
		return false;
	}
	
	if(f.pwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.pwd.focus();
		return false;
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
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Login</b></span><br> <span class="w3-hide-small w3-text-light-grey">로그인 부탁드립니다</span></h1>
  </div>
</header>

<body>

 <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Login From</h3>
  </div>  


<form name='frm' id='frm' method='POST' action='./loginProc.jsp' onsubmit="return inputCheck(this)">
<div class="w3-row">
	<div class="w3-col l12" id="infocontainer">
	  <p>
	  <label for="id">ID</label><br>
	  <input type="text" name="id"><br>
	  </p>
	  
	  <p>
	  <label for="pwd">Password</label><br>
	  <input type="text" name="psw">
	  </p>
	  
	</div>
	  
	
</div>
	

  <div class="container">
 	<input type="submit" value="Login" id="loginbtn" style="float:right">
 	<input type="button" value="취소" id="homebtn" onclick="history.back()">
  </div>

 
</form>

</body>
</html>
