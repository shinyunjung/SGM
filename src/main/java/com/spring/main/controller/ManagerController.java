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
	
	
	//매칭결과
	@RequestMapping(value = "/usManager")
	public String usManager(){
		logger.info("유저관리");
		return "usManager";
	}
	
	
	//리스트 요청
	@RequestMapping(value="/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.listCall(params);
		}
			
	//검색 요청
	@RequestMapping(value="/search")
	public @ResponseBody Map<String, Object> search(@RequestParam Map<String, String> params){
		logger.info("검색 요청");
		return service.search(params);
	}
			
	//검색 후 리스트 요청
	@RequestMapping(value="/searchCall")
	public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.searchCall(params);
	}
	
	//회원삭제
	@RequestMapping(value="/usDelete")
	public ModelAndView usDelete(@RequestParam("idx") String idx){
		return service.usDelete(idx);
	}
	
}
