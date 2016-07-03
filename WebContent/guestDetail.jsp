<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="ssi.jsp" %>

<html>
<head> <title> [guestDetail.jsp]</title>
  <style type="text/css">
  * { font-family:D2Coding; }
    th,td{ font-size:12pt; font-weight:bold; } 
    b,input{ font-size:16pt; font-weight:bold; }
    a{text-decoration:none; font-size:18pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:18pt; font-weight:bold; }
  </style>
</head>
<body>
<div align="center">
   <font size="7" color=blue>  [guestDetail.jsp]  </font> <p>
 <%
 	try{
 		//세션 응용 session 내장 개체
 		//Object val = session.getAttribute( "naver" );
 		String val = (String)session.getAttribute( "naver" );
 		System.out.println("넘어온 세션값 = " + val );
 		if( val == null || val == "" ) {
//  			out.println("<font size=7>로그인 화면으로 이동</font><p>");
//  			out.println("<font size=7><a href='login.jsp'>로그인 화면</a></font><p>");
//  			return;	//아래 문장 수행 안함
%>
	<script type="text/javascript">
	alert("상세화면이나 주문화면은 로그인화면으로 이동됩니다.");
	location.href="login.jsp";
	</script>
<%
 		}
 		
	 //guestDetail.jsp문서 단독실행금지 
		String data = request.getParameter( "idx" );
	 	System.out.println( "넘어온 idx = " + data );
	 	msg="select * from guest where sabun=" + data;
	 	//select 쿼리문 나오면 -> 조회한 결과를 RS=ResultSet=RecordSet=Dataset
	 ST=CN.createStatement();
	 RS=ST.executeQuery(msg); 
	 if( RS.next() == true ) {
		 Gsabun=RS.getInt("sabun");
 %>
 <table width=900 border=1 cellspacing=0 >
 	<tr align="center" height="55">
 		<td colspan=6>
 		  <font size=7><b><%= RS.getString( "name" ) %>님의 상세 데이터 출력</b></font>
 		</td>
 	</tr>
 	
 	<tr bgcolor="#FFFF00"  height="55">
 	  <td align="center">사 번</td><td align="center">이 름</td><td align="center">제 목</td>
 	  <td align="center">날 짜</td><td align="center">급 여</td><td align="center">비 고</td>
 	</tr>
 	<tr>
 		<td align="center"> <%= RS.getInt("sabun")  %> </td>
 		<td align="center"> <%= RS.getString("name") %> </td>
 		<td align="center"> <%= RS.getString("title") %> </td>
 		<td align="center"> <%= RS.getDate("nalja") %> </td>
 		<td align="center"> <%= RS.getInt("pay") %> </td>
 		<td align="center"> 
 			<input type="button" onClick="location.href='guestEdit.jsp?idx=<%= Gsabun %>'" value="수정"> &nbsp;
 			<input type="button" onClick="location.href='guestDeleteSave.jsp?idx=<%= Gsabun %>'" value="삭제"> &nbsp;
 			<input type="button" onClick="location.href='guestList.jsp'" value="출력"> &nbsp;
 		</td>
 	</tr>	 
 <%	
 
 	 }	//if end
 	}catch(Exception ex){ }
 %>   	  
    </table>
     
   <p>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <%-- <a href="guestDeleteSave.jsp?idx=<%= RS.getInt("sabun") %>">[삭제]</a> &nbsp; --%>
   <a href="guestEdit.jsp?idx=<%= Gsabun %>">[수정]</a> &nbsp;
   <a href="guestDeleteSave.jsp?idx=<%= Gsabun %>">[삭제]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</div>   
   
</body>
</html>













