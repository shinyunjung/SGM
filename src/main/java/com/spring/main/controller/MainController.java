package com.spring.main.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BoardService;

@Controller("MainController")
public class MainController {
	
	@Autowired
	BoardService service;
	
	//메인페이지
		@RequestMapping(value = "/")
		public String home() {
			
			return "index";
		}
		
		
	//메인페이지
		@RequestMapping(value = "/index")
		public String index() {
			
			return "index";
	}

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);
	}
	
	//회원가입 이동
	@RequestMapping(value="/join")
	public String join() {
		logger.info("회원가입 페이지");
		return "join";
	}
		
	//id찾기
	@RequestMapping(value = "/idFind")
	public String idFind() {
		
		return "idFind";
	}
	//pw찾기
	@RequestMapping(value = "/passFind")
	public String pwFind() {
		
		return "passFind";
	}

	//마이페이지
	@RequestMapping(value = "/myPage")
	public String myPage() {
		return "myPage";
	}
		//팀가입
		@RequestMapping(value = "/teamJoin")
		public String teamJoin() {
			
			return "teamJoin";
		}
		
		
	//회원관리
	@RequestMapping(value = "/usManager")
	public String usManager() {
		logger.info("회원관리");
		return "usManager";
	}
	//팀관리
	@RequestMapping(value = "/teamManager")
	public String teamManager() {
		logger.info("팀관리");
		return "teamManager";
	}
	
	//결과
	@RequestMapping(value = "/result")
	public String result() {
		logger.info("광고수정");
		return "adModify";
	}
	
	//팀 상세보기
	@RequestMapping(value = "/teamDetail")
	public String teamDetail() {
		logger.info("팀 상세보기");
		return "teamDetail";
	}
	
	//팀 일지 상세보기
	@RequestMapping(value = "/tdDetail")
	public String tdDetail() {
		logger.info("팀 일지 상세보기");
		return "tdDetail";
	}
	
	//팀 정보 수정
		@RequestMapping(value = "/teamModify")
		public String teamModify() {
			logger.info("팀 정보 수정");
			return "teamModify";
		}
}
