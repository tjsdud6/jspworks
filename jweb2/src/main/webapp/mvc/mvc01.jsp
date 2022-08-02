<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 패턴</title>
</head>
<body>
	${names[0]}<br>
	${names[1]}<br>
	<p>===============</p>
	<!-- jstl(jsp tag library) 반복 -->
	<c:forEach var="name" items="${names}">
		${name}<br>
	</c:forEach>
	<p>===============</p>
	
	<%-- ${lottoList[3]}<br>
	${lottoList[4]}<br>
	${lottoList[5]}<br> --%>
	
	<c:forEach var="lotto" items="${lottoList}">
		${lotto}
	</c:forEach>
	
	
	
</body>
</html>