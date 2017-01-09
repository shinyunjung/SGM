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
	public ModelAndView placeDetail(@RequestParam("idx") String idx) {
		logger.info("장소상세");
		return service.placeDetail(idx);
	}
	//장소쓰기
	@RequestMapping(value = "/placeWrite")
	public String placeWrite() {
		logger.info("장소쓰기");
		return "placeWrite";
	}
	//장소수정
	@RequestMapping(value = "/placeModify")
	public ModelAndView placeModify(@RequestParam("idx") String idx) {
		logger.info("장소수정");
		return service.placeModify(idx);
	}
	
	//리스트 요청
	@RequestMapping(value="/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.listCall(params);
		
	}
	//검색
	@RequestMapping(value="/searchCall")
	public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.searchCall(params);
	}
	//장소 쓰기
	@RequestMapping(value = "/write")
	public ModelAndView write(MultipartHttpServletRequest multi) {
		logger.info("장소쓰기");
		return service.write(multi);
	}
	
	//장소 수정
	@RequestMapping(value = "/modify")
	public ModelAndView modify(MultipartHttpServletRequest multi) {
		logger.info("장소수정");
		return service.modify(multi);
	}
	//장소 삭제
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam("idx") String idx) {
		logger.info("장소삭제");
		return service.delete(idx);
	}
		
}
