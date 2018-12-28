<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>


<%

dto.setRtitle(request.getParameter("rtitle"));
dto.setRcontent(request.getParameter("rcontent"));
dto.setRate(Integer.parseInt(request.getParameter("rate")));
dto.setPasswd(request.getParameter("passwd"));

dto.setWriter("user_default");

boolean flag = dao.create(dto);

System.out.println("review 글등록 결과 : " +flag);
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
<body>

  <div class="container">
  <%if(flag){%>
     <h2>리뷰 게시판 새 글 등록이 완료되었습니다. 감사합니다.</h2>
     <%}else{%>
     <h2>리뷰 게시판 새 글 등록이 실패하였습니다. 다시 한번 시도해주세요.</h2>
  	 <%} %>
   
    <hr>
    
 
    <div>
    <%if(flag==false){ %>
      <button type="button" id="agianbtn" onclick="location.href='loginForm.jsp'">Login</button>
       	<%} %>
      <button type="button" id="homebtn" onclick="location.href='review_list.jsp'" style="float:right">리뷰 목록</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>