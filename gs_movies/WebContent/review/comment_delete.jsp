<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="rcdao" class="comment.CommentDAO"/>
<jsp:useBean id="rcdto" class="comment.CommentDTO"/>

<%
int rno = Integer.parseInt(request.getParameter("rno"));
int nPage = Integer.parseInt(request.getParameter("nPage"));
int nowPage = Integer.parseInt(request.getParameter("nowPage"));
String col = request.getParameter("col");
String word = request.getParameter("word");

int total = rcdao.total(rno);//댓글전체레코드값을 가져와서
int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  

if(rcdao.delete(rno)){
	if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
	nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
	}
}

request.setAttribute("rno", rno);
request.setAttribute("nPage", nPage);
request.setAttribute("nowPage", nowPage);
request.setAttribute("col", col);
request.setAttribute("word", word);

%> 

<jsp:forward page="/review/review_read.jsp"/>





