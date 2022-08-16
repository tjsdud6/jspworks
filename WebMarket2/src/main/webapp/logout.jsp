<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//모든 세션 삭제
	session.invalidate();

	//페이지 이동
	response.sendRedirect("./addProduct.jsp");
%>