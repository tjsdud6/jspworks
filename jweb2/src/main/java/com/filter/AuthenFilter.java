package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//Filter servlet 임포트 해야함! 
public class AuthenFilter implements Filter {
	
	//마우스 우클릭 소스 -> 오버라이드 -> 필터에 있는거 오버라이드 함 
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	
		// 필터 등록
		
		//1번. 한글 인코딩 요청 
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String name = request.getParameter("name");
		
		//2번. 입력값이 없을 경우 필터 처리
		if(name == null || name.equals("")) {
			writer.println("입력 된 값은 null 입니다.");
			return;	//프로그램을 정상 종료
			//종료 하지 않을 경우, filter01 내용이 출력 됨
		}
		
		//실행 함수
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter01 해제");
	}





}
