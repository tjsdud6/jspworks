package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Board;
import com.model.BoardDAO;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      response.setContentType("text/html; charset=utf-8"); //문서 유형(html/text)응답
      request.setCharacterEncoding("utf-8"); //한글 인코딩 요청 
      
      String uri = request.getRequestURI();  //도메인 주소의 경로(path)
      System.out.println(uri);   //localhost:8080/main.jsp
      
      //substring(index); index이후 모든 문자열 추출
      String command = uri.substring(uri.lastIndexOf("/"));   //  - /main.jsp
      System.out.println(command);
      
      String nextPage = null;
      BoardDAO dao = BoardDAO.getInstance();  //클래스 이름으로 직접 접근
      HttpSession session = request.getSession();
      
      if(command.equals("/boardListAction.do")) {
         
         ArrayList<Board> boardList = dao.getBoardList();
         //model 보내줌 - "boardList"
         request.setAttribute("boardList", boardList);
         //view
         nextPage = "/board/boardList.jsp";
      }else if(command.equals("/boardWriteForm.do")) {
    	  String id =  (String)session.getAttribute("sessionId");
    	  String name = dao.getNameByLogin(id);
    	  
    	  //model -
    	  request.setAttribute("name", name);
    	  nextPage = "/board/boardWriteForm.jsp";
    	  
      }else if(command.equals("/boardWriteAction.do")) {
    	  //폼 데이터 수집
    	  String id = request.getParameter("id");
    	  String name = request.getParameter("name");
    	  String subject = request.getParameter("subject");
    	  String content = request.getParameter("content");
    	  
    	  //작성한 일시
    	  Date date = new Date();
    	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
    	  String writeDate = formatter.format(date);
    	  
    	  //객체 생성 및 데이터 셋
    	  Board board = new Board();
    	  board.setId(id);
    	  board.setName(name);
    	  board.setSubject(subject);
    	  board.setContent(content);
    	  board.setWriteDate(writeDate);
    	  
    	  dao.insertBoard(board);
    	  
    	  //view
    	  nextPage = "/boardListAction.do";
      }else if(command.equals("/boardView.do")) {
    	  String num = request.getParameter("num");
    	  Board board = dao.getBoard(Integer.parseInt(num));	//num을 숫자로 변환
    	  request.setAttribute("board", board);
    	  nextPage ="/board/boardView.jsp";
      }
      
      //nextPage를 포워딩 함
      RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
      dispatcher.forward(request, response);
   
   }

}