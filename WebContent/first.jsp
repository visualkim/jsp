<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<html>
<head> <title>[first.jsp]</title>
</head>
<body>
	<%!
		int a, b, kor, eng, sum;
		double avg;
		String data;
		char grade = 'F';
		String msg = "합격, 재시험";
	%>
	<%
	try {
		kor = 45;
		avg = 78.9;
		data = "1200";
		a = (int)avg;
		b = Integer.parseInt(data);
		String c = String.valueOf(kor);
	} catch(Exception ex) {
		
	}
	out.println( "<h1>1200 + 98 = " + (data + 98 ) + "</h1>" );
	out.println( "<h1>1200 + 98 = " + (b + 98 ) + " </h1>" );
		
	%>
	
	<% 
		kor = 90;
		eng = 85;
		sum = kor + eng;
		avg = (double)sum /2;
		out.println( "<h1> 총점 = " + sum + "</h1>" );
		out.println( "<h1> 평균 = " + avg + "</h1>" );
		
		// if(평균 >= 70 ) { 합격 } else { 재시험 }
		// if~else 제어문 대신 삼항연산으로 합격, 재시험
		
		msg = ( avg >= 70 ) ? "합격" : "재시험";
		out.println( msg );
		
		// if~else if~else if~else 대신 switch 제어문
		// 100~90 A, 89~80 B, 79~70 C, 69~60 D, 나머지 F

		switch( (int)avg/10 ) {
		case 10: grade = 'A'; break;
		case 9: grade = 'A'; break;
		case 8: grade = 'B'; break;
		case 7: grade = 'C'; break;
		case 6: grade = 'D'; break;
		default: grade = 'F'; break;
		}
		out.println( "<h1>학점 = " + grade  );

		
		
	%>
</body>
</html>











