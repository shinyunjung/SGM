package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.service.PlaceService;

@Controller("RestController")
@RequestMapping(value="/rest")
public class RestController {
	
	@Autowired
	PlaceService PlaceService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//리스트 요청
	@RequestMapping(value="/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return PlaceService.listCall(params);
	}
	
	@RequestMapping(value="/searchCall")
	public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return PlaceService.searchCall(params);
	}
}
