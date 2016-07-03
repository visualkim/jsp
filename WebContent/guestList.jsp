<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>

<html>
<head> <title> [guestList.jsp]</title>
  <style type="text/css">
  * { font-family:D2Coding; }
    th,td{ font-size:12pt; font-weight:bold; } 
    b,input{ font-size:16pt; font-weight:bold; }
    a{text-decoration:none; font-size:18pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:18pt; font-weight:bold; }
  </style>
</head>
<body>
<div align="center">
<%
	try {
		msg = "select count(*) as cnt from guest";
		ST = CN.createStatement();
		RS = ST.executeQuery( msg );
		if( RS.next() == true ) {
			Gtotal = RS.getInt( "cnt" );
		}
	} catch(Exception ex) {
	}
%>
   <font size="5" color=blue>  [guestList.jsp]  </font> <p>  
   
    <table width=900 border=1 cellspacing=0 >
    	<tr align="right" height="60">
    		<td colspan=6>
    		  <font size=6>
    		  	레코드갯수 : <%= Gtotal %>&nbsp;&nbsp;&nbsp;
    		  </font>
    		</td>
    	</tr>
    	
    	<tr bgcolor="#FFFF00"  height="60">
    	  <td align="center">행번호</td>
    	  <td align="center">사 번</td>    
    	  <td align="center">이 름</td>
    	  <td align="center">제 목 </td>   
    	  <td align="center">날 짜</td> 
    	  <td align="center">급 여</td>
    	</tr>
    	
    	<%
    		try {
    			int pagesize = 10, limit = 10, temp = 0, startpage = 1, endpage = 10;
    			String pnum = "", returnpage = "", skey = "name", sval = "";
    			int start = 1, end = 10, pageNUM = 1, pagecount = 0;
    			
    			pnum = request.getParameter( "pageNum" );
    			if( pnum == null || pnum == "" ) { 
    				pnum = "1";
    			}
    			pageNUM = Integer.parseInt(pnum);	//[7문자를 숫자7로 변환]
 					start = (pageNUM -1 ) * pagesize +1;	// 7 - 1 * 10 + 1
 					end = pageNUM * pagesize;	// 7 * 10
 	    			
    			if( Gtotal / limit == 0 ) {
    				pagecount = Gtotal / limit;
    			} else {
    				pagecount = ( Gtotal / limit ) + 1;
    			}
//     			String a = "select rownum, sabun, name, title, nalja, pay from guest";
//     			String b = " where rownum >= 1 and rownum <= 10";
// 					String b = " where rownum between 1 and 10";
// 					String c = " where rownun between " + start + " and " + end; 
					String a = "select * from";
					String b = " (select rownum rn, sabun, name, title, nalja, pay from guest)";
					String c = " where rn between " + start + " and " + end; 
    			
    			//msg = "select rownum, sabun, name, title, nalja, pay from guest";
    			msg = a + b + c;
    			ST = CN.createStatement();
    			RS = ST.executeQuery( msg );	//조회한 결과를 RS기억
    			
    			temp = (pageNUM - 1) % limit;
    			startpage = pageNUM - temp;
    			endpage = (startpage + 10) - 1;
    			
    			if( endpage > pagecount ) {
    				endpage = pagecount;
    			}

    			System.out.println( "\nGtotal=" + Gtotal + "\tpagecount=" + pagecount );
    			
    			
    			while( RS.next() == true ) {
    				Gsabun = RS.getInt( "sabun" );
    				Gtitle = RS.getString( "title" );
			%>
					<tr>
						<td align="center"><%= RS.getInt( "rn" ) %></td>
						<td align="center"><%= RS.getInt( "sabun" ) %></td>
						<td align="center"><%= RS.getString( "name" ) %></td>
						<%-- <td align="center"><%= RS.getString( "title" ) %></td> --%>
						<td align="center"><a href="guestDetail.jsp?idx=<%= Gsabun %>"><%= Gtitle %></a></td>
						<td align="center"><%= RS.getDate( "nalja" ) %></td>
						<td align="center"><%= RS.getInt( "pay" ) %></td>
					</tr>
			<%
    			}	//while end
    			
    		
    	%>
    	<tr align="center" height="60">
    		<td colspan=6>
    		  <font size=6>
    		  	<%
    		  	//이전
    		  	if( startpage > 10 ) {
    		  		out.println( "<a href=guestList.jsp?pageNum=" + (startpage-10) + ">[이전]</a>");
    		  	}
    		  		for( int i  = startpage; i < (startpage + 10); i ++ ) {
    		  			if( i == pageNUM ) {
    		  				out.println( "<font size=5 color=green>[" +i+ "]</font>");
    		  			} else {
    		  				out.println("<a href=guestList.jsp?pageNum="+i+">["+i+"]</a>");
    		  			}
    		  			if( i == pagecount ) break;
    		  		}
    		  	//다음
    		  	if( endpage < pagecount ) {
    		  		out.println( "<a href = guestList.jsp?pageNum=" + ( startpage+10 ) + ">[다음]</a>" );
    		  	}
    		  	
				} catch(Exception ex) {
    			
    		}
    		  	%>
    		  </font>
    		</td>
    	</tr>
    </table>
   
   <p><br>
   <a href="index.jsp">[index.jsp]</a> &nbsp;
   <a href="login.jsp">[login.jsp]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
   
</div>   
   
</body>
</html>













