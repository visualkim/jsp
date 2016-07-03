<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>Gallery</title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<% 
ArrayList<PdsVO> list = pdsDAO.list();
%>
<DIV class='title'>영화</DIV>

<TABLE class='table'>
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 45%;'>제목</TH>
    <TH class='th' style='width: 10%;'>성명</TH>
    <TH class='th' style='width: 5%;'>조회</TH>
    <TH class='th' style='width: 20%;'>등록일</TH>
    <TH class='th' style='width: 10%;'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    PdsVO vo = list.get(index);

%> 
  <TR>
    <TD class='td'><%=vo.getPdsno() %></TD>
    <TD class='td_left'>
      <A href='./read.jsp?pdsno=<%=vo.getPdsno() %>'><%=vo.getTitle() %></A></TD>
    <TD class='td'><%=vo.getRname() %></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getRdate().substring(0, 10) %></TD>
    <TD class='td'>
      <A href='./update_form.jsp?pdsno=<%=vo.getPdsno() %>'><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?pdsno=<%=vo.getPdsno() %>'><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' 
             onclick="location.href='./create_form.jsp'">등록</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
