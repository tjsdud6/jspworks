<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
	#container{width: 80%; margin: 0 auto; text-align: center}
	
	table{width: 400px; margin: 0 auto;}
	table, td{border: 1px solid #ccc; border-collapse: collapse;}
	table td{height: 40px;}
	table input{height: 25px;}
</style>
</head>
<jsp:useBean id="member" class="com.bean.Member" />
<jsp:setProperty property="id" name="member"/>
<jsp:setProperty property="passwd" name="member"/>
<jsp:setProperty property="name" name="member"/>
<body>
	<div id="container">
		<h2>회원 정보</h2>
		<hr>
		<table>
			<tr>
				<td>아이디</td><td>패스워드</td><td>이 름</td>
			</tr>
			<tr>
				<td>${member.id}</td>
				<td>${member.passwd}</td>
				<td>${member.name}</td>
			</tr>
		</table>
	</div>
</body>
</html>