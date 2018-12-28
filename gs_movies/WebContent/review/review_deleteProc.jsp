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

input[type=button] {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

input[type=button]:hover{
	opacity: 0.8;
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

<div class="container">
<%
	if(pflag==false){%>
		<h1>패스워드 불일치!</h1>
<%	} else if(flag){%>
		<h1>글을 삭제했습니다.</h1>
<%	} else{%>
		<h1>글삭제를 실패했습니다.</h1>
<%	}

%>
  <hr>

<% if(pflag==false || flag==false){ %>
  <DIV>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="rlist()" style="float:right">
  </DIV>
<%}else{ %>
<DIV>
    <input type='button' value='목록' onclick="rlist()" style="float:right">
</DIV>
<%} %>
    
 </div>
    

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>