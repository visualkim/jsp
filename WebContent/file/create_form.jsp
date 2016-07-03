<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>파일 업로드</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->

<DIV class="title" style='width: 20%;'>파일 등록</DIV>

<FORM name='frm'  method="post" action='./create_proc.jsp'
      enctype='multipart/form-data'>
  <TABLE class='table'>
    <TR>
      <TH>촬영 장소</TH>
      <TD class='td_left'><input type='text' name='title' size='50' value='그림설명기술'></TD>
    </TR>
    <TR>
      <TH>이미지 파일</TH>
      <TD class='td_left'><input type='file' name='file1' size='50'></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
      <input type='submit' value='업로드'>
  </DIV>
</FORM>

<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
