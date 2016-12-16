package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.service.VidioService;

@Controller("VidioController")
@RequestMapping(value="/vidio")
public class VidioController {
	
	@Autowired
	VidioService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//리스트보여주기
	@RequestMapping(value="/vidioList")
	public @ResponseBody Map<String, Object> vidioList(
		@RequestParam Map<String, String> params){
		logger.info("리스트 보여주기");
		return service.vidioList(params);
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
