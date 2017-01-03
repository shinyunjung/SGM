package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.AdService;

@Controller("AdController")
@RequestMapping(value="/ad")
public class AdController {
	
	@Autowired
	AdService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//광고리스트
	@RequestMapping(value = "/adList")
	public String adList() {
		logger.info("광고리스트");
		return "adList";
	}
	//광고상세
	@RequestMapping(value = "/adDetail")
	public ModelAndView adDetail(@RequestParam("ad_idx") String ad_idx) {
		logger.info("광고상세");
		return service.adDetail(ad_idx);
	}
	//광고쓰기
	@RequestMapping(value = "/adWrite")
	public String adWrite() {
		logger.info("광고쓰기");
		return "adWrite";
	}
	//광고수정
	@RequestMapping(value = "/adModify")
	public String adModify() {
		logger.info("광고수정");
		return "adModify";
	}
	
	//광고리스트
	@RequestMapping(value = "/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params) {
		logger.info("리스트불러오기");
		return service.listCall(params);
	}
	
	//광고등록
	@RequestMapping(value = "/write")
	public ModelAndView write(MultipartHttpServletRequest multi){
		logger.info("글쓰기 요청");
		return service.write(multi);
	}
}
