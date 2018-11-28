<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
String id = request.getParameter("id");
boolean flag = dao.duplicateId(id);

if(flag){
out.print("중복되는 ID 입니다. 다시 시도해 주세요 !");
}else{
out.print("사용 가능한 ID 입니다");
}

%>

