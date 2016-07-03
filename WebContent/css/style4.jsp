<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  *{ font-family: ; font-size: 26px;}
  .table{
    border-style: solid; /*  실선 */
    border-width: 1px; /* 선 두께 */
    border-color: #000000; /* 선 색깔 */
    border-collapse: collapse; /* 셀 경계선 병합*/
  }
  
  .th{
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
  }

  .td{
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
  }
  
  .table2{
    border-style: none; /*  실선 */
    border-width: 1px; /* 선 두께 */
    border-color: #AAAAAA; /* 선 색깔 */
    border-collapse: collapse; /* 셀 경계선 병합*/
    /* margin: 20px 20px 20px 20px; */ /* 위, 오른쪽, 아래, 왼쪽 */
    width: 70%; /* 테이블 너비 */
    margin: 20px auto; /* 20px: 위아래, auto: 좌우, 자동 가운데 정렬*/
  }
  
  .th2{
    border-top-style: solid;
    border-top-width: 2px;
    border-top-color: #00FF00;
    
    border-bottom: solid 2px #00FF00;
    border-left: none;
    border-right: none;
    background-color: #FFFF00;
  }
  
  .td2{
    border-top: none;
    border-right: none;
    border-bottom: solid 1px #00FF00;
    border-left: none;
    text-align: center;
  }

  .td3{
    border-top: none;
    border-right: none;
    border-bottom: solid 2px #00FF00;
    border-left: none;
    text-align: center;
  }
    
</style>
</head>
<body>
<table class='table'>
  <tr>
    <th class='th'>번호</th>
    <th class='th'>CPU</th>
    <th class='th'>RAM</th>
    <th class='th'>HDD</th>
  </tr>
  <tr>
    <td class='td'>1</td>
    <td class='td'>2.0 GHz</td>
    <td class='td'>4 GB</td>
    <td class='td'>1 TB</td>
  </tr>
  <tr>
    <td class='td'>2</td>
    <td class='td'>2.16 GHz</td>
    <td class='td'>4 GB</td>
    <td class='td'>1 TB</td>
  </tr>
  <tr>
    <td class='td'>3</td>
    <td class='td'>2.6 GHz</td>
    <td class='td'>8 GB</td>
    <td class='td'>2 TB</td>
  </tr>

</table>

<table class='table2'>
  <tr>
    <th class='th2'>번호</th>
    <th class='th2'>CPU</th>
    <th class='th2'>RAM</th>
    <th class='th2'>HDD</th>
  </tr>
  <tr>
    <td class='td2'>1</td>
    <td class='td2'>2.0 GHz</td>
    <td class='td2'>4 GB</td>
    <td class='td2'>1 TB</td>
  </tr>
  <tr>
    <td class='td2'>2</td>
    <td class='td2'>2.16 GHz</td>
    <td class='td2'>4 GB</td>
    <td class='td2'>1 TB</td>
  </tr>
  <tr>
    <td class='td2'>3</td>
    <td class='td2'>2.6 GHz</td>
    <td class='td2'>8 GB</td>
    <td class='td2'>2 TB</td>
  </tr>
  <tr>
    <td class='td3'>4</td>
    <td class='td3'>2.8 GHz</td>
    <td class='td3'>16 GB</td>
    <td class='td3'>2 TB</td>
  </tr>
</table>

</body>
</html>
