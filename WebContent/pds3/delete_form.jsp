<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));
%>

<DIV class='content' style='width: 60%;'>
<FORM name='frm' method='POST' action='./delete_proc.jsp'>
  <input type='hidden' name='pdsno' value='<%=pdsno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>

  <fieldset>
    <legend>휴양림 정보 삭제 - 삭제 후 복구 할 수 없습니다.</legend>
    <ul>
      <li>
        <label for='passwd'>패스워드: </label>
        <input type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>

      <li class='right'>
        <button type="submit">삭제</button>
        <button type="button" onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word%>&nowPage=<%=nowPage %>'">취소</button>
      </li>    
    </ul>
  </fieldset>

</FORM>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

