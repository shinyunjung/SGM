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
			
	//글작성보기
    @RequestMapping(value="/vidioWrite")
    public String vidioWrite() {
       logger.info("글보기");
       return "vidioWrite";
    }
	//영상쓰기
	@RequestMapping(value = "/write")
	public ModelAndView write(MultipartHttpServletRequest multi){
		logger.info("영상쓰기");
		return VidioService.write(multi);
	}
	//상세보기
    @RequestMapping(value="/vidioDetail")
    public ModelAndView vidioDetail(
          @RequestParam("idx") String idx ){
       logger.info("상세보기");
       return VidioService.vidioDetail(idx);
    }
    //글 삭제
    @RequestMapping(value="/delete")
    public ModelAndView delete(
          @RequestParam("idx") String idx){
       logger.info("글 삭제");
       return VidioService.delete(idx);
    }
    //수정 페이지 이동
    @RequestMapping(value="/vidioModify")
    public ModelAndView vidioModify(
          @RequestParam("idx") String idx ){
       logger.info("수정페이지 이동");
       return VidioService.vidioModify(idx);
    }
    //수정
    @RequestMapping(value="/modify")
    public ModelAndView modify(MultipartHttpServletRequest multi){
       logger.info("수정 요청");
       return VidioService.modify(multi);
    }

}
