<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="rdao" class="review.ReviewDAO"/>
<jsp:useBean id="rdto" class="review.ReviewDTO"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">

textarea {
   resize: none;
}

.bottom{
	text-align: center;
	padding: 2%;  
}

input[type=button], input[type=submit]{
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

input[type=button]:hover, input[type=submit]:hover {
	opacity: 0.8;
}


</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('rcontent');
  };
</script>
<script type="text/javascript">
function inputCheck(f){
	alert("inputcheck 실행");
	
	
	if(f.rtitle.value==""){
		alert("제목을 입력해 주세요");
		f.rtitle.focus();
		return false;
	}
	
	if(f.passwd.value==""){
		alert("패스워드를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	
	if(f.rcontent.value==""){
		alert("내용을 입력해 주세요");
		f.rcontent.focus();
		return false;
	}
	
	
	
	

}
</script>
</head>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>영화 리뷰</b></span><br></h1>
  </div>
</header>

<body>  
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<!-- Movies Section -->
<div class="w3-container w3-padding-32" id="projects">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Review 글 등록</h3>
</div>

<div class="container" style="width: 70%; margin:auto;">
 
<FORM name='frm' method='POST' action='./review_createProc.jsp' onsubmit="return inputCheck(this)">
  <TABLE class="w3-table w3-hoverable">
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="rtitle"></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD colspan="2"><textarea rows="10" cols="45" name="rcontent"></textarea></TD>
    </TR>
     <TR>
      <TH>평점</TH>
      <TD>
      <select name="rate">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
	  </select>
      </TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="text" name="passwd"></TD>
    </TR>
   
  </TABLE>
  
  <div class='bottom'>
    <input type='submit' value='등록하기'>
    <input type='button' value='등록취소' onclick="history.back()">
  </DIV>
</FORM>
</div>

 
<!-- End page content -->
</div>  
</body>
</html>  

<%-- <%@ include file = "../common/footer.jsp" %> --%>