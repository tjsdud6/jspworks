<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그 아웃 - 세션 삭제
	session.invalidate();
	
	out.println("<script>");
	out.println("alert('정상적으로 로그아웃되었습니다.')");
	out.println("location.href='/main.jsp'");
	out.println("</script>");
%>