<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [guestDeleteSave.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body> 
 <%
    //guestDeleteSave.jsp문서 단독실행하면 에러발생함
    request.setCharacterEncoding("UTF-8");//한글 안깨짐
      
 try{    
	 //guestDetail.jsp문서에서 삭제버튼 [a삭제] 넘기는 idx받기
// 	 String data = request.getParameter("idx");
	 int data = Integer.parseInt( request.getParameter( "idx" ));
// 	 msg="delete from guest where sabun=사번데이타" ;
	 msg="delete from guest where sabun = ?" ;
	 
	 PST = CN.prepareStatement( msg );
	 PST.setInt( 1, data );
	 PST.executeUpdate();	//executeUpdate(X매개인자 없음)
	 
	 
     System.out.println( data + "사번삭제 성공" );
     response.sendRedirect("guestList.jsp");  
  }catch(Exception ex){System.out.println("사번 삭제실패:" + ex ); }
 %>

   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













