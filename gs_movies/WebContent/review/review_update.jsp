<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>
<%
	int rno = Integer.parseInt(request.getParameter("rno"));
	dto = dao.read(rno);
%>
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
   CKEDITOR.replace('content');
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
	
	if(f.rcontent.value==""){
		alert("내용 입력해 주세요");
		f.rcontent.focus();
		return false;
	}
	
	if(f.rate.value==""){
		alert("평점을 선택해 주세요");
		f.rate.focus();
		return false;
	}
	
	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	
	if(f.passwd.value!="" && f.passwd.value!=<%=dto.getPasswd()%>){
		alert("비밀번호가 맞지 않습니다. 다시 입력해 주세요");
		f.passwd.focus();
		return false;
	} 
	
	
	
	

}
</script>

</head>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>Reviews</b></span><br> <span class="w3-hide-small w3-text-light-grey">Introduction & brief story of review</span></h1>
  </div>
</header>

<body>  
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<!-- Movies Section -->
<div class="w3-container w3-padding-32" id="projects">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Reviews 글 수정</h3>
</div>

<div class="container">
 
<FORM name='frm' method='POST' action='./review_updateProc.jsp' onsubmit="return inputCheck(this)">
<input type="hidden" name="rno" value="<%=rno %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <TABLE class="table table-hover">
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="rtitle" value=<%=dto.getRtitle() %>></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD colspan="2"><textarea rows="10" cols="45" name="rcontent"><%=dto.getRcontent() %></textarea></TD>
    </TR>
    <TR>
      <TH>영화 평점 (만점 : 5점)</TH>
      <TD>
      <select name="rate">
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
	  </select>
	   <script type="text/javascript">
	 document.frm.rate.value="<%=dto.getRate()%>";
	</script>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="text" name="passwd"></TD>
    </TR>
   
  </TABLE>
  
  <div class='bottom'>
    <input type='submit' value='후기 수정하기'>
    <input type='button' value='후기 수정취소' onclick="history.back()">
  </DIV>
</FORM>
</div>

 
<!-- End page content -->
</div>  
</body>
</html>  

<%-- <%@ include file = "../common/footer.jsp" %> --%>