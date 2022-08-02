<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>목록 보기</title>
</head>
<body>
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##jweb";
		String password = "54321";
		
		
		Connection conn = null;				//연결 객체
		PreparedStatement pstmt = null; 	//spl 객체
		ResultSet rs = null;				//결과(얻어온) 객체
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			//out.println("Oracle DB 연결 성공했습니다");
			String sql = "SELECT * FROM t_student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	//실행 함수
			
			while(rs.next()){
				out.println(rs.getInt("stdid"));
				out.println(rs.getString("stdname")+"<br>");
				
			}
		}catch(Exception e){
			out.println("Oracle DB 연결 실패했습니다");
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