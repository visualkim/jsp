<%@  page language="java" contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<html>
<head> <title> [openIDSave.jsp]</title>
  <style type="text/css">
    b,input{ font-size:20pt; font-weight:bold; }
    a{text-decoration:none; font-size:30pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:36pt; font-weight:bold; }
  </style>
</head>
<body> 
 	<img src="images/bar.gif"><p>
 
 <% 
  try{
	  String data = request.getParameter( "userid" );
	  msg = "select count(*) as cnt from guest where sabun = " + data;
	  ST = CN.createStatement();
	  RS = ST.executeQuery( msg );
	  RS.next();
	  Gtotal = RS.getInt( "cnt" );
	  if( Gtotal > 0 ) {
 %>
			<script type="text/javascript">
				alert("<%= data %> 데이터는 등록된 사번 데이터입니다.");
				opener.myform.sabun.value = "";
				opener.myform.sabun.focus();
				self.close();
			</script>
	  <%
	  } else {
	  %>
		<script type="text/javascript">
		alert( "사번 데이터는 사용 사능한 사번=id입니다.");
		opener.myform.name.focus();
		self.close();
		</script>
		<%
	  }	 
	//select count(*) as  where 
	//if(Gtotal){ }else{ }
  }catch(Exception ex){System.out.println("실패:" + ex ); }
 %>
</body>
</html>













