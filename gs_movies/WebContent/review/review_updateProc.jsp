<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>
<!--   Sign-up Section -->
<style>

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
    margin-bottom: 8%;
	width: 50%;
    
}

#homebtn, #loginbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#homebtn:hover, #loginbtn:hover{
	opacity: 0.8;
}
</style> 

<%
request.setCharacterEncoding("utf-8");

System.out.println(request.getParameter("rtitle"));
System.out.println(request.getParameter("rcontent"));
System.out.println(request.getParameter("passwd"));
System.out.println(request.getParameter("rate"));
System.out.println(request.getParameter("rno"));
//form의 값 받기
dto.setRtitle(request.getParameter("rtitle"));
dto.setRcontent(request.getParameter("rcontent"));
dto.setPasswd(request.getParameter("passwd"));
dto.setRate(Integer.parseInt(request.getParameter("rate")));

//hidden 값 받기
dto.setRno(Integer.parseInt(request.getParameter("rno")));
System.out.println("!!!!!!!!!!!!!!"+ dto.getRno());
String col = request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");

boolean flag = dao.update(dto);


System.out.println("review 글수정 결과 : " +flag);
%>
<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>영화 리뷰</b></span><br></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px"></div>
<div class="w3-container w3-padding-32" id="projects">
</div>
  

<script type="text/javascript">
function rlist(){
	var url = "review_list.jsp";
	url = url + "?col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	location.href = url;
}
</script>
<body>

  <div class="container">
  <%if(flag){%>
     <h2>리뷰 게시판 새 글 수정이 완료되었습니다. 감사합니다.</h2>
     <%}else{%>
     <h2>리뷰 게시판 새 글 수정이 실패하였습니다. 다시 한번 시도해주세요.</h2>
  	 <%} %>
   
    <hr>
    
 
    <div>
    <%if(flag==false){ %>
      <button type="button" id="loginbtn" onclick="history.back()">다시시도</button>
       	<%} %>
      <button type="button" id="homebtn" onclick="rlist()" style="float:right">리뷰 목록</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>


