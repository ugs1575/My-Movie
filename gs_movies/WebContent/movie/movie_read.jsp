<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="movie.MovieDAO"/>
<jsp:useBean id="dto" class="movie.MovieDTO"/>
 <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<%
 // utf-8은 모든 브러우저를 지원합니다.
request.setCharacterEncoding("utf-8");
 
int no = Integer.parseInt(request.getParameter("no"));

dto = dao.read(no);
String img_src = "../movie/img/"+dto.getMainPoster(); 
System.out.println("img_src:"+img_src);

/* edit & delete button */
out.println("<button class='w3-button w3-transparent w3-xlarge w3-right' style='color:white; display:inline-block; 'onclick='sendU("+no+")'>");
out.println("<span class='glyphicon glyphicon-edit' style='color:white; float:right; font-size:40px;'></span>");
out.println("</button>");
out.println("<button class='w3-button w3-transparent w3-xlarge w3-right' style='color:white; display:inline-block; 'onclick='sendD("+no+")'>");
out.println("<span class='glyphicon glyphicon-trash' style='color:white; float:right; font-size:40px;'></span>");
out.println("</button>");

/* black content box */
out.println("<div style='width:1300px; height:730px; margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; background-color:rgba(0,0,0,0.8);' class='w3-display-container'>");

/* close button at the top right corner */
out.println("<span class='w3-button w3-transparent w3-xlarge w3-display-topright' style='color:white' onClick=\"modal01.style.display=\'none\'\">&times;</span>");

/* mini content box */
out.println("<div style='width:900px; height:730px; margin:auto; border:1px solid white;'>");

/* form */
out.println("<FORM name='readTable'>");
out.println("<input type='hidden' name='no' value='"+no+"'>");


/* table */
out.println("<table style='width:700px; height:630px; margin-top:23px; margin-bottom:23px; margin-left:100px; margin-right:80px; color:white; border:1px solid white; text-align:center;'>");

/* image area */
out.println("<tr style='border:1px solid white;'>");
out.println("<td rowspan='7' style='border:1px solid white;'>");
out.println("<img style='max-width:350px; height:300px;'" );
out.println("src='"+img_src+"'>");
out.println("</td>");

/* movie info */
out.println("<td style='border:1px solid white;'>");
out.println("Title");
out.println("</td>");
out.println("<td style='border:1px solid white;'>");
out.println(dto.getTitle());
out.println("</td></tr>");

out.println("<td style='border:1px solid white;'>");
out.println("Genre");
out.println("</td>");
out.println("<td style='border:1px solid white;'>");
out.println(dto.getGenre());
out.println("</td></tr>");


out.println("<tr><td style='border:1px solid white;'>");
out.println("Ryear");
out.println("</td>");
out.println("<td style='border:1px solid white;'>");
out.println(dto.getRyear());
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("director");
out.println("</td>");
out.println("<td style=' border:1px solid white;'>");
out.println(dto.getDirector());
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("Country");
out.println("</td>");
out.println("<td style=' border:1px solid white;'>");
out.println(dto.getCountry());
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("관람등급");
out.println("</td>");
out.println("<td style=' border:1px solid white;'>");
out.println(dto.getViewLevel());
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("관객수");
out.println("</td>");
out.println("<td style=' border:1px solid white;'>");
out.println(dto.getViewer());
out.println("</td></tr>");

/* content */
out.println("<tr style='height:370px; border:1px solid white;'>");
out.println("<td colspan='3' style=' border:1px solid white;'>");
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

