<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [guestSave.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body>
   <font size="7" color=blue>  [guestSave.jsp]  </font> <p>
   <%
     //guestSave.jsp문서 단독실행하면 에러발생함
     request.setCharacterEncoding("UTF-8");//한글 안깨짐
   
     int a=Integer.parseInt(request.getParameter("sabun"));
     String b=request.getParameter("name");
     String c=request.getParameter("title");
     int d=Integer.parseInt(request.getParameter("pay"));
     
     try{    
//       	msg="insert into guest values("+a+",'"+ b+"','"+c+"',sysdate,"+d+")" ; 
//      	ST=CN.createStatement();
//       	ST.executeUpdate(msg);
				msg = "insert into guest values( ?, ?, ?, sysdate. ? )";
				PST = CN.prepareStatement( msg );
				
				PST.setInt(1, a);
				PST.setString(2, b);
				PST.setString(3, c);
				PST.setInt(4, d);
				
				PST.executeUpdate();	//PST.executeUpdate(X)

      System.out.println("저장성공성공" );
      response.sendRedirect("guestList.jsp");  
     }catch(Exception ex){System.out.println("저장실패:" + ex ); }
   %>

   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













