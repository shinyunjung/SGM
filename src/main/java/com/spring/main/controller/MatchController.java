package com.spring.main.controller;

import java.text.ParseException;
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
import com.spring.main.dto.RepleDto;
import com.spring.main.service.MatchService;

@Controller("MatchController")
@RequestMapping(value="/match")
public class MatchController {
	
	@Autowired
	MatchService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private static boolean modFlag = false;
	//매칭게시판
	@RequestMapping(value = "/matchList")
	public String matchList() {
		
		return "matchList";
	}
	
	//리스트 요청
		@RequestMapping(value="/listCall")
		public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
			logger.info("리스트 요청");
			return service.listCall(params);
		}
		
		//검색 요청
		@RequestMapping(value="/search")
		public @ResponseBody Map<String, Object> search(@RequestParam Map<String, String> params){
			logger.info("검색 요청");
			return service.search(params);
		}
		
		//검색 후 리스트 요청
		@RequestMapping(value="/searchCall")
		public @ResponseBody Map<String, Object> searchCall(@RequestParam Map<String, String> params){
			logger.info("리스트 요청");
			return service.searchCall(params);
		}
	
	
	//매칭상세
	@RequestMapping(value = "/matchDetail")
	public ModelAndView matchDetail(@RequestParam Map<String, String> params) {
		logger.info("매칭상세");
		modFlag=false;
		return service.detail(params, modFlag);
	}
	
	
	//댓글 등록
	@RequestMapping(value = "/replyRegist")
	public @ResponseBody Map<String, String> replyRegist(@RequestParam Map<String, String> params) {
		logger.info("매칭댓글등록");
		return service.replyRegist(params);
	}
	
	//댓글 요청	
	@RequestMapping(value="/replyList")
	public @ResponseBody Map<String, ArrayList<RepleDto>> replyList(@RequestParam Map<String, String> params){
		logger.info("댓글 리스트 요청");
		return service.replyList(params);
	}
	
	
	//댓글 삭제
	@RequestMapping(value="/replyDel")
	public @ResponseBody Map<String, String> replyDel(@RequestParam Map<String, String> params){
		logger.info("삭제 요청");
		return service.replyDel(params);
	}
	
	//매칭쓰기페이지 이동
	@RequestMapping(value = "/matchWrite")
	public String matchWrite() {
		logger.info("쓰기페이지 이동");
		return "matchWrite";
	}
	
	//글작성 권한 검색
	@RequestMapping(value = "/memberCheck")
	public ModelAndView memberCheck(@RequestParam("idx") String idx) {
		logger.info("권한 검색");
		return service.memberCheck(idx);
	}
	
	//매칭쓰기
	@RequestMapping(value = "/write")
	public ModelAndView write(@RequestParam Map<String, String> params) {
		logger.info("매칭쓰기");
		return service.write(params);
	}
	
	//매칭목록
	@RequestMapping(value = "/areaList")
	public @ResponseBody Map<String, ArrayList<AreaDto>> areaList(@RequestParam Map<String, String> params) {
		logger.info("매칭목록");
		return service.areaList(params);
	}
	
	//장소결정
	@RequestMapping(value = "/areaMap")
	public ModelAndView areaMap(@RequestParam("lat") String lat) {
		logger.info("장소 결정");
		return service.areaMap(lat);
	}
	
	
	//매칭수정페이지
	@RequestMapping(value = "/matchModify")
	public ModelAndView matchModify(@RequestParam Map<String, String> params) {
		logger.info("매칭수정");
		modFlag=true;
		return service.detail(params, modFlag);
	}
	
	//수정
	@RequestMapping(value = "/modify")
	public ModelAndView modify(@RequestParam Map<String, String> params) {
		logger.info("매칭수정");
		return service.modify(params);
	}
	
	
	//삭제
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam("idx") String idx) {
		logger.info("매칭삭제");
		String category="4";
		return service.delete(idx, category);
	}
	
	
	//경기일정
	@RequestMapping(value = "/calendar")
	public String calendar() {
		
		return "calendar";
	}
}
