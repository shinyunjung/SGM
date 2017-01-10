package com.spring.main.controller;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.NoteDto;
import com.spring.main.service.ManagerService;
import com.spring.main.service.NoteService;

@Controller("NoteController")
@RequestMapping(value="/note")
public class NoteController {
	@Autowired
	NoteService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//쪽지함 페이지 이동
	@RequestMapping(value = "/msgPage")
	public ModelAndView msgPage(@RequestParam Map<String, String> params) {
		
		return service.msgPage(params);
	}
	
	
	//쪽지함 리스트요청
	@RequestMapping(value="/searchCall")
	public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return service.searchCall(params);
	}
	
	//검색 요청
	@RequestMapping(value="/search")
	public @ResponseBody Map<String, Object> search(@RequestParam Map<String, String> params){
		logger.info("검색 요청");
		return service.search(params);
	}
	
	//새로운 쪽지 리스트
	@RequestMapping(value="/newListCall")
	public @ResponseBody Map<String, ArrayList<NoteDto>> newListCall(@RequestParam("idx") String idx){
		logger.info("검색 요청");
		return service.newListCall(idx);
	}
	
	//쪽지
	@RequestMapping(value = "/sendNote")
	public ModelAndView sendNote(@RequestParam Map<String, String> params) {
		logger.info("쪽지응답");
		return service.sendNote(params);
	}
	
	//쪽지 삭제
	@RequestMapping(value="/deleteNote")
	public @ResponseBody Map<String, String> deleteNote(@RequestParam("idx") String idx){
		logger.info("검색 요청");
		return service.deleteNote(idx);
	}
	
	
	//쪽지 갯수
	@RequestMapping(value="/countNote")
	public @ResponseBody Map<String, Integer> countNote(@RequestParam("idx") String idx){
		logger.info("쪽지 검색 요청");
		logger.info("idx:{}",idx);
		return service.countNote(idx);
	}
	
}
