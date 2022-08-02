<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	request.setCharacterEncoding("UTF-8");

	//업로드 폴더 경로
	String realFolder = "C:\\Dev\\jspworks\\jweb2\\src\\main\\webapp\\upload";
	
	//5개의 매개변수 설정
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//요청한 파라미터의 name 속성과 value 가져오기
	Enumeration<String> params = multi.getParameterNames(); 
	while(params.hasMoreElements()){ //name 속성이 있다면
		String name = params.nextElement(); //name을 가져와서
		String value = multi.getParameter(name);  //name을 매개로 value 가져옴
		out.print(name + "=" + value + "<br>");
	}
	out.print("============================================<br>");
	
	//요청한 파라미터중 파일(filename)의 속성 가져오기 
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()){ //파일이 있다면 반복
		String name = files.nextElement(); //파일의 이름을 가져오기
		String fileName = multi.getFilesystemName(name); //서버에 업로드된 파일 가져오기
		String original = multi.getOriginalFileName(name); //파일이 서버에 저장되기 전 파일이름
		String type = multi.getContentType(name);   //파일이 콘텐츠 유형
		File file = multi.getFile(name);            //전송된 파일의 정보나 경로
		
		out.println("요청 파라미터 이름: " + name + "<br>");
		out.println("저장 파일 이름: " + fileName + "<br>");
		out.println("원본 파일 이름: " + original + "<br>");
		out.println("파일 컨텐츠 유형: " + type + "<br>");
		
		if(file != null){
			out.println("파일 크기: " + file.length() + "B");
		}
		
%>
<p>이미지 보기</p>
<p><img src="../upload/<%=fileName %>">
<% } %>  <!-- while닫기 -->









