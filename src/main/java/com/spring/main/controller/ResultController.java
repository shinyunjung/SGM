package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ResultService;

@Controller("ResultController")
@RequestMapping(value="/result")
public class ResultController {
	
	@Autowired
	ResultService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//매칭결과
	@RequestMapping(value = "/eva")
	public String result(){
		logger.info("매칭결과");
		return "result";
	}
	
	//무승부
	@RequestMapping(value = "/tie")
	public ModelAndView tie(){
		logger.info("무승부");
		return service.tie();
	}
}
