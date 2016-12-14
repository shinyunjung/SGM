package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("MainController")
public class MainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	//메인페이지
		@RequestMapping(value = "/")
		public String home() {
			
			return "page";
		}
	//메인페이지
	@RequestMapping(value = "/index")
	public String index() {
		
		return "index";
	}
	
		
		//로그인
		@RequestMapping(value = "/loginForm")
		public String loginForm() {
			
			return "login";
		}
		//id찾기
		@RequestMapping(value = "/idFind")
		public String idFind() {
			
			return "idFind";
		}
		//pw찾기
		@RequestMapping(value = "/pwFind")
		public String pwFind() {
			
			return "pwFind";
		}
		//회원가입
		@RequestMapping(value = "/join")
		public String join() {
			
			return "join";
		}
	
}
