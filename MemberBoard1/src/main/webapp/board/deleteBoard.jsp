<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardD" class="w" scope="application"/>

<%	

	//글 번호 넘겨받기
	int bnum = Integer.parseInt(request.getParameter("bnum")) ;	
	
	if(session.getAttribute("sessionId") != null){
		//삭제 처리
		boardDAO.deleteBoard(bnum);
		out.println("<script>");
		out.println("alert('게시글을 삭제했습니다.')");
		out.println("location.href='./boardList.jsp'");
		out.println("</script>");
	}

	//페이지 이동
	//response.sendRedirect("./boardList.jsp");
%>