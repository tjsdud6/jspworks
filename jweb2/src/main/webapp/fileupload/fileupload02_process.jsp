<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{width: 800px;}
	table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
		padding: 10px;
	}
</style>
<%
	String realFolder = "C:\\Dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//폼 데이터 가져오기
	String name1 = multi.getParameter("name1");
	String title1 = multi.getParameter("title1");
	
	String name2 = multi.getParameter("name2");
	String title2 = multi.getParameter("title2");
	
	String name3 = multi.getParameter("name3");
	String title3 = multi.getParameter("title3");
	
	//파일 정보 가져오기(스택 구조이므로 나중에 저장된 파일 꺼내옴)
	Enumeration<String> files = multi.getFileNames();
	
	String files3 = files.nextElement();
	String filename3 = multi.getFilesystemName(files3);
	
	String files2 = files.nextElement();
	String filename2 = multi.getFilesystemName(files2);
	
	String files1 = files.nextElement();
	String filename1 = multi.getFilesystemName(files1);
%>
<table>
  <tr>
    <th>이 름</th>
    <th>제 목</th>
    <th>파 일</th>
    <th>이미지</th>
  </tr>
  <tr>
  	<td><%=name1 %></td>
  	<td><%=title1 %></td>
  	<td><%=filename1 %></td>
  	<td><img src="../upload/<%=filename1 %>"></td>
  </tr>
  <tr>
  	<td><%=name2 %></td>
  	<td><%=title2 %></td>
  	<td><%=filename2 %></td>
  	<td><img src="../upload/<%=filename2 %>"></td>
  </tr>
  <tr>
  	<td><%=name3 %></td>
  	<td><%=title3 %></td>
  	<td><%=filename3 %></td>
  	<td><img src="../upload/<%=filename3 %>"></td>
  </tr>
  <%-- <%
  	out.print("<tr><td>" + name1 + "</td>");
  	out.print("<td>" + title1 + "</td>");
  	out.print("<td>" + filename1 + "</td></tr>");
  	
  	out.print("<tr><td>" + name2 + "</td>");
  	out.print("<td>" + title2 + "</td>");
  	out.print("<td>" + filename2 + "</td></tr>");
  	
  	out.print("<tr><td>" + name3 + "</td>");
  	out.print("<td>" + title3 + "</td>");
  	out.print("<td>" + filename3 + "</td></tr>");

  %> --%>

</table>