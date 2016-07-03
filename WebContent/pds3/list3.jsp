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
ArrayList<PdsVO> list = pdsDAO.list();
%>
<DIV class='title'>힐링 휴량림</DIV>

<DIV class='content'>
  <DIV style='border: none 2px #FF0000; width: 87%; margin: 0px auto;'>
  <%
  for(int index=0; index < list.size(); index++){   
    PdsVO vo = list.get(index);

    if (index != 0 && index % 4 == 0){
    %>      
      <DIV style='width: 100%; clear: both; height: 1px; border-top: dotted 1px #AAAAAA;' ></DIV> 
    <% 
    }%>
    
    <DIV style='margin: 5px; padding: 5px; width: 200px; height: 200px; float: left; border: none 1px #AAAAAA;'>   
    <%
    int pdsno = vo.getPdsno();
    String file = vo.getFile1();
    long size = vo.getSize1();
    String title = vo.getTitle();
    String rdate = vo.getRdate();
    int cnt = vo.getCnt();
    
    if (title.length() > 10){  // 긴 문장을 10자 이내로 변경 
      title = title.substring(0, 10) + "..." ;
    }
    
    if (size > 0){
      if (Tool.isImage(file)){ // 이미지인 경우
      %>
        <A href='./read.jsp?pdsno=<%=pdsno %>'><IMG src='./storage/<%=file%>' style='width: 200px; height: 150px;' ></A>
        <br>
        <A href='./read.jsp?pdsno=<%=pdsno %>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
      <%    
      }else{ // 이미지가 아닌 경우
      %>
        <A href='./read.jsp?pdsno=<%=pdsno %>'><%=file %> 파일을 <br>다운로드 할 수 있습니다.</A>
        <br><br>
        <A href='./read.jsp?pdsno=<%=pdsno %>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
      <%
      }
    }else{
    %>
        <A href='./read.jsp?pdsno=<%=pdsno %>'>관련 이미지가 없습니다.<br>이미지를 업로드해주세요.</A>
        <br><br>
        <A href='./read.jsp?pdsno=<%=pdsno %>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
    <%  
    }
    %>
  </DIV>
<%
  }
%>
  </DIV>
</DIV>

<DIV class='bottom'>
  <button type='button' 
             onclick="location.href='./create_form.jsp'">등록</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
