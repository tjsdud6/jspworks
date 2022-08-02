<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 	<h2>구구단</h2>
 	<table>
 	<%-- 	<%
		for(int i = 1; i <= 9; i++){
	%>	
		<tr>
			<% for(int j = 2; j <= 9; j ++){ %>
				<td width="80"><%= j + "x" + i + "=" + (j * i)%> </td>
			<% } %>
		</tr>
	<% } %>	 --%>
	
	<c:forEach var="i" begin="1" end="9">
	<tr>
		<c:forEach var="j" begin="2" end="9">
			<td width="100"> ${j} x ${i} = ${j*i} </td>
		</c:forEach>
	</tr>
	</c:forEach>
	
 	</table>
</body>
</html>