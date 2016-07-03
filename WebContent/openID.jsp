<%@ page language="java" contentType="text/html; charset=UTF-8"  %>     

<html>
<head> <title> [openID.jsp]</title>
	<script type="text/javascript">
		function send( ){
			subform.userid.value=opener.myform.sabun.value;
		}//send end
	</script>
</head>  
<body bgcolor=yellow  onLoad="send( )" >
  	<div align="center">  
  	  	  <form  name="subform" action="openIDSave.jsp">
  	  	     <b>아이디:</b>
  	  	     <input type=text name="userid">
  	  	     <input type="submit" value="중복확인">
  	  	  </form> 
  	  
  	  <p>
  	  	<img src="images/bar.gif"><br>
  	</div>
 </body>
</html>




                                                              


