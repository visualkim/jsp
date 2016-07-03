<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	* { font-family: D2Coding; }
</style>
<title>[radio_form.jsp]</title>
</head>
<body>
<form name='frm' action='./radio_proc.jsp' method='get'>
	<fieldset>
		<legend>
			2015년 ~ 2016년 가장 취득하고 싶은 자격증은?
		</legend>
		<label>
			<input type='radio' name='license' value='정보처리관련 자격증' checked='checked'>정보처리관련 자격증
		</label>
		<br />
		<label>
			<input type='radio' name='license' value='전자시스템 제어사 2급'>전자시스템 제어사 2급
		</label>
		<br />
		<label>
			<input type='radio' name='license' value='리눅스 마스터 2급'>리눅스마스터 2급
		</label>
		<br />
		<label>
			<input type='radio' name='license' value='모바일앱 개발 전문가 1급/2급'>모바일앱 개발 전문가 1급/2급
		</label>
		<br />
		<label>
			<input type='radio' name='license' value='해킹보안전문가 3급'>해킹보안전문가 3급
		</label>
		<br />
	</fieldset>
	
	<fieldset>
		<legend>
			근무하고자 하는 분야는?
		</legend>
		<label>
			<input type='radio' name='job' value='시스템 통합(SI)' checked='checked'>시스템 통합(SI)
		</label>
		<br>
		<label>
			<input type='radio' name='job' value='시스템 관리(SM)' checked='checked'>시스템 관리(SM)
		</label>
		<br>
		<label>
			<input type='radio' name='job' value='자체 솔루션 개발' checked='checked'>자체 솔루션 개발
		</label>
		<br>
		<label>
			<input type='radio' name='job' value='Web Agency' checked='checked'>Web Agency
		</label>
		<br>
	</fieldset>
	<br />
	<input type='submit' value='등록'>
</form>
</body>
</html>