<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="ntdao" class="notice.NoticeDAO"/>
<jsp:useBean id="ntdto" class="notice.NoticeDTO"/>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%
	int ntno = Integer.parseInt(request.getParameter("ntno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	boolean flag = ntdao.delete(ntno);


System.out.println("notice 글삭제 결과 : " +flag);
%>
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>공지</b></span><br></h1>
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

#homebtn, #againbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #againbtn:hover{
	opacity: 0.8;
}
</style>
<script type="text/javascript">
function nlist(){
	var url = "notice_list.jsp";
	url = url + "?col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	location.href = url;
}
</script>	
<body>

  <div class="container">
  <%if(flag){%>
     <h2>Notice 게시판 글 삭제가 완료되었습니다. 감사합니다.</h2>
     <%}else{%>
     <h2>Notice 게시판 글 삭제가 실패하였습니다. 다시 한번 시도해주세요.</h2>
  	 <%} %>
   
    <hr>
    
 
   <div>
  <%if(flag==false){ %>
  	<button type="button" id="againbtn" onclick="history.back()">다시시도</button>
  	<%} %>
      <button type="button" id="homebtn" onclick="nlist()" style="float:right">공지 목록</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>