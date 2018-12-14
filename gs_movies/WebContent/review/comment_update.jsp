<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="rcdao" class="comment.CommentDAO"/>
<jsp:useBean id="rcdto" class="comment.CommentDTO"/>
<%
rcdto.setRccontent(request.getParameter("rccontent"));
rcdto.setRcno(Integer.parseInt(request.getParameter("rcno")));

boolean flag = rcdao.update(rcdto);

System.out.println("review 댓글 수정 결과 : " +flag);

%> 

<jsp:forward page="/review/review_read.jsp"/>
<%
return;
%>