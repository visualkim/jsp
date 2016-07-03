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
<!-- *********************************************** -->
<DIV class="title" style='width: 20%;'>전송 결과</DIV>

<%
//파일 전송시 사용할 임시 파일 저장소
String tempDir = application.getRealPath("/pds3/temp");

//최종 파일 저장소
String upDir = application.getRealPath("/pds3/storage");

Upload upload = new Upload(request, -1, -1, tempDir);
int pdsno = Integer.parseInt(upload.getParameter("pdsno"));
String passwd = upload.encodeFileUpload12(upload.getParameter("passwd"));

if (pdsDAO.passwordCheck(pdsno, passwd) == 1){
  //****************************************************************
  // 파일 업로드 관련 코드 시작
  //****************************************************************
  FileItem fileItem = upload.getFileItem("file1");
  String file1 = "";
  long size1 = 0;  // 8 byte

  if (fileItem != null){
    size1 = fileItem.getSize();

    if (size1 > 0){
      // 새로운 파일이 업로드되기전에 기존에 등록된 파일을 먼저 삭제
      // pdsDAO.read(pdsno).getFile1()
      // -----------------------------------------
      // PdsVO vo = pdsDAO.read(pdsno);
      // String file = vo.getFile1();
      upload.deleteFile(upDir, pdsDAO.read(pdsno).getFile1()); 
      file1 = upload.saveFile(fileItem, upDir); // 파일 저장
    }
  }
  //****************************************************************

  PdsVO vo = new PdsVO();
  vo.setPdsno(pdsno);
  vo.setFile1(file1);
  vo.setSize1(size1);
  
  int count = pdsDAO.updateFile(vo); // 파일명 변경
%>
<DIV class='content'>
  <%
  if (count == 1){
  %>
    <script type="text/javascript">
      var str = "<A href=\"javascript: fileUpdate(<%=pdsno%>, '<%=file1 %>')\"><IMG src='./storage/<%=file1 %>' width='150px'></A>";
      opener.document.getElementById("file1").innerHTML = str;
      window.close();  // 성공했음으로 창 닫기
    </script>
  <%    
  }else{
  %>
    <DIV class='title' style='width: 70%;'>파일 변경에 실패했습니다.</DIV>
    <DIV class='bottom'>
      <button type='button' onclick="history.back();">다시 시도</button>
      <button type='button' onclick="window.close();" >닫기</button>               
    </DIV>
  <%  
  }
  %>
</DIV>
<%  
}else{
%>
  <DIV class='title' style='width: 70%;'>패스워드가 일치하지 않습니다.</DIV>
  <DIV class='bottom'>
    <button type='button' onclick="history.back();">다시 시도</button>
    <button type='button' onclick="window.close();" >닫기</button>               
  </DIV>
<%  
}
%>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- *********************************************** -->
</html> 
