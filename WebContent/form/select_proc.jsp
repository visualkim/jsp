<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	* { font-family: D2Coding; font-size:14px; }
</style>
<title>[select_form.jsp]</title>
</head>
<body>
<h2>[select_proc.jsp]</h2>
<%
	request.setCharacterEncoding("UTF-8");
	String travel1=request.getParameter("travel1");
	String travel2=request.getParameter("travel2");
%>
1박2일 국내여행: <%= travel1 %><p />
2박3일 해외여행: <%= travel2 %><p />

<p />
여행하고 싶은 목록 :
<%
	String[] a = request.getParameterValues("hobby");
	 for( int i = 0; i < a.length; i ++ ) {
	out.println( "<font size=6 color=blue>" + a[i] + "</font>");
}
%>
<br /><br />
<a href="./select_form.jsp">다시 조회하기</a>
</body>
</html>