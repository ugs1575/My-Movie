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
String title = request.getParameter("title");

dto = dao.read(no);
String img_src = "../movie/img/"+dto.getMainPoster(); 
System.out.println("img_src:"+img_src);

/* save button */
out.println("<button class='w3-button w3-transparent w3-xlarge w3-right' style='color:white; display:inline-block;' onclick='sendUP(updatedF)'>");
out.println("<span class='glyphicon glyphicon-ok' style='color:white; float:right; font-size:40px;'></span>");
out.println("</button>");

/* black content box */
out.println("<div style='width:1300px; height:730px; margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; background-color:rgba(0,0,0,0.8);' class='w3-display-container'>");


/* mini content box */
out.println("<div style='width:900px; height:730px; margin:auto; border:1px solid white;'>");

/* form */
out.println("<FORM name='updatedF'>");
out.println("<input type='hidden' name='no' value='"+no+"'>");
out.println("<input type='hidden' name='mainPoster' value='"+img_src+"'>");


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
out.println("<td style='border:1px solid white'><input style='background-color:transparent; border:none;' type='text' name='title' value='"+dto.getTitle()+"'>");
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
out.println("<td style='border:1px solid white'><input style='background-color:transparent; border:none;' type='text' name='ryear' value='"+dto.getRyear()+"'>");
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("director");
out.println("</td>");
out.println("<td style='border:1px solid white'><input style='background-color:transparent; border:none;' type='text' name='director' value='"+dto.getDirector()+"'>");
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("Country");
out.println("</td>");
out.println("<td style='border:1px solid white'><input style='background-color:transparent; border:none;' type='text' name='country' value='"+dto.getCountry()+"'>");
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("관람등급");
out.println("</td>");
out.println("<td style='border:1px solid white'><input style='background-color:transparent; border:none;' type='text' name='viewlevel' value='"+dto.getViewLevel()+"'>");
out.println("</td></tr>");

out.println("<tr><td style=' border:1px solid white;'>");
out.println("관객수");
out.println("</td>");
out.println("<td style=' border:1px solid white;'>");
out.println(dto.getViewer());
out.println("</td></tr>");

/* content */
out.println("<tr style='height:370px; border:1px solid white;'>");
out.println("<td colspan='3' style='border:1px solid white;'><input style='background-color:transparent; border:none;' type='text' name='content' value='"+dto.getContent()+"'>");
out.println("</td></tr>");


/* close table */
out.println("</table>");

/* close form */
out.println("</form>");

/* mini content box close tag */
out.println("</div>");

/* close button at the top right corner */
out.println("<span class='w3-button w3-transparent w3-xlarge w3-display-topright' style='color:white' onClick=\"modal01.style.display=\'none\'\">&times;</span>");

/* black content box close tag */
out.println("</div>");

%>
