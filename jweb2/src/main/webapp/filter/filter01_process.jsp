<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//지금까지 한글 인코딩 방식
	//request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");

%>

입력된 값 : <%=name %>