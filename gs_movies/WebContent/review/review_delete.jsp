<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%
	int rno = Integer.parseInt(request.getParameter("rno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
%>
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>영화 리뷰</b></span><br> </h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  
<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
	width: 50%;
	margin-bottom: 8%;
    
}

#submit, #cancel {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#submit:hover, #cancel:hover{
	opacity: 0.8;
}
</style>
<script type="text/javascript">
function inputCheck(f){
	alert("inputcheck 실행");

	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
}
	
</script>	
<body>
<FORM name='frm' method='POST' action='./review_deleteProc.jsp' onsubmit="return inputCheck(this)">
<input type="hidden" name="rno" value="<%=rno %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <div class="container">
 	<h3>글을 삭제하시면 복구가 불가능합니다.<br> 
 	비밀번호를 입력해 주세요</h3>
	<input type="password" name="passwd">   
    <hr>
    
 
    <div>
      <input type='submit' id='submit' value='후기 삭제하기'>
      <input type='button' id='cancel' value='후기 삭제취소' onclick="history.back()"  style="float:right">
    </div>
  </div>
 </FORM>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>