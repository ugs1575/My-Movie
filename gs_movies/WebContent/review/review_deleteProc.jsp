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
	String passwd = request.getParameter("passwd");
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	
	
	Map map = new HashMap();
	map.put("rno",rno);
	map.put("passwd",passwd);
	
	boolean pflag = dao.passCheck(map);
	boolean flag = false;
	if(pflag){
		flag= dao.delete(rno);
	}
	

System.out.println("review 글 삭제 결과 : " +flag);
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

/
/* Add padding to container elements */
.container {
    padding: 16px;
}



</style>
<script type="text/javascript">
function rlist(){
	var url ="review_list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href = url;
	}
</script>	
<body>

  <div class="content">
<%
	if(pflag==false){
		out.print("패스워드 불일지");
	} else if(flag){
		out.print("글을 삭제했습니다.");
	} else{
		out.print("글삭제를 실패했습니다.");
	}

%>

</div>
<% if(pflag==false || flag==false){ %>
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="rlist()">
  </DIV>
<%}else{ %>
<DIV class='bottom'>
    <input type='button' value='목록' onclick="rlist()">
</DIV>
<%} %>
    
 
    

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>