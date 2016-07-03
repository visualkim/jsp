<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head> <title> [gugudan.jsp]</title>

</head>
<body>
   <font size="7"> <b> [gugudan.jsp] </b> </font> <p>
   <%
   	String name = "홍길동";
   	int age = 27;
   	
   	int kor = 95;
   	double avg = 78.9;
   	String data = "1200";
   	
   	int a = (int)avg;
   	int b = Integer.parseInt(data);
   	System.out.println( b+98 );	//1298
   	System.out.println( data+98 ); //120098
   	
   %>
   <font size = 7>
   <b>
   이름 : <% out.println(name); %> <br />
   나이 : <% out.println(age); %> <p>
   
   이름 : <%= name %> <br />
   나이 : <%= age %> <p>
   </b></font>
   <p>
   <%
   	 int dan=3;
     for(int i=1; i<10; i++){ 
      out.println("<font size=7>"+dan+"*"+i+"="+(dan*i)+"</font><br>");         
      if(i==5)break;
     }
   %>
   
   <img src="images/bar.gif">   
</body>
</html>










