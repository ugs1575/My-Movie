<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="ntdao" class="notice.NoticeDAO"/>
<jsp:useBean id="ntdto" class="notice.NoticeDTO"/>



<%


ntdto.setNttitle(request.getParameter("nttitle"));
ntdto.setNtcontent(request.getParameter("ntcontent"));

boolean flag = ntdao.create(ntdto);

System.out.println("notice 글등록 결과 : " +flag);
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

/* Add padding to container elements */
.container {
    padding: 16px;
    margin: auto;
    margin-bottom: 8%;
	width: 50%;
    
}

#againbtn, #homebtn {
    width: auto;
    padding: 10px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
}

#againbtn:hover, #homebtn:hover{
	opacity: 0.8;
}
</style> 

<body>

  <div class="container" >
  <%if(flag){%>
     <h2>Notice 게시판 새 글 등록이 완료되었습니다. 감사합니다.</h2>
     <%}else{%>
     <h2>Notice 게시판 새 글 등록이 실패하였습니다. 다시 한번 시도해주세요.</h2>
  	 <%} %>
   
    <hr>
    
 
     <div>
    <%if(flag==false){ %>
     <button type="button" id="againbtn" onclick="history.back()">다시시도</button>
     <%} %>
      <button type="button" id="homebtn" onclick="location.href='notice_list.jsp'" style="float:right">공지 목록</button>
    </div>
  </div>

</body>
  
  
  
   


<%-- <%@ include file = "../common/footer.jsp" %> --%>