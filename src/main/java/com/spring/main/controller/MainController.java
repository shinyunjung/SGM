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
		
		//팀상세
		@RequestMapping(value = "/teamDetail")
		public String teamDetail() {
			logger.info("팀상세");
			return "teamDetail";
		}
		//매칭쓰기
		@RequestMapping(value = "/matchWrite")
		public String matchWrite() {
			logger.info("매칭쓰기");
			return "matchWrite";
		}
		//매칭수정
		@RequestMapping(value = "/matchModify")
		public String matchModify() {
			logger.info("매칭수정");
			return "matchModify";
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
	
	
	//장소목록 상세보기
	@RequestMapping(value = "/placeDetail")
	public String placeDetail() {
		logger.info("장소목록 상세보기");
		return "placeDetail";
	}
	
	//영상 상세보기
	@RequestMapping(value = "/vidioDetail")
	public String vidioDetail() {
		logger.info("영상 상세보기");
		return "vidioDetail";
	}
	
	//자유 상세보기
	@RequestMapping(value = "/freeDetail")
	public String freeDetail() {
		logger.info("영상 상세보기");
		return "freeDetail";
	}
	
}
