<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- *********************************************** -->
<%
String rname = request.getParameter("rname");
String email = request.getParameter("email");
String title = request.getParameter("title");
String content = request.getParameter("content");
String url = request.getParameter("url");
int pdsno =  Integer.parseInt(request.getParameter("pdsno"));
String passwd = request.getParameter("passwd");

if (pdsDAO.passwordCheck(pdsno, passwd) == 1){
  PdsVO vo = new PdsVO();
  vo.setRname(rname);
  vo.setEmail(email);
  vo.setTitle(title);
  vo.setContent(content);
  vo.setUrl(url);
  vo.setPdsno(pdsno);

  int count = pdsDAO.update(vo);
  if (count == 1){
    // URLEncoder.encode(); // 한글 및 특수문자 코드로 변환
    String link = "./list.jsp?col=" + col + "&word=" + URLEncoder.encode(word, "utf-8") + "&nowPage=" + nowPage;
    response.sendRedirect(link); // 페이지 자동 이동
  }else{ 
    %>
    <DIV class='title' style='width: 70%;'>변경에 실패했습니다.</DIV>
    <DIV class='bottom'>
      <button type='button' onclick="history.back();">다시 시도</button>
      <button type='button' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word%>&nowPage=<%=nowPage %>';" >목록</button>               
    </DIV>
    <%
  }
}else{
%>
  <DIV class='title' style='width: 70%;'>패스워드가 일치하지 않습니다.</DIV>
  <DIV class='bottom'>
    <button type='button' onclick="history.back();">다시 시도</button>
    <button type='button' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word%>&nowPage=<%=nowPage %>'" >목록</button>               
  </DIV>
<%  
}
%>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- *********************************************** -->
</html> 
