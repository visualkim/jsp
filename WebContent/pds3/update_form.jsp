<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
  function fileUpdate(pdsno, file1){
    // alert(file);
    var win_file = window.open('./update_file_form.jsp?pdsno='+pdsno+'&file1=' + file1, '파일 변경', 'width=600px, height=550px, scrollbars=no')
    // alert(screen.width + "/" + screen.height);
    var x = (screen.width - 600) / 2;
    var y = (screen.height - 550) / 2;
    
    win_file.moveTo(x, y); // 화면 이동
  }
</script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<%
int pdsno = Integer.parseInt(request.getParameter("pdsno"));

PdsVO vo = pdsDAO.read(pdsno); // 변경할 내용 조회
%>

<DIV class='content'>
<FORM name='frm' method='POST' action='./update_proc.jsp'>
  <input type='hidden' name='pdsno' value='<%=pdsno%>'>         
  <fieldset>
    <legend>휴양림 정보 변경</legend>
    <ul>
      <li>
        <label for='title'>제목: </label>
        <input type='text' name='title' id='title' size='50' value='<%=vo.getTitle() %>'>
      </li>
      <li>
        <label for='content'>내용: </label><br>
        <textarea name='content' id='content' rows='5' style='width: 100%;'><%=vo.getContent() %></textarea>
      </li>  
      <li>
        <label for='url'>WEB URL: </label>
        <input type="url" name='url' id='url' size='50' value='<%=Tool.checkNull(vo.getUrl()) %>'>
      </li>
      <li>
        <label for='file'>참고 파일: </label>
        <span id='file1'>
          <A href="javascript: fileUpdate(<%=pdsno%>, '<%=vo.getFile1() %>')"><IMG src='./storage/<%=vo.getFile1() %>' width='150px'></A>
        </span>
      </li>        
      <li>
        <label for='rname'>성명: </label>
        <input type='text' name='rname' id='rname' value='<%=vo.getRname() %>' size='10'>

        <label for='email'>이메일: </label>
        <input type='email' name='email' id='email' value='<%=vo.getEmail() %>' size='25'>

        <label for='passwd'>패스워드: </label>
        <input type='password' name='passwd' id='passwd' value='123' size='5'>
      </li>

      <li class='right'>
        <button type="submit">저장</button>
        <button type="button" onclick="location.href='./list.jsp'">목록</button>
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
