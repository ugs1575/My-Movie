<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>
<jsp:useBean id="rcdao" class="comment.CommentDAO"/>
<jsp:useBean id="rcdto" class="comment.CommentDTO"/>

<%
int rno = Integer.parseInt(request.getParameter("rno"));
dao.upViewcnt(rno);
dto = dao.read(rno);

String content = dto.getRcontent();
content = content.replaceAll("\r\n","<br>");


//댓글 페이징
//검색 관련 처리
String col = utility.checkNull(request.getParameter("col"));
String word = utility.checkNull(request.getParameter("word"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));

if (col.equals("total")) {
	word = "";
}

//페이징 관련 처리

/* 댓글 관련  시작 */
String url = "review_read.jsp";
int nPage= 1; //시작 페이지 번호는 1부터 
 
if (request.getParameter("nPage") != null) { 
nPage= Integer.parseInt(request.getParameter("nPage"));  
}
int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
 
int sno = ((nPage-1) * recordPerPage) + 1; // 
int eno = nPage * recordPerPage;
 
Map map = new HashMap();
map.put("sno", sno);
map.put("eno", eno);
map.put("rno", rno);
 
List<CommentDTO> list = rcdao.list(map);

 
int total = rcdao.total(rno);
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

function rlist(){
	var url = "review_list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href=url;
}
function rupdate(){
	var url = "review_update.jsp";
	url = url + "?rno=<%=rno%>";
	url = url + "&col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	
	location.href=url;
}
function rdel(){
	var url = "review_delete.jsp";
	url = url + "?rno=<%=rno%>";
	url = url + "&col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	
	location.href=url;
}

function cupdate(rcno,rccontent){
	alert("update실행");
var f = document.rform;
f.rccontent.value = rccontent;
f.rcno.value = rcno;
f.rsubmit.value="수정";
f.action="./comment_update.jsp" 
}
	
<%-- function cdelete(rcno){
if(confirm("정말삭제 하겠습니까?")){ 
var url = "./comment_delete.jsp";
url = url + "?rcno="+rcno;
url = url + "&rno="+<%=rno%>;
url = url + "&nowPage="+<%=nowPage%>;
url = url + "&nPage="+<%=nPage%>;
url = url + "&col="+<%=col%>;
url = url + "&word="+<%=word%>;
location.href=url; 
} --%>
 
</script>
<style>
button, #rsubmit{
    width: auto;
    padding: 8px 18px;
    background-color: #000000;
    color: white;
    cursor: pointer;
    border: 1px solid black;
    margin: 10px;
}

button:hover, #rsubmit:hover{
	opacity: 0.8;
}

.checked {
  color: orange;
}
</style>
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
<div class="w3-content w3-padding" style="width:70%; margin:auto;">

<!-- Movies Section -->
<div class="w3-container w3-padding-32 w3-center">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16"><%=dto.getRtitle() %></h3>
</div>

<div class="w3-container" style="width:100%; text-align:right;">
  <%=dto.getWriter() %>   |   <%=dto.getViewcnt() %>  |  <%=dto.getRdate() %> 
</div>


<div class="w3-container w3-border w3-border-light-grey w3-padding-32" style="width:100%">
  <%= dto.getRcontent() %> 
</div>

<div class="w3-container w3-border w3-border-light-grey w3-padding-16" style="width:100%; margin:10px 0px;">
관람 후 평점 : 
<%
int star = dto.getRate();
for(int i=0; i<5; i++){
	if(i<star){
%>
		<span class="fa fa-star checked"></span>
<%
}else{
%>
		<span class="fa fa-star"></span>
<%
	}
}
%>
</div>
<DIV class='w3-container w3-center' style="width:100%; padding:1px; ">
    <button onclick="rlist()">목록</button>
    <button onclick="rupdate()">수정</button>
    <button onclick="rdel()">삭제</button>
</DIV>


<%
 	for(int i=0; i<list.size(); i++){
 		rcdto = list.get(i);
%>
<%=rcdto.getRcno() %><br>
<%=rcdto.getRccontent() %><br>
<%=rcdto.getRcdate() %><br>
<span style="float: right;">
<script type="text/javascript">

</script>
<a href="javascript:cupdate(<%=rcdto.getRcno() %>,<%=rcdto.getRccontent() %>)">
 수정</a>|<%-- <a href="javascript:cdelete(<%=rcdto.getRcno() %>)">삭제</a> --%>
   </span>
<hr>
<% 
 	}
 	
%>
<div class='w3-container' style="width:100%; padding:1px 0px 50px 0px; ">
 	
<form name="rform" method='POST' action='./comment_create.jsp' >
 	<textarea rows="2" cols="28" name="rccontent" style="width: 90%" ></textarea>
 	<input type="submit" name="rsubmit" value="등록">
 	<input type="hidden" name="rno" value=<%=rno%>>
 	<input type="hidden" name="id" value="rc_user">
 	<input type="hidden" name="nowPage" value=<%=nowPage%>>
 	<input type="hidden" name="nPage" value=<%=nPage %>>
 	<input type="hidden" name="col" value=<%=col%>>
 	<input type="hidden" name="word" value=<%=word%>>
 	<input type="hidden" name="rcno" value="0"> 	
</form>

</div>
<div style="padding:3%">
<%=utility.cpaging(total, nPage, recordPerPage, url, rno, nowPage, col, word)%>
</div>
  


 
<!-- End page content -->
</div>
</body>
</html>  

<%-- <%@ include file = "../common/footer.jsp" %> --%>