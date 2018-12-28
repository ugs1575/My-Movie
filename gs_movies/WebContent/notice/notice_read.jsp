<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="ntdao" class="notice.NoticeDAO"/>
<jsp:useBean id="ntdto" class="notice.NoticeDTO"/>


<%
int ntno = Integer.parseInt(request.getParameter("ntno"));
ntdao.upViewcnt(ntno);
ntdto = ntdao.read(ntno);

String content = ntdto.getNtcontent();
content = content.replaceAll("\r\n","<br>");

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type ="text/javascript">

function ntlist(){
	var url = "notice_list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href=url;
}
function ntupdate(){
	var url = "notice_update.jsp";
	url = url + "?ntno=<%=ntno%>";
	url = url + "&col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	
	location.href=url;
}
function ntdel(){
	var r = confirm("정말 삭제하시겠습니까? 삭제하신 데이터는 복구되지 않습니다.");
    if (r == true) {
        var url = "notice_delete.jsp";
    	url = url + "?ntno="+<%=ntno%>;
    	url = url + "&col=<%=request.getParameter("col")%>"
    	url = url + "&word=<%=request.getParameter("word")%>"
    	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
    	
    	location.href=url;
    }
    
	
}


 
</script>
<style>
button{
    width: auto;
    padding: 8px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
    margin: 10px;
}
input[type=submit]{
    width: auto;
    padding: 8px 6px;
    background-color: white;
    color: black;
    cursor: pointer;
    border: 1px solid black;
    margin: 5px;
}

button:hover{
	opacity: 0.8;
}

</style>
</head>



<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>공지</b></span><br></h1>
  </div>
</header>

<body>  
<!-- Page content -->
<div class="w3-content w3-padding" style="width:70%; margin:auto;">

<!-- Movies Section -->
<div class="w3-container w3-padding-32 w3-center">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><%=ntdto.getNttitle() %></h3>
</div>

<div class="w3-container" style="width:100%; text-align:right;">
  <%=ntdto.getViewcnt() %>  |  <%=ntdto.getNtdate() %> 
</div>


<div class="w3-container w3-border w3-border-light-grey w3-padding-32" style="width:100%">
  <%= ntdto.getNtcontent() %> 
</div>


<DIV class='w3-container w3-center' style="width:100%; padding:5%; ">
    <button onclick="ntlist()">목록</button>
    <button onclick="ntupdate()">수정</button>
    <button onclick="ntdel()">삭제</button>
</DIV>


  


 
<!-- End page content -->
</div>
</body>
</html>  

<%-- <%@ include file = "../common/footer.jsp" %> --%>