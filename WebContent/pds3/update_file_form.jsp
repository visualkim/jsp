<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="web.tool.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
// console.log('console test');

// var parent = opener.document; // window.open을 호출한 html(jsp) 페이지
// ID 가 'file'인 태그를 찾아 값을 추출
// console.log('--> file: ' + parent.getElementById("file").innerHTML);
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
String file = request.getParameter("file1");
%>

<FORM name='frm' method='POST' 
           action='./update_file_proc.jsp' enctype='multipart/form-data'>
  <input type='hidden' name='pdsno' value='<%=pdsno %>'>          

  <DIV style='text-align: center; width: 90%; margin: 10px auto;'>
    <IMG src='./storage/<%=file %>' width='100%;'>
    <br>
    <label>새로운 파일: <input type='file' name='file1' id='file1'></label>
    <br><br>
    <label for='passwd'>패스워드: </label>
    <input type='password' name='passwd' size='10' value='123'>
    <button type='submit'>변경 적용</button>
    <button type='button' onclick="window.close();">취소</button> 
  </DIV>
</FORM>

<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 

