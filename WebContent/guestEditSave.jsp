<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [guestEditSave.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body> 
 <%
    //guestEditSave.jsp문서 단독실행하면 에러발생함
    request.setCharacterEncoding("UTF-8");//한글 안깨짐    
    
    //guestEdit.jsp문서에서 사번, 이름, 제목, 급여까지 데이터 받기
    int a=Integer.parseInt(request.getParameter("sabun"));
    String b=request.getParameter("name");
    String c=request.getParameter("title");
    int d=Integer.parseInt(request.getParameter("pay"));
 try{    	 
// 		msg="update guest set name='"+b+"', title='"+c+"', nalja=sysdate, pay="+d+" where sabun="+a+"" ; 	
     msg="update guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?" ; 
     PST = CN.prepareStatement( msg );
     PST.setString(1, b);
     PST.setString(2, c);
     PST.setInt(3, d);
     PST.setInt(4, a);
     PST.executeUpdate();
     
     System.out.println("PST수정수정성공" );
     response.sendRedirect("guestList.jsp");  
  }catch(Exception ex){System.out.println("PST수정실패:" + ex ); }
 %>
</body>
</html>













