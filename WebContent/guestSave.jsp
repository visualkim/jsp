<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [guestSaveCOPY.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body>
   <font size="7" color=blue>  [guestSaveCOPY.jsp]  </font> <p>  
   <%
     //guestSave.jsp문서 단독실행하면 에러발생함
     request.setCharacterEncoding("UTF-8");//한글 안깨짐
   
     
     try{
    	 int a=Integer.parseInt(request.getParameter("sabun"));
    	 msg = "select count(*) as cnt from guest where sabun = " + a;
    	 ST = CN.createStatement();
    	 RS = ST.executeQuery( msg );
    	 if( RS.next() == true ) {
    		 Gtotal = RS.getInt( "cnt" );
    	 }
    	 if( Gtotal > 0 ) {
    %>
    	<script type = "text/javascript">
    		alert( "<%= a %>" + " 사번 데이터는 이미 등록되었습니다." );
    		location.href="guest.jsp";
    	</script>
    <%
    	 } else {
		       String b=request.getParameter("name");
		       String c=request.getParameter("title");
		       int d=Integer.parseInt(request.getParameter("pay"));
       
//       msg="insert into guest values("+a+",'"+ b+"','"+c+"',sysdate,"+d+")" ; 
//       ST=CN.createStatement();
//       ST.executeUpdate(msg);
						msg="insert into guest values(?, ?, ?, sysdate, ?) " ;
			    	PST=CN.prepareStatement(msg);
			     	PST.setInt(1, a);
			     	PST.setString(2, b);
			     	PST.setString(3, c);
			     	PST.setInt(4, d);
			      PST.executeUpdate(); //executeUpdate(매개인자X)
			      System.out.println("저장성공성공" );
			      //response.sendRedirect("guestList.jsp");  
    		 }
     	}catch(Exception ex){System.out.println("저장실패:" + ex ); }
   %>

   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













