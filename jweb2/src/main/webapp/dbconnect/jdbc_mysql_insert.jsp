<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
</head>
<body>
	<%
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul";
		String username = "root";
		String password = "12345";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			//out.println("MySQL DB 연결 성공했습니다");
			
			String sql = "INSERT INTO user VALUES(133, 'sky','안산')";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			out.println("MySQL DB 연결 실패했습니다");
			out.println(e.getMessage());
		}finally{
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>