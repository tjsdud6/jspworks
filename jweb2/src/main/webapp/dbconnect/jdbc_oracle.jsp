<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>db 연동</title>
</head>
<body>
	<!-- 클래스, url, username, password -->
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##jweb";
		String password = "54321";
		
		
		Connection conn = null;
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			out.println("Oracle DB 연결 성공했습니다");
		}catch(Exception e){
			out.println("Oracle DB 연결 실패했습니다");
			out.println(e.getMessage());
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>