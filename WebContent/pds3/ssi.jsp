<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="web.tool.*" %>
<%@ page import="web.pds3.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
PdsDAO pdsDAO = new PdsDAO();

// 개발시 최상위 경로: /pds_v3jc
// 서비스시 최상위 경로: /
String root = request.getContextPath();

//검색 컬럼 및 검색어 추출
String col = Tool.checkNull(request.getParameter("col"));
String word = Tool.checkNull(request.getParameter("word"));

int nowPage = 1; // 시작 페이지
if (request.getParameter("nowPage") != null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
};

%>






