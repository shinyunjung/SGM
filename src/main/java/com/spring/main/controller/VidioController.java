package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.VidioService;

@Controller("VidioController")
@RequestMapping(value="/vidio")
public class VidioController {
	
	@Autowired
	VidioService VidioService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//영상게시판 이동
	@RequestMapping(value="/vidioList")
	public String vidioList() {
		logger.info("비디오리스트");
		return "vidioList";
	}
			
	
	//리스트 요청
	@RequestMapping(value="/v_listCall")
		public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
		logger.info("비디오 리스트 요청");
		return VidioService.v_listCall(params);
	}
			
	//검색 요청
	@RequestMapping(value="/v_search")
		public @ResponseBody Map<String, Object> v_search(
				@RequestParam Map<String, String> params){
		logger.info("검색 요청");
		return VidioService.v_search(params);
	}
			
	//검색 후 리스트 요청
	@RequestMapping(value="/v_searchCall")
	public @ResponseBody Map<String, Object> v_searchCall(
			@RequestParam Map<String, String> params){
		logger.info("리스트 요청");
		return VidioService.v_searchCall(params);
	}
	//글작성보기
    @RequestMapping(value="/vidioWrite")
    public String freeWrite() {
       logger.info("글보기");
       return "vidioWrite";
    }
	//영상쓰기
	@RequestMapping(value = "/Write")
	public ModelAndView vidioWrite(
			@RequestParam Map<String, String> params){
		logger.info("영상쓰기");
		return VidioService.Write(params);
	}
	//상세보기
    @RequestMapping(value="/vidioDetail")
    public ModelAndView vidioDetail(
          @RequestParam("j_idx") String j_idx ){
       logger.info("상세보기");
       return VidioService.vidioDetail(j_idx);
    }
    //글 삭제
    @RequestMapping(value="/delete")
    public ModelAndView delete(
          @RequestParam("j_idx") String j_idx){
       logger.info("글 삭제");
       return VidioService.delete(j_idx);
    }
    //수정 페이지 이동
    @RequestMapping(value="/vidioModify")
    public ModelAndView vidioModify(
          @RequestParam("j_idx") String j_idx ){
       logger.info("수정페이지 이동");
       return VidioService.vidioModify(j_idx);
    }
    //수정
    @RequestMapping(value="/update")
    public ModelAndView update(
          @RequestParam Map<String, String> params
          ){
       logger.info("수정 요청");
       return VidioService.update(params);
    }

}
