<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
 // utf-8은 모든 브러우저를 지원합니다.
request.setCharacterEncoding("utf-8");
 
int no = Integer.parseInt(request.getParameter("no"));

dto = dao.read(no);
String img_src = "./storage/"+dto.getMainPoster(); 
System.out.println("img_src:"+img_src);

/* edit & delete button */
out.println("<button class='w3-button w3-transparent w3-xlarge w3-right' onclick='mupdate("+no+")'>");
out.println("<span id='readspan' class='glyphicon glyphicon-edit'></span>");
out.println("</button>");
out.println("<button class='w3-button w3-transparent w3-xlarge w3-right' onclick='mdel("+no+")'>");
out.println("<span id='readspan' class='glyphicon glyphicon-trash'></span>");
out.println("</button>");

/* black content box */
out.println("<div id='blackbox' class='w3-display-container'>");

/* close button at the top right corner */
out.println("<span class='w3-button w3-transparent w3-xlarge w3-display-topright' onClick=\"modal01.style.display=\'none\'\">&times;</span>");

/* mini content box */
out.println("<div id='minibox'>");

/* form */
out.println("<form>");

/* table */
out.println("<table>");

/* image area */
out.println("<tr>");
out.println("<td rowspan='7'>");
out.println("<img id='readimg' src='"+img_src+"'>");
out.println("</td>");

/* movie info */
out.println("<td>");
out.println("Title");
out.println("</td>");
out.println("<td>");
out.println(dto.getTitle());
out.println("</td></tr>");

out.println("<tr><td>");
out.println("Genre");
out.println("</td>");
out.println("<td>");
out.println(dto.getGenre());
out.println("</td></tr>");


out.println("<tr><td>");
out.println("Ryear");
out.println("</td>");
out.println("<td>");
out.println(dto.getRyear());
out.println("</td></tr>");

out.println("<tr><td>");
out.println("director");
out.println("</td>");
out.println("<td>");
out.println(dto.getDirector());
out.println("</td></tr>");

out.println("<tr><td>");
out.println("Country");
out.println("</td>");
out.println("<td>");
out.println(dto.getCountry());
out.println("</td></tr>");

out.println("<tr><td>");
out.println("관람등급");
out.println("</td>");
out.println("<td>");
out.println(dto.getViewLevel());
out.println("</td></tr>");

out.println("<tr><td>");
out.println("관객수");
out.println("</td>");
out.println("<td>");
out.println(dto.getViewer());
out.println("</td></tr>");

/* content */
out.println("<tr style='height:370px'>");
out.println("<td colspan='3'>");
out.println("Content:"+dto.getContent()); 
out.println("</td></tr>");


/* close table */
out.println("</table>");

/* close form */
out.println("</form>");

/* mini content box close tag */
out.println("</div>");


/* black content box close tag */
out.println("</div>");
%>

