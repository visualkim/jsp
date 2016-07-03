<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"  %>

<html>
<head> <title>[ssi.jsp]</title>

</head>
<body>
   <!-- <font size="7"> <b> [ssi.jsp] </b> </font> <p> -->
   <%!
   	   Connection CN; 				//DB서버정보기억, 명령어생성		CN=DriverManager.getConnection(1,2,3);
   	   Statement ST; 					//static정적명령어 생성 			ST=CN.createStatement(X)
   	   PreparedStatement PST; //precomplied SQL명령어 			PST=CN.prepareStatement(msg);
   	   ResultSet RS; 					//조회한결과를 기억하는 개체 	RS=ST.executeQuery(msg);
   	   String msg;						//insert, update, delete, select
   	   int Gsabun, Gtotal, Gpay;
   	   String Gname, Gtitle;
   %>
   
   <%
     /* SimpleDateFormat sdf=new SimpleDateFormat("yyyy년-MM월-dd일");  
     java.util.Date dt = new java.util.Date( );
     Calendar cal = Calendar.getInstance(); */
     
     try {
    	 Class.forName( "oracle.jdbc.driver.OracleDriver" );	// 오라클 드라이브 연결
    	 String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
    	 CN = DriverManager.getConnection( url, "system", "oracle" );
    	 System.out.println( "DB연결 성공" );
     } catch(Exception ex) {
    	 System.out.println("에러=" + ex );
     }
   %>
      
</body>
</html>










