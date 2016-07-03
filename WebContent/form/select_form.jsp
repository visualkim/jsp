<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	* { font-family: D2Coding; font-size:14px; }
</style>
<title>[select_proc.jsp]</title>
</head>
<body>
<form name="frm" action="./select_proc.jsp" method="post">
	<h1>주말 여행지 선택</h1>
	1박 2일 국내 여행 직접 입력:
	<input type='text' name="travel1" size=20
		       placeholder="동해등입력" autofocus="autofocus">
	<br />
	2박 3일 해외여행지 선택:
	<select name="travel2">
		<option value='홋가이도'>북해도(일본)</option>
		<option value='타이뻬이'>타이완</option>
		<option value='빅토리아파크'>홍콩</option>
	</select>
	<br />
	<br />
	<fieldset>
		<legend>여행하고 싶은 국가?</legend>
		<label><input type='checkbox' name='hobby' value='미국'>미국</label>
		<label><input type='checkbox' name='hobby' value='캐나다'>캐나다</label>
		<label><input type='checkbox' name='hobby' value='중국'>중국</label>
		<label><input type='checkbox' name='hobby' value='일본'>일본</label>
		<label><input type='checkbox' name='hobby' value='대만'>대만</label>
	</fieldset>
	
	<input type="submit" value="여행지신청">
</form>
</body>
</html>