<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatNumber 태그</title>
</head>
<body>
	<h2>숫자를 다양한 형식으로 표기</h2>
	<p> 숫자 : <fmt:formatNumber value="3200100"/>					<!-- 3200100 -> 천 단위 부등기호가 들어감 -->
	<p><fmt:formatNumber value= "3200100" type="number"/>			<!-- 3200100 -> 천 단위 부등기호가 들어감 -->
	<p><fmt:formatNumber value= "3200100" groupingUsed="false"/>	<!-- 3200100 -> 천 단위 부등기호 없음-->
	<p><fmt:formatNumber value= "3200100" groupingUsed="true"/>		<!-- 3200100 -> 천 단위 부등기호 들어감-->
	<p><fmt:formatNumber value="3200100" pattern="#,##0.0"/>		<!-- pattern 속성: #,##0.00 (0은 0으로 채움)-->
	
	
	<p>통화 : <fmt:formatNumber value="3200100" type="currency"/> 	<!-- 원 단위 표시, 부등기호 -->
	<p>통화 : <fmt:formatNumber value="3200100" type="currency" 
			currencySymbol = "\\"/> 								<!-- 역슬래쉬2개를 넣어야 원화표시로 바뀜!-->
	
	<p>퍼센트: <fmt:formatNumber value="0.25" type="percent"/>		<!-- %로 표시 -->
	
</body>
</html>