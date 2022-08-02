package com.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvc01")
public class MvcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//배열 자료
		String[] name = {"김산", "이강", "정들"};
		
		//ArrayList 자료
		ArrayList<Integer> lotto = new ArrayList<>();
		lotto.add(16);
		lotto.add(77);
		lotto.add(4);
		lotto.add(83);
		lotto.add(69);
		lotto.add(33);
		
		//model
		request.setAttribute("names", name); //jsp쪽으로 names를 보냄
		
		request.setAttribute("lottoList", lotto); //jsp-> lottoList
		
		//포워딩
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/mvc/mvc01.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
