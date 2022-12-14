<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="vo.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");	//한글 인코딩
	
	String realFolder = "C:/Dev/jspworks/WebMarket2/src/main/webapp/upload";
	int maxSize = 5 * 1024 * 1024; //최대용량 5MB
	String encType = "utf-8";
	
	//파라미터 -  5개 (request, 경로, 용량, 타입유형, 정책클래스)
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType , new DefaultFileRenamePolicy());
	
	//multi로 폼 입력값 받기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	
	//숫자 자료형 변환
	int price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitsInStock);
	}
	
	//이미지 파일 가져오기
	Enumeration<?> files = multi.getFileNames();//파일 가져오기 반복
	String fname = (String)files.nextElement();	//파일 이름
	String productImage = multi.getFilesystemName(fname); //이미지 파일
	
	//수정 처리
	PreparedStatement pstmt = null;
	if(productImage != null){
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, "
				+ "p_category = ?, p_unitsInStock =?, p_condition =?, p_productImage = ? WHERE p_id =? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productImage);
		pstmt.setString(9, productId);
		pstmt.executeUpdate();
	}else{
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, "
				+ "p_category = ?, p_unitsInStock =?, p_condition =? WHERE p_id =? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();
	}
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	//페이지 이동
	response.sendRedirect("./editProduct.jsp?edit=update");
	
	
%>