<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="web.tool.Upload" %>

<%
request.setCharacterEncoding("UTF-8"); 

// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
// 파일 전송시 사용할 임시 파일 저장소
String tempDir = application.getRealPath("/file/temp");
System.out.println("--> tempDir: " + tempDir);

// 최종 파일 저장소
String upDir = application.getRealPath("/file/storage");
System.out.println("--> upDir: " + upDir);

// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);

// 파일 객체 추출 <input type='file' name='file1' size='60'>
FileItem fileItem = upload.getFileItem("file1");

String filename = "";
String title = "";  // 촬영지
long filesize = 0;

if (fileItem != null){
  filesize = fileItem.getSize(); // 파일 사이즈, byte
  
  if (filesize > 0){
    filename = upload.saveFile(fileItem, upDir); // 파일 저장
    title = upload.encodeFileUpload12(upload.getParameter("title")); // 일반적인 폼 태그
  }
}
// ****************************************************************
// 파일 업로드 관련 코드 종료
// ****************************************************************
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->

<DIV class="title" style='width: 20%;'>전송 결과</DIV>

<TABLE class='table'>
    <TR>
      <TH>촬영지</TH>
      <TD><%=title %></TD>
    </TR>
    <TR>
      <TH>전송된 파일</TH>
      <TD>파일명: <%=filename %> / 파일 사이즈: <%=filesize %></TD>
    </TR>
    <TR>
      <TD colspan='2'> <!--  이미지 출력 -->
        <IMG src='./storage/<%=filename %>' width='600px'>
      </TD>
    </TR>
    
</TABLE>
  
 <DIV class='bottom'>
    <input type='button' value='계속 전송' 
               onclick="location.href='./create_form.jsp'" >
</DIV>

<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 

