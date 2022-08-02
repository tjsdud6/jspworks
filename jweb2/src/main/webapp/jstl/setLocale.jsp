<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어 처리</title>
</head>
<body>
	<%=response.getLocale()%>
	
	<!-- value 속성 : 언어코드 -->
	<fmt:setLocale value="ko"/>
	<p><%=response.getLocale()%>
	
	<fmt:setLocale value="en"/>
	<p><%=response.getLocale()%>
	
	<fmt:setLocale value="ja"/>
	<p><%=response.getLocale()%>
	
	<fmt:setLocale value="ch"/>
	<p><%=response.getLocale()%>
	
</body>
</html>