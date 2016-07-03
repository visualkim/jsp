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

PdsVO vo = pdsDAO.read(pdsno);
// System.out.println("--> " + vo.getTitle());

pdsDAO.increaseCnt(pdsno); // 조회수 증가
%>

<DIV class='title'>조회</DIV>

<DIV class='content'>
<form>
  <fieldset>
    <ul>
      <li>
        <span class='item_title'>제목:</span> <%=vo.getTitle() %> (<%=vo.getRdate().substring(0, 16) %>) 조회수: <%=vo.getCnt() %>
      </li>
      <li>
        <span class='item_title'>내용:</span> <br>
        <%
        String file = vo.getFile1();
        long size = vo.getSize1();
        
        if (Tool.isImage(file)){
        %>
          <div style='width: 50%; float: left; margin: 10px 10px 0px 0px;'>
            <IMG src='./storage/<%=vo.getFile1() %>' width='100%'>
          </div>        
        <%
        }
        %>      
        <div>
          <%=Tool.convertChar(vo.getContent()) %>
        </div>
      </li>
      
      <li>
        <DIV style=' clear: both; width: 100%; margin: 0px auto;'></DIV>
        <span class='item_title'>성명:</span> <%=vo.getRname() %>
        <%
        if (vo.getEmail().length() > 0){
        %>
          <span class='item_title'>Email:</span> <%=vo.getEmail() %>
        <%
        }
        if (vo.getSize1() > 0){
        %>   
          <span class='item_title'>FILE:</span>
          <A href='<%=root %>/download?dir=/pds3/storage&filename=<%=vo.getFile1() %>'><%=vo.getFile1() %></A> 
          (<%=Tool.unit(vo.getSize1()) %>)
        <%
        }
        %>
      </li>
      <li>
        <%
        if (Tool.checkNull(vo.getUrl()).length() > 0){
        %>
          <span class='item_title'>URL:</span>
          <A href='<%=vo.getUrl() %>' target="_blank"><%=vo.getUrl()%></A>
        <%
        }
        %>      
      </li>
      <li class='right'> 
        <button type="button" onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word%>&nowPage=<%=nowPage %>'">앨범형</button>
        <button type="button" onclick="location.href='./list2.jsp?col=<%=col %>&word=<%=word%>&nowPage=<%=nowPage %>'">목록형</button>
        <button type="button" onclick="location.href='./update_form.jsp?pdsno=<%=pdsno %>'">수정</button>
        <button type="button" onclick="location.href='./delete_form.jsp?pdsno=<%=pdsno %>'">삭제</button>
      </li>    
    </ul>
  </fieldset>
</form>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

