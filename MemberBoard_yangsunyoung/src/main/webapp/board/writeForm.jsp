<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome~ </title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
	*{margin: 0; padding: 0;}
	li{list-style: none;}
	a{text-decoration: none; color: #000;}
	nav{margin-top: 20px; text-align: right; margin-right: 100px;}
	nav li{display: inline-block; margin: 10px; 
    border-top: 3px solid #D3CEDF; padding: 10px 15px;}
    ul {display: inline-block; margin:0 auto;}    
    #container{width: 100%; margin: 0 auto; text-align: center;}
	.title{height: 130px; background: #F2D7D9; line-height: 130px;
    margin-bottom: 20px;}
    h1{font-size: 48px;}
    
</style>
</head>
<body>
	<%-- <jsp:include page="../menu.jsp"/> --%>
	<div>
	<nav>
	<c:choose>
		<c:when test="${empty sessionId}">
		<ul>
			<li><a href="/main.jsp">Home</a></li>
			<li><a href="/boardList.do">게시판</a></li>
			<li><a href="/memberForm.do">회원가입</a></li>
			<li><a href="/loginMember.do">로그인</a></li>
			<li><a href="/memberList.do">회원목록</a></li>
		</ul>
		</c:when>
		<c:otherwise>
		<ul>
			<li><a href="/main.jsp">Home</a></li>
			<li><a href="/boardList.do">게시판</a></li>
			<li><a href="/memberView.do">나의 정보</a></li>
			<li><a href="/logout.do">(<c:out value="${name}" /> 님) 로그아웃</a></li>
			<li><a href="/memberList.do">회원목록</a></li>
		</ul>
		</c:otherwise>
	</c:choose>
	</nav>
	</div>

	<div id="container">
		<div class="title">
			<h1>글쓰기</h1>
		</div>

	<div class="container">
		<div class="text-center">
			<form action="./writeProcess.do" method="post">
				<table class="table table-dark">
					<tr>
						<td><textarea rows="1" cols="100" name="title"
								required="required" placeholder="글 제목" required="required"></textarea>
						</td>
					</tr>
					<tr class="table-dark">
						<td><textarea rows="15" cols="130" name="content"
								required="required" placeholder="글 내용"></textarea></td>
					</tr>
					<tr class="table-light">
						<td colspan="2"><input type="submit" value="글쓰기" class="btn btn-info"> 
						<input type="reset" value="취소" class="btn btn-danger"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
		</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>