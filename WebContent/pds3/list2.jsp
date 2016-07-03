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
<DIV class='title'>힐링 휴량림</DIV>

<TABLE class='table'>
  <colgroup>
    <col style='width: 5%;' />
    <col style='width: 10%;' />
    <col style='width: 45%;' />
    <col style='width: 10%;' />
    <col style='width: 5%;' />
    <col style='width: 15%;' />
    <col style='width: 10%;' />
  </colgroup>
  
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>파일</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>조회</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    PdsVO vo = list.get(index); // PdsVO 객체 추출

%> 
  <TR>
    <TD class='td'><%=vo.getPdsno() %></TD>
    <TD class='td'>
    <%
    String file = vo.getFile1();
    long size = vo.getSize1();
    
    if (size > 0){
      if (Tool.isImage(file) == true){
      %>
        <A href='./storage/<%=file %>'><IMG src='./storage/<%=file%>' width='100%'></A>
      <%    
      }else{
      %>  
        <A href='./storage/<%=file %>'><%=file %></A>
      <%
      }
    }
    %>
    </TD>
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
