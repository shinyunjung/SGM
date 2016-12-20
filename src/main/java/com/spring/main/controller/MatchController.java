package com.spring.main.controller;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.AreaDto;
import com.spring.main.service.MatchService;

@Controller("MatchController")
@RequestMapping(value="/match")
public class MatchController {
	
	@Autowired
	MatchService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//매칭게시판
	@RequestMapping(value = "/matchList")
	public String matchList() {
		
		return "matchList";
	}
	//매칭상세
	@RequestMapping(value = "/matchDetail")
	public String matchDetail() {
		logger.info("매칭상세");
		return "matchDetail";
	}
	//매칭쓰기페이지 이동
	@RequestMapping(value = "/matchWrite")
	public String matchWrite() {
		logger.info("매칭쓰기");
		return "matchWrite";
	}
	
	//매칭쓰기
	@RequestMapping(value = "/write")
	public ModelAndView write(@RequestParam Map<String, String> params) {
		logger.info("매칭쓰기");
		return service.write(params);
	}
	
	//매칭쓰기
	@RequestMapping(value = "/areaList")
	public @ResponseBody Map<String, ArrayList<AreaDto>> areaList(@RequestParam Map<String, String> params) {
		logger.info("매칭쓰기");
		return service.areaList(params);
	}
	
	//매칭쓰기
	@RequestMapping(value = "/areaMap")
	public ModelAndView areaMap(@RequestParam("lat") String lat) {
		logger.info("장소 결정");
		return service.areaMap(lat);
	}
	
	
	//매칭수정
	@RequestMapping(value = "/matchModify")
	public String matchModify() {
		logger.info("매칭수정");
		return "matchModify";
	}
	//경기일정
	@RequestMapping(value = "/calendar")
	public String calendar() {
		
		return "calendar";
	}
}
