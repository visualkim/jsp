<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<html>
<%
	String msg = "";
	Cookie cks[] = request.getCookies();
	if( cks != null ) {
		for( int i = 0; i < cks.length; i++ ) {
// 			String name = cks[i].getName();
// 			String value = cks[i].getValue();
			if(cks[i].getName().equals("daum")){
    		msg=cks[i].getValue(); 
    	 }
		}
	}
%>
<head> <title>[indexCopy.jsp]</title>
	<style type="text/css">
  * { font-family:D2Coding; }
    th,td{ font-size:12pt; font-weight:bold; } 
    b,input{ font-size:16pt; font-weight:bold; }
    a{text-decoration:none; font-size:18pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:18pt; font-weight:bold; }
  </style>
	<script type = "text/javascript">
		setTimeout( "location.href='guestList.jsp'", 2000 );
	</script>
</head>
<body>

 <div align="center"> 
  <img src="images/a1.png"> <p>
 
  <font size="7" color="blue">
  <b> 
  <%= msg %>님 반갑습니다.
    Loading...Waiting... 
  </b>
  </font> 
 </div>
 	
</body>
</html>





