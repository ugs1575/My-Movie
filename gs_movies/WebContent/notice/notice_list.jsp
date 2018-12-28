<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="ntdao" class="notice.NoticeDAO"/>
<jsp:useBean id="ntdto" class="notice.NoticeDTO"/>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>



<%
// 검색 관련 처리
String col = utility.checkNull(request.getParameter("col"));
String word = utility.checkNull(request.getParameter("word"));

if (col.equals("total")) {
	word = "";
}

//페이징 관련 처리

int nowPage = 1; // 외출
int recordPerPage = 15;

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage")); //위험함! numberformatException 가능성	
}

//DB에서 가져올 레코드의 순번
int sno = ((nowPage - 1) * recordPerPage) + 1; //공식임 ㅎ
int eno = nowPage * recordPerPage;

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

List<NoticeDTO> list = ntdao.list(map);
//전체 레코드 개수(col, word)
int totalRecord = ntdao.total(map);
%>

<script type="text/javascript" src="./httpRequest.js"></script>
<script type="text/javascript">

function read(ntno){
	var url = "notice_read.jsp";
	url = url + "?ntno="+ntno;
	url = url + "&col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	
	location.href=url;
}

</script>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px" id="home">
  <img class="w3-image" src="../movie/img/movielist_header.jpg" alt="Architecture" width="1500px" height="100px">
  <div class="w3-display-middle w3-margin-top w3-center">
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>공지</b></span></h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Notice 목록</h3>
    
    <div class="search w3-display-bottomright" style="padding:20px 50px">
		<form method="post" action="./notice_list.jsp">
			<select name="col">
				<option value="nttitle"
					<%if (col.equals("nttitle")) {
				out.print("selected");
			}%>>제목</option>
			</select>
			<input type="text" name="word" value="<%=word%>" style="border:1px solid #CCCCCC">
			 <button type="submit" class="btn btn-default btn-sm">
          		<span class="glyphicon glyphicon-search"></span> Search 
        	</button>
		</form>
	</div>
    
    
  </div>
  
  
  
  <TABLE class="w3-table w3-hoverable" style="width:80%; margin:auto;">
			<thead>
				<TR>
					<TH>번호</TH>
					<TH>제목</TH>
					<TH>조회수</TH>
					<TH>등록일</TH>
				</TR>
			</thead>
			<%
				if (list.size() == 0) {
			%>
			<tbody>
				<tr>
					<td colspan="5" style="text-align:center"><img src="../others/img/crying.gif" style="height:60%">
					<h3>등록된 글이 없습니다 ㅜ ㅜ</h3></td>
				</tr>
			</tbody>
			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						ntdto = list.get(i);
			%>
			<tbody>
				<tr>
					<td><%=ntdto.getNtno()%></td>
					<td>
						<a href="javascript:read('<%=ntdto.getNtno()%>')"><%=ntdto.getNttitle()%></a>
						<%
							if (utility.compareDay(ntdto.getNtdate())) {
										out.print("<img src = '../menu/images/me.jpg'>");
									}
						%>
					</td>
					<td><%=ntdto.getViewcnt()%></td>
					<td><%=ntdto.getNtdate()%></td>
				</tr>
			</tbody>
			<%
				}
				}
			%>
		</TABLE>
		
   
  <!-- End page content -->
</div>

   <!-- Pagination -->
   
	<div style="padding:3%">
    <%=utility.notice_paging(totalRecord, nowPage, recordPerPage, col, word)%>
    </div>
  

<%-- <%@ include file = "../common/footer.jsp" %> --%>