package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.main.service.VidioService;

@Controller("VidioController")
@RequestMapping(value="/vidio")
public class VidioController {
	
	@Autowired
	VidioService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//영상게시판
	@RequestMapping(value = "/vidioList")
	public String vidioList() {
		
		return "vidioList";
	}
	//영상상세
	@RequestMapping(value = "/vidioDetail")
	public String vidioDetail() {
		logger.info("영상상세");
		return "vidioDetail";
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

}
