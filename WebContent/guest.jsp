<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head> <title> [guest.jsp]</title>
  <style type="text/css">
  * { font-family:D2Coding; }
    th,td{ font-size:12pt; font-weight:bold; } 
    b,input{ font-size:16pt; font-weight:bold; }
    a{text-decoration:none; font-size:18pt; font-weight:bold; }
    a:hover{text-decoration:underline; font-size:18pt; font-weight:bold; }
  </style>
  <script type="text/javascript">
  	function move( ){
  		var a=myform.sabun.value;
  		var b=myform.name.value;
  		if(a=="" || a==null){
  		  alert("사번데이타가 공백입니다");
  		  myform.sabun.focus();
  		  return ; //아래문장수행안함 
  		}else{myform.name.focus(); }
  		
  		// 사번의 문자열 길이 4글자 - 4자리수 체크
  		var size = myform.sabun.value.length;
  		if( size != 4 ) {
  			alert( "주민번호 자릿수는 무조건 4자리입니다" );
  			myform.sabun.value = "";
  			myform.sabun.focus();
  			return false;
  		}
  		
  		if(b=="" || b==null){
  		  alert("이름데이타가 공백입니다");
  		  myform.name.focus();
  		  return ; //아래문장수행못함 
  		}else{myform.title.focus();}
  		
  		//공백이 아니면 정상적인 데이타가 들어왔으면 action연결
  		document.myform.submit( ); //input type=submit
  	}//move end
  	
  	function idCheck( ){
  		var a=myform.sabun.value;
  		if(a=="" || a==null){
  		  alert("아이디중복 데이타가 공백입니다");
  		  myform.sabun.focus();
  		  return ;  
  		 }
  	   open("openID.jsp", "title", "left=300,top=200,width=400,height=200");
  	}//idCheck end
  	
  	function info(){
  	  open("popup.jsp", "title", "left=300,top=150,width=400,height=600");
  	}//info end
  </script>
</head>
<body onload="info()">
   <font size="5">  [guest.jsp]  </font> <p>   
   <form name="myform" method="get" action="guestSave.jsp">
  	<b>사번: </b> 
  		<input type="text" name="sabun" size=8> 
     <input type="button" onClick="idCheck( )" value="id중복체크">
     <br>
   	<b>이름: </b> <input type="text" name="name"><br /> 
    <b>제목: </b> <input type="text" name="title" value="snow"><br /> 
    <b>급여: </b> <input type="text" name="pay" value="97" ><br />
    
    <input type="button" onclick="move()" value="방명록저장">
    <input type="reset" value="입력취소">
   </form>
   
   <p>
   <a href="index.jsp">[index]</a> &nbsp;
   <a href="guest.jsp">[방명록입력]</a> &nbsp;
   <a href="guestList.jsp">[방명록출력]</a> &nbsp;
</body>
</html>













