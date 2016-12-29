package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("MainController")
public class MainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//이동수단
	@RequestMapping(value = "/")
	public String home() {
		
		return "page";

	}
	
	//메인페이지
	@RequestMapping(value = "/msgpage")
	public String index() {
		
		return "msgpage";
	}
	
	//로그인
	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		
		return "login";
	}
	
	//매칭게시판
	@RequestMapping(value = "/matchList")
	public String matchList() {
			
			return "matchList";
	}
	
	//장소목록
	@RequestMapping(value = "/placeList")
	public String placeList() {
				
			return "placeList";
	}
	
	//팀 게시판
	@RequestMapping(value = "/teamList")
	public String teamList() {
				
			return "teamList";
	}	
	
	//영상게시판
	@RequestMapping(value = "/vidioList")
	public String vidioList() {
					
			return "vidioList";
	}
	
	//팀 게시판
	@RequestMapping(value = "/freeList")
	public String freeList() {
					
			return "freeList";
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
	//마이페이지
	@RequestMapping(value = "/myPage")
	public String myPage() {
		
		return "myPage";
	}
	//회원정보수정
	@RequestMapping(value = "/userModify")
	public String userModify() {
		
		return "userModify";
	}
	//쪽지리스트
	@RequestMapping(value = "/msgPage")
	public String msgPage() {
		
		return "msgPage";
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
	
	//광고목록
	@RequestMapping(value = "/adList")
	public String adList() {
		logger.info("광고목록");
		return "adList";
	}
	

	//쪽지함
		@RequestMapping(value = "/msg")
		public String msg() {
			logger.info("쪽지함");
			return "msgpage";
		}
	
	

	//매칭 상세보기
	@RequestMapping(value = "/matchDetail")
	public String matchDetail() {
		logger.info("매칭 상세보기");
		return "matchDetail";
	}
	
	//매칭 글작성
		@RequestMapping(value = "/matchWrite")
		public String matchWrite() {
			logger.info("매칭 상세보기");
			return "matchWrite";
		}
	
	
}
