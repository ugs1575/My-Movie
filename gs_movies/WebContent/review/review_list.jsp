<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../ssi/ssi.jsp" %>
<%@ include file = "../common/navbar.jsp" %>
<jsp:useBean id="dao" class="review.ReviewDAO"/>
<jsp:useBean id="dto" class="review.ReviewDTO"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>




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

List<ReviewDTO> list = dao.list(map);
//전체 레코드 개수(col, word)
int totalRecord = dao.total(map);
%>

<script type="text/javascript" src="./httpRequest.js"></script>
<script type="text/javascript">

function read(rno){
	var url = "review_read.jsp";
	url = url + "?rno="+rno;
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
    <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>영화 리뷰</b></span><br> </h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Movies Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Review List</h3>
    
    <div class="search w3-display-bottomright" style="padding:20px 50px">
		<form method="post" action="./review_list.jsp">
			<select name="col">
				<option value="writer"
					<%if (col.equals("writer")) {
				out.print("selected"); // 내가 선택한 분류? 가 고정되어있도록..?
			}%>>작성자</option>
				<option value="rtitle"
					<%if (col.equals("rtitle")) {
				out.print("selected");
			}%>>제목</option>
				<option value="rcontent"
					<%if (col.equals("rcontent")) {
				out.print("selected");
			}%>>내용</option>
				<option value="total">전체출력</option>
			</select>
			<input type="text" name="word" value="<%=word%>" style="border:1px solid #CCCCCC">
			 <button type="submit" class="btn btn-default btn-sm">
          		<span class="glyphicon glyphicon-search"></span> Search 
        	</button>
		</form>
	</div>
    
    
  </div>
  
  
  
  <TABLE class="w3-table w3-hoverable" style="width:70%; margin:auto;">
			<thead>
				<TR>
					<TH>번호</TH>
					<TH>제목</TH>
					<TH>성명</TH>
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
						dto = list.get(i);
			%>
			<tbody>
				<tr>
					<td><%=dto.getRno()%></td>
					<td>
						<a href="javascript:read('<%=dto.getRno()%>')"><%=dto.getRtitle()%></a>
						<%
							if (utility.compareDay(dto.getRdate())) {
										out.print("<img src = '../menu/images/me.jpg'>");
									}
						%>
					</td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getViewcnt()%></td>
					<td><%=dto.getRdate()%></td>
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
    <%=utility.review_paging(totalRecord, nowPage, recordPerPage, col, word)%>
    </div>
  

<%-- <%@ include file = "../common/footer.jsp" %> --%>