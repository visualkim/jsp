<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
<html>
<head> <title> [guestEdit.jsp]</title>
  <style type="text/css">
    th,td{ font-size:24pt; font-weight:bold; }
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body>
   <font size="7">  [guestEdit.jsp]  </font> <p>   
   <%
   	int data = Integer.parseInt( request.getParameter( "idx" ));
   	msg = "select * from guest where sabun = " + data;
   	ST = CN.createStatement();
   	RS = ST.executeQuery( msg );
   	RS.next();	//if생략가능
   	Gsabun = RS.getInt( "sabun" );
   	Gname = RS.getString( "name" );
   	Gtitle = RS.getString( "title" );
   	Gpay = RS.getInt( "pay" );
   	
   %>
   <form  method="post" action="guestEditSave.jsp" >
    <b>사번:</b> <input type="text" name="sabun" value = "<%= Gsabun %>" readonly> <br>
    <b>이름:</b> <input type="text" name="name" value = "<%= Gname %>"> <br>
    <b>제목:</b> <input type="text" name="title" value="<%= Gtitle %>"> <br>
    <b>급여:</b> <input type="text" name="pay" value="<%= Gpay %>"> <p>
    
    <input type="submit" value="방명록수정">  &nbsp;
    <input type="reset"  value="수정취소">
   </form>
   
   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













