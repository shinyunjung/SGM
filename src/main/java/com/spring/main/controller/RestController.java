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

@Controller("RestController")
@RequestMapping(value="/rest")
public class RestController {
	
	@Autowired
	VidioService VidioService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//리스트 요청
		@RequestMapping(value="/v_listCall")
		public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
			logger.info("비디오 리스트 요청");
			return VidioService.v_listCall(params);
		}
		
		//검색 요청
		@RequestMapping(value="/v_search")
		public @ResponseBody Map<String, Object> search(@RequestParam Map<String, String> params){
			logger.info("검색 요청");
			return VidioService.v_search(params);
		}
		
		//검색 후 리스트 요청
		@RequestMapping(value="/v_searchCall")
		public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
			logger.info("리스트 요청");
			return VidioService.v_searchCall(params);
		}
}
