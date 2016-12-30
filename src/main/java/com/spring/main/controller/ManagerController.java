package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ManagerService;



@Controller("ManagerController")
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	ManagerService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	//유저 관리
	@RequestMapping(value = "/usManager")
	public String usManager(){
		logger.info("유저관리");
		return "usManager";
	}
	
	//팀 관리
	@RequestMapping(value = "/teamManager")
	public String teamManager(){
		logger.info("팀 관리");
		return "teamManager";
	}
	
	//장소 관리
	@RequestMapping(value = "/placeManager")
	public String placeManager(){
		logger.info("장소 관리");
		return "placeList";
	}
	
	
			
	//유저 검색 요청
	@RequestMapping(value="/userSearch")
	public @ResponseBody Map<String, Object> userSearch(@RequestParam Map<String, String> params){
		logger.info("검색 요청");
		return service.userSearch(params);
	}
			
	//유저 리스트 요청
	@RequestMapping(value="/userSearchCall")
	public @ResponseBody Map<String, Object> userSearchCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.userSearchCall(params);
	}
	
	//회원삭제
	@RequestMapping(value="/usDelete")
	public ModelAndView usDelete(@RequestParam("idx") String idx){
		return service.usDelete(idx);
	}
	
	
	//팀 리스트 요청
	@RequestMapping(value="/teamSearchCall")
	public @ResponseBody Map<String, Object> teamSearchCall(@RequestParam Map<String, String> params){
		logger.info("팀 리스트 요청");
		return service.teamSearchCall(params);
	}
	
	/*//팀 검색
	@RequestMapping(value="/teamSearch")
	public @ResponseBody Map<String, Object> teamSearch(@RequestParam("input") String input){
		logger.info("팀 검색 요청");
		return service.teamSearch(input);
	}*/
	
	
	//팀 대표 정보
	@RequestMapping(value="/teamSearch")
	public @ResponseBody Map<String, Object> memberInfo(@RequestParam("idx") String idx){
		logger.info("팀대표 정보 요청");
		return service.memberInfo(idx);
	}
}
