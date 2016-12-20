package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.main.service.TdService;

@Controller("TdController")
@RequestMapping(value="/td")
public class TdController {
	
	@Autowired
	TdService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//팀일지리스트
	@RequestMapping(value = "/tdList")
	public String tdList() {
		logger.info("팀일지리스트");
		return "tdList";
	}
	//팀일지상세
	@RequestMapping(value = "/tdDetail")
	public String tdDetail() {
		logger.info("팀일지상세");
		return "tdDetail";
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

}
