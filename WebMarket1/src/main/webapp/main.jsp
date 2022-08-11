<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%-- <%@ include file="./menu.jsp" %> --%>
	<jsp:include page="./menu.jsp"/>
	<%!	//선언문 태그
		String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
		String tagilne = "Welcome to Web Market !";
	%>

	<!-- <h1>웹 쇼핑몰에 오신 것을 환영합니다.</h1> -->
	<!-- <h3>Welcome to Web Market !</h3> -->
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3><%=tagilne %></h3>
			<%
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute= day.getMinutes();
				int second = day.getSeconds();
				
				//오전, 오후 구분
				if(hour / 12 == 0 ){ //나눈 몫이 0.5, 0.9 ...
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12;
				}
				
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속시간: " + CT);
				
				//5초마다 페이지 갱신
				response.setIntHeader("Refresh", 1);
			
			
			%>
		</div>
	</div>
</body>
<%-- <%@ include file="./footer.jsp" %> --%>
<jsp:include page="./footer.jsp"/>
</html>