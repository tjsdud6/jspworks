<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록보기</title>
</head>
<body>
	<%
		String driverClass = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul";
		String username = "root";
		String password = "12345";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			out.println("<h2>회원명단</h2>");
			out.println("<table border=1 width=300>");
			out.println("<tr><th>아이디</th><th>비밀번호</th><th>이름</th></tr>");
			while(rs.next()){
				out.println("<tr><td>" + rs.getInt("uid") + "</td>");
				out.println("<td>"+rs.getString("pwd")+"</td>");
				out.println("<td>"+rs.getString("name") + "</td></tr>");
			}
			out.println("</table>");
		}catch(Exception e){
			out.println("MySQL DB 연결 실패했습니다");
			out.println(e.getMessage());
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			
		}
	%>
</body>
</html>