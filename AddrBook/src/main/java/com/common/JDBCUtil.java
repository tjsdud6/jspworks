package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	private static String driverClass = "oracle.jdbc.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String username = "c##jweb";
	private static String password = "54321";

	//DB 연결 메소드
	public static Connection getConnection() { //static을 사용하는 이유: 이후에 new 하지않고 바로 사용하기 위해!
		try {
			Class.forName(driverClass);
			return DriverManager.getConnection(url, username, password); //객체가 있을때는 반환
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null; //없으면 null
	}

	//DB 연결 종료 메소드
	public static void close(Connection conn, PreparedStatement pstmt) {
		if(pstmt != null) { //pstmt가 null이 아닐경우 = 사용하고 있다면
			try {
				pstmt.close();// pstmt 닫기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(conn != null) { //conn이 null이 아니면
			try {
				conn.close(); // conn 닫기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//DB 연결 종료 메소드(ResultSet이 있는 경우)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(pstmt != null) { 
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(conn != null) { 
			try {
				conn.close(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
