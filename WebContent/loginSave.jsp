<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [loginSave.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body> 
 <% 
 try{  
   String UID=request.getParameter("userid");
   String PWD=request.getParameter("pwd");
   
  msg="select count(*) as cnt from login where userid=? and pwd=?";
  PST=CN.prepareStatement(msg);
	 	PST.setString(1, UID); 	
	 	PST.setString(2, PWD);
  RS=PST.executeQuery();
  RS.next();
  Gtotal = RS.getInt("cnt");
  System.out.println("PST명령어 Gtotal=" + Gtotal);
  
  if( Gtotal > 0 ) {
	  session.setAttribute( "naver", UID );
	  //세션은 유지정보가 서버에 기록
	  //쿠키는 유지정보가 client에 기록
	  Cookie ck = new Cookie( "kb", UID );
	  ck.setMaxAge(45);	//45초 유지
	  response.addCookie(ck);
	 	response.sendRedirect( "index.jsp" );
	  
  } else {
	  %>
	  <script type="text/javascript">
	  	alert( "ID, 비밀번호 다시 입력하세요\n로그인문서로 이동하세요" );
	  	location.href="login.jsp";
	  </script>
	  <%
  }
  
   //msg="select count(*) as cnt from login where userid='"+UID+"' and pwd='"+PWD +"'" ;                
   //ST=CN.createStatement();
   //RS=ST.executeQuery(msg); 
   //RS.next(); Gtotal=RS.getInt("cnt");
   //System.out.println("ST명령어 Gtotal=" + Gtotal); 
  }catch(Exception ex){System.out.println("login실패:" + ex ); }
 %>

   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="login.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













