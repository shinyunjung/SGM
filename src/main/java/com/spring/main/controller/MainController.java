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
			
			return "index";
		}
		
		
		//팀가입
		@RequestMapping(value = "/teamJoin")
		public String teamJoin() {
			
			return "teamJoin";
		}
		
		//팀가입
				@RequestMapping(value = "/teamModify")
				public String teamModify() {
					
					return "teamModify";
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
		//장소쓰기
		@RequestMapping(value = "/placeWrite")
		public String placeWrite() {
			logger.info("장소쓰기");
			return "placeWrite";
		}
		//장소수정
		@RequestMapping(value = "/placeModify")
		public String placeModify() {
			logger.info("장소수정");
			return "placeModify";
		}
		//팀일지쓰기
		@RequestMapping(value = "/tdWrite")
		public String tdWrite() {
			logger.info("팀일지쓰기");
			return "tdWrite";
		}
		//팀일지수정
		@RequestMapping(value = "/tdModify")
		public String tdModify() {
			logger.info("팀일지수정");
			return "tdModify";
		}
		//영상쓰기
		@RequestMapping(value = "/vidioWrite")
		public String vidioWrite() {
			logger.info("영상쓰기");
			return "vidioWrite";
		}
		//영상수정
		@RequestMapping(value = "/vidioModify")
		public String vidioModify() {
			logger.info("영상수정");
			return "vidioModify";
		}
		//자유쓰기
		@RequestMapping(value = "/freeWrite")
		public String freeWrite() {
			logger.info("자유쓰기");
			return "freeWrite";
		}
		//자유수정
		@RequestMapping(value = "/freeModify")
		public String freeModify() {
			logger.info("자유수정");
			return "freeModify";
		}
		//결과
		@RequestMapping(value = "/result")
		public String result() {
			logger.info("결과");
			return "result";
		}
}
