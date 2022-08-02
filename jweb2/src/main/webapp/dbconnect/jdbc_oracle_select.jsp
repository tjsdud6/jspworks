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
<title>��� ����</title>
</head>
<body>
	<%
		String driverClass = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "c##jweb";
		String password = "54321";
		
		
		Connection conn = null;				//���� ��ü
		PreparedStatement pstmt = null; 	//spl ��ü
		ResultSet rs = null;				//���(����) ��ü
		
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, username, password);
			//out.println("Oracle DB ���� �����߽��ϴ�");
			String sql = "SELECT * FROM t_student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	//���� �Լ�
			
			while(rs.next()){
				out.println(rs.getInt("stdid"));
				out.println(rs.getString("stdname")+"<br>");
				
			}
		}catch(Exception e){
			out.println("Oracle DB ���� �����߽��ϴ�");
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