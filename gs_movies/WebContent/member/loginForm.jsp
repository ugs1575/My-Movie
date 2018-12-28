<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>

form {

margin: auto;
}

input[type=text]{
	width:40%;
    margin: 8px 0;
    box-sizing: border-box;
    border: none;
    border-bottom: 2px solid grey;
}

#infocontainer{
 	padding: 70px 70px 70px 70px;
 	text-align:center;
 	
}


#loginbtn:hover{
	opacity: 0.8;
}

#loginbtn{
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

.container{
width:80%; 
height:70%; 
border: 1px solid black;
margin: auto;
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
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Login</b></span><br></h1>
  </div>
</header>

<body>

 <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Login From</h3>
  </div>  

<form name='frm' id='frm' method='POST' action='./loginProc.jsp' onsubmit="return inputCheck(this)">

	<div id="infocontainer">
	  <p>
	  <label for="id">ID</label><br>
	  <input type="text" name="id"><br>
	  </p>
	  
	  <p>
	  <label for="pwd">Password</label><br>
	  <input type="text" name="psw">
	  </p>
	  
 	<input type="submit" value="로그인" id="loginbtn">

 </div>
 
</form>

</body>
</html>
