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
		<h1>상세보기</h1>
	</div>
		<div class="container">
		<form action="./updateBoard.do" method="post" >
			<input type="hidden" name="bnum" value="${board.bnum}" >
			<table class="table">
				<tr>
					<td class="table-dark">제목</td>
					<td><input type="text" name="title" class="bo_v_title"
							value="${board.title}"></td>
				</tr>
				<tr>
					<td class="table-dark">글쓴이</td>
					<td>
						<input type="text" name="memberId" class="bo_v_id"
							value="${board.memberId}" readOnly="readonly">
					</td>
				</tr>
				<tr>
					<td class="table-dark">내용</td>
					<td>
						<textarea rows="15" cols="80" 
						 name="content"><c:out value="${board.content}" /></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
					<c:if test="${sessionId eq board.memberId}">
						<input type="submit" value="수정" class="btn btn-secondary">
						<a href="./deleteBoard.do?bnum=<c:out value='${board.bnum }' />"
						   onclick="return confirm('정말로 삭제하시겠습니까?')">
							<input type="button" value="삭제" class="btn btn-danger"></a>
					</c:if>
						<a href="./boardList.do"><input type="button" value="목록" class="btn btn-info"></a>
					</td>
				</tr>
				
			</table>
		</form>
		</div>
	</div>
		
		

	<jsp:include page="../footer.jsp" />
</body>
</html>