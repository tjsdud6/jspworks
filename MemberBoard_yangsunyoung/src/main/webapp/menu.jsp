<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
	<c:choose>
		<c:when test="${empty sessionId}">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    </div>
 
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/main.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/boardList.do">게시판</a>
        </li>
       <li class="nav-item">
          <a class="nav-link" href="/memberForm.do">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loginMember.do">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/memberList.do">회원목록</a>
        </li>
      </ul>

       	</c:when>
		<c:otherwise>
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/main.jsp">Home</a>
        </li>
       <li class="nav-item">
          <a class="nav-link" href="/boardList.do">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/memberView.do">나의 정보</a>
        </li>
        <li><a href="/logout.do">
          (<c:out value="${name}" /> 님) 로그아웃</a>
         </li>
        <li class="nav-item">
          <a class="nav-link" href="/memberList.do">회원목록</a>
        </li>
      </ul>
		</c:otherwise>
	</c:choose>
	</nav>


      

	<%-- <nav>
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
	</nav> --%>
</body>
</html>