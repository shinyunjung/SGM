package com.spring.main.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.SelectTeamDto;
import com.spring.main.dto.UserDto;
import com.spring.main.service.BoardService;

@Controller("MainController")
public class MainController {
	
	@Autowired
	BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	//메인페이지
		@RequestMapping(value = "/loginPage")
		public String login() {
					
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
	
	//회원가입 이동
	@RequestMapping(value="/join")
	public String join() {
		logger.info("회원가입 페이지");
		return "join";
	}
	
	//아이디 중복체크
	@RequestMapping(value="/overlay")
	public @ResponseBody Map<String, String> overlay(@RequestParam("id") String id){
		logger.info("아이디 중복체크");
		return service.overlay(id);
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
		
		
	//팀관리
	@RequestMapping(value = "/teamManager")
	public String teamManager() {
		logger.info("팀관리");
		return "teamManager";
	}
	
	//팀 상세보기
	@RequestMapping(value = "/teamDetail")
	public String teamDetail() {
		logger.info("팀 상세보기");
		return "teamDetail";
	}
	
	//회원이 속한 정보 찾기
	@RequestMapping(value = "/selectTeam")
	public @ResponseBody Map<String, ArrayList<SelectTeamDto>> selectTeam(@RequestParam("idx") String idx) {
		logger.info("회원이 속한 팀 정보 찾기");
		return service.selectTeam(idx);
	}
	
	//회원 정보 찾기
	@RequestMapping(value = "/userSearch")
	public @ResponseBody Map<String, UserDto> userSearch(@RequestParam Map<String, String> params) {
		logger.info("회원정보 찾기");
		return service.userSearch(params);
	}
}
