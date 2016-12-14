package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.main.service.BoardService;
import com.spring.main.service.PlaceService;

@Controller("PlaceController")
@RequestMapping(value="/place")
public class PlaceController {
	
	@Autowired
	PlaceService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//장소목록
	@RequestMapping(value = "/placeList")
	public String placeList() {
		
		return "placeList";
	}
	//장소상세
	@RequestMapping(value = "/placeDetail")
	public String placeDetail() {
		logger.info("장소상세");
		return "placeDetail";
	}
	//장소쓰기
	@RequestMapping(value = "/placeWrite")
	public String placeWrite() {
		logger.info("장소쓰기");
		return "placeWrite";
	}
	//장소수정
	@RequestMapping(value = "/placeModify")
	public String placeModify() {
		logger.info("장소수정");
		return "placeModify";
	}

}
