<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head> <title> [three.jsp]</title>

</head>
<body>
   <font size="7"> <b> [three.jsp] </b> </font> <p>
   
   <font size=7>
   <b>
   <%
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 M월 d일 a h시 m분");  
     Date dt = new Date( );
     String nalja=sdf.format(dt);
     //out.println(nalja +"<br>");
     
     Calendar cal = Calendar.getInstance();
     int y=cal.YEAR;
     int m=cal.MONTH;
     int d=cal.DAY_OF_MONTH;
     String msg=cal.get(y) + "년-" + (cal.get(m)+1) + "월-" + cal.get(d) +"일"  ;
     //out.println(msg + "<br>");
   %>
   Date클래스 <%= nalja %> <br>
   Cal클래스  <%= msg %> <br>
   
   <p><hr color=red>
   	<ul>
   	    <li>녹차스무디</li>
   		<li>카푸치노</li>
   		<li>아이스라떼</li>
   		<li>아메리카노</li>
   		<li>모카라떼</li>
   	</ul> 
   	
   </b>	
   </font> 
</body>
</html>










