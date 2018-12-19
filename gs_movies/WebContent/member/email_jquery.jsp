<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
String email = request.getParameter("email");
boolean flag = dao.duplicateEmail(email);

if(flag){
out.print("중복되는 e-mail 입니다. 다시 시도해 주세요 !");
}else{
out.print("사용 가능한 e-mail 입니다");
}

%>