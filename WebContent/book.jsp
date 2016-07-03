<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head> <title> [book.jsp]</title>

</head>
<body>
   <font size="7"> <b> [book.jsp] </b> </font> <p>
   <%
   	 int dan=3;
     for(int i=1; i<10; i++){ 
      out.println("<font size=7>"+dan+"*"+i+"="+(dan*i)+"</font><br>");         
      if(i==5)break;
     }
   %>
   
   <img src="images/bar.gif">   
</body>
</html>










