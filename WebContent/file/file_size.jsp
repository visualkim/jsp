<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page import="web.tool.*" %>


<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<%
// /WebContent 폴더 기준으로 입력
String storage = application.getRealPath("/file/storage");
File file = new File(storage + "/" + "last.png");
%>
<p>절대 경로: <%=storage %></p>
<p>파일명: <%=file.getName() %></p>
<p>파일크기: <%=file.length() %></p>
<IMG src='./storage/<%=file.getName() %>'  width='60%'>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
