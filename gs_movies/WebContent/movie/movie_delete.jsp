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


/* black content box */
out.println("<div style='width:1300px; height:730px; margin-left:auto; margin-right:auto; margin-top:40px; margin-bottom:20px; background-color:rgba(0,0,0,0.8);' class='w3-display-container'>");


/* mini content box */
out.println("<div style='width:900px; height:730px; margin:auto; border:1px solid white;'>");

/* content */
out.println("<div style='width:300px; height:330px; margin-left:auto; margin-right:auto; margin-top:200px; margin-bottom:50px; border:1px solid white; color:white; text-align:center; padding: 120px 0; '> 정말로 삭제하시겠습니까 ?");
out.println("<br><br><button type='button' onclick='sendDP("+no+")' style='width:50px; height:30px; background-color:transparent; border:1px solid white;'>Yes</button>");
out.println("<button type='button' onclick='sendR("+no+")' style='width:50px; height:30px; background-color:transparent; border:1px solid white;'>Back</button><div>");

/* mini content box close tag */
out.println("</div>");

/* close button at the top right corner */
out.println("<span class='w3-button w3-transparent w3-xlarge w3-display-topright' style='color:white' onClick=\"modal01.style.display=\'none\'\">&times;</span>");

/* black content box close tag */
out.println("</div>");

%>
