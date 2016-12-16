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

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//메인페이지
	@RequestMapping(value = "/")
	public String home() {
		
		return "login";
	}
	
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);
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
	
	//결과
	@RequestMapping(value = "/result")
	public String result() {
		logger.info("광고수정");
		return "adModify";
	}
	
}
