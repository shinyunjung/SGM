package com.spring.main.controller;


import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.dto.UserDto;
import com.spring.main.service.BoardService;

@Controller("RestController")
@RequestMapping(value="/rest")
public class RestController {
	
	@Autowired
	BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//중복 체크
	@RequestMapping(value="/overlay")
	public @ResponseBody Map<String, String> overlay(
			@RequestParam("u_id") String u_id){
		logger.info("id 중복확인");
		logger.info("ID chk : {}",u_id);		
		return service.overlay(u_id);
	}
	
	//회원가입
		@RequestMapping(value="/userJoin")
		public @ResponseBody UserDto userJoin(
				@RequestParam Map<String, String> params){
			logger.info("회원 가입");
			return service.userJoin(params);
		}

}
