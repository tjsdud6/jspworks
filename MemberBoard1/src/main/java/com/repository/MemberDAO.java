package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.common.JDBCUtil;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//회원 추가
	public void addMember(Member member) {
		
		try {
			conn = JDBCUtil.getConnection();
			//칼럼에서 가입일이 생략 된 경우이므로 열을 표기 해야 함! 
			String sql = "INSERT INTO t_member(memberid, passwd, name, gender) "
					+ "VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//화면(회원가입창)에 입력 된 member 값을 db에 저장
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			
			//쿼리문 실행 함수
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}		
	}
	
	//회원 목록
	public ArrayList<Member> getListAll() {
		
		ArrayList<Member> memberList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection(); //db연결
			String sql = "SELECT * FROM t_member ORDER BY joindate DESC";
			pstmt = conn.prepareStatement(sql); //sql 처리 객체 생성
			rs = pstmt.executeQuery();	//select 실행문
			while(rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberid"));	//db에서 가져와서 member에 세팅
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joindate"));
				memberList.add(member); // memberList에 위에 불러온 member 의 정보 넣기 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	//로그인 체크
	public Boolean checkLogin(String memberId, String password) {
		
		try {
			conn = JDBCUtil.getConnection(); //db연결
			String sql = "SELECT * FROM t_member WHERE memberid=? and passwd=?"; //db에서 정보(아이디,패스워드) 가져오기
			pstmt = conn.prepareStatement(sql);
			
			// 위에 물음표 2개 설정해주기
			pstmt.setString(1, memberId);
			pstmt.setString(2, password);
			
			// 일치 하면 쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {		//아이디와 비밀번호가 일치 하는 경우 
				return true;	//실행  
			}else {				//일치하지 않으면
				return false;	//실행x 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false; //(기본적으로 false로 설정 함)
	}
	
	//회원 삭제
	public void deleteMember(String memberId) {
		
		try {
			conn = JDBCUtil.getConnection(); //db연결
			String sql = "DELETE FROM t_member WHERE memberId=?"; // db에서 정보(아이디) 삭제
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
