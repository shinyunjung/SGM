package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("MainController")
public class MainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/")
	public String home(){
		logger.info("홈 요청");
		return "index";
	}
	
}
