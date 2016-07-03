<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="./ssi.jsp" %>

<%
// ---------------------------------------------
// 페이징 관련 코드 시작
// ---------------------------------------------
int totalRecord = pdsDAO.count(col, word);
int recordPerPage = 4; // 페이지당 레코드 수
String paging = new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word);
// ---------------------------------------------
// 페이징 관련 코드 종료
// ---------------------------------------------

// ArrayList<Pds3VO> list = pds3DAO.list();  // 전체 레코드
// ArrayList<PdsVO> list = pdsDAO.list(col, word); // 검색
ArrayList<PdsVO> list = pdsDAO.list(col, word, nowPage, recordPerPage);
%>

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
<DIV class='title'>힐링 휴양림</DIV>

<DIV class='content' style='width: 88%;'>
  <FORM name='frm' method='post' action='./list.jsp'>
    <DIV class='menu_on_table_left'>
      <SELECT name='col'>
        <OPTION value='none' <%=(word.length() == 0)?"selected='selected'":"" %>>전체목록</OPTION>
        <OPTION value='rname' <%=(col.equals("rname"))?"selected='selected'":"" %>>이름</OPTION>
        <OPTION value='title' <%=(col.equals("title"))?"selected='selected'":"" %>>제목</OPTION>
        <OPTION value='content' <%=(col.equals("content"))?"selected='selected'":"" %>>내용</OPTION>
      </SELECT>

      <%
      if (col.equals("none")){
        word="";
      }
      %>
      <input type='text' name='word' value='<%=word %>'>
      <input type='submit' value='검색'>
    </DIV>
    <DIV class='menu_on_table_right'>
       휴양림 수: <%=totalRecord %> 건 |
      <A href='./list2.jsp'>목록 보기</A> |
      <A href='./list.jsp'>요약 보기</A> |
      <A href='./create_form.jsp'>등록</A>
    </DIV>
  </FORM>
<DIV style='width: 100%; clear: both; height: 1px; border-top: dotted 1px #AAAAAA;' ></DIV> 

<DIV style='border: none 2px #FF0000; width: 100%; margin: 0px auto;'>
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
    
    if (title.length() > 8){  // 긴 문장을 10자 이내로 변경 
      title = title.substring(0, 8) + "..." ;
    }
    
    if (size > 0){
      if (Tool.isImage(file)){ // 이미지인 경우
      %>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><IMG src='./storage/<%=file%>' style='width: 200px; height: 150px;' ></A>
        <br>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
      <%    
      }else{ // 이미지가 아닌 경우
      %>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><%=file %> 파일을 <br>다운로드 할 수 있습니다.</A>
        <br><br>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
      <%
      }
    }else{
    %>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'>관련 이미지가 없습니다.<br>이미지를 업로드해주세요.</A>
        <br><br>
        <A href='./read.jsp?pdsno=<%=pdsno %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><%=title %> (<%=cnt %>)</A>
        <br>
        <%=rdate.substring(0, 16) %>
    <%  
    }
    %>
  </DIV>
<%
  }
%>
  <DIV style='width: 100%; clear: both; height: 1px; border-top: dotted 1px #AAAAAA;' ></DIV> 
  </DIV>
</DIV>

<DIV class='bottom'>
  <%=paging %>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 


