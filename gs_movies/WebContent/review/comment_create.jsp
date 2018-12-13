<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="rcdao" class="comment.CommentDAO"/>
<jsp:useBean id="rcdto" class="comment.CommentDTO"/>
<%
rcdto.setRccontent(request.getParameter("rccontent"));
rcdto.setId(request.getParameter("id"));
rcdto.setRno(Integer.parseInt(request.getParameter("rno")));

boolean flag = rcdao.create(rcdto);

System.out.println("review 댓글 등록 결과 : " +flag);

%> 

<jsp:forward page="/review/review_read.jsp"/>
<%
return;
%>