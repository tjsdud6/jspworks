<%@ page import="vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="execeptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>--%>
 <%
	String id = request.getParameter("id");
	//dao 상세 보기 메소드 호출
	ProductRepository productDAO = ProductRepository.getInstance();
	Product product = productDAO.getProductById(id);
%>
<script type="text/javascript">
	function addToCart(){
		let form = document.addForm;
		
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			form.submit();
		}else{
			form.reset();
		}
	}
</script>

<body>
   <%-- <%@ include file="./menu.jsp" %> --%>
   <jsp:include page="./menu.jsp"/>

   <!-- <h1>웹 쇼핑몰에 오신 것을 환영합니다.</h1> -->
   <!-- <h3>Welcome to Web Market !</h3> -->
   
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 정보</h1>
      </div>
   </div>

   <div class="container">
   		<div class="row" align="center">
   			<div class="col-md-5">
   				<img src="./upload/<%=product.getProductImage()%>" style="width:100%">
   			</div>
   			<div class="col-md-6">
   				<h3><%=product.getPname() %></h3>
   				<p><%=product.getDescription() %></p>
   				<p><b>상품 코드: </b> <span class="badge badge-danger">
   				<%=product.getProductId() %></span></p>
   				<p><b>제조사: </b><%=product.getManufacturer() %></p>
   				<p><b>분류: </b><%=product.getCategory() %></p>
   				<p><b>재고수: </b><%=product.getUnitsInStock() %></p>
   				<p><%=product.getUnitPrice() %></p>
   				<p>
	   				<form action="./addCart.jsp?id=<%=product.getProductId() %>" method="post" name="addForm">
	   					<a href="#" onclick="addToCart()" class="btn btn-info">상품 주문 &raquo;</a>
	   					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
	   					<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
	   				</form>
   				</p>
   			</div>
      </div>
   </div>
</body>
<%-- <%@ include file="./footer.jsp" %> --%>
<jsp:include page="./footer.jsp"/>
</html>