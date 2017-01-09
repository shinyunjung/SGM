package com.spring.main.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	//컨트롤러 요청 전에 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터!!!!!");
		
		//반환 값이 true여야 컨트롤러로 이동
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("userId"));
		boolean pass=false;
		if(session.getAttribute("userId")==null){
			response.sendRedirect("/main/");//서버 이름
		}else{
			pass=true;
		}
		
		return pass;
	}
	
	//컨트롤러 요청 후(jsp 전송 전)
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView mav) throws Exception {
			/*HttpSession session=request.getSession();
			mav.addObject("userInfo", session);
			mav.addObject("msg","로그인 된 사용자 입니다.");*/
			
		}
	
}

