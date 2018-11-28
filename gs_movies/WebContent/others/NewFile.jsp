<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
 <%@ include file = "../common/navbar.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script> 
$(document).ready(function(){
    $("#userPic").click(function(){
    	alert("왜도대체");
    	$("#uploadFile").click();
    });
});
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
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Login Form</h3>
  </div>  

     


	  <div class="imgcontainer">
	    <img id="userPic" src="./img/img_avatar.png">
	    <input type="file" id="uploadFile" name ="fname" onchange="getThumbnailPreview(this, 'userPic')"/>
	  
	  </div>
	  
	  <div class="textcontainer"><h4>사진을 등록해주세요 !</h4></div>


  
  
</body>
</html> 