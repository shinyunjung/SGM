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

import com.spring.main.dto.RepleDto;
import com.spring.main.service.FreeService;


@Controller("FreeController")
@RequestMapping(value="/free")
public class FreeController {
	
	@Autowired
	   FreeService FreeService;
	   
	   private Logger logger = LoggerFactory.getLogger(this.getClass());

	   
	   
	 //자유게시판 이동
		@RequestMapping(value="/freeList")
		public String freeList() {
			logger.info("자유리스트 뛰우기");
			return "freeList";
			}
		
	   //리스트 요청
	      @RequestMapping(value="/f_listCall")
	      public @ResponseBody Map<String, Object> listCall(
	    		  @RequestParam Map<String, String> params){
	         logger.info("자유리스트 리스트 요청");
	         return FreeService.f_listCall(params);
	      }
	      
	    //글작성보기
			@RequestMapping(value="/freeWrite")
			public String freeWrite() {
				logger.info("글보기");
				return "freeWrite";
			}
			
			//글쓰기 (일반글쓰기)
			@RequestMapping(value="/write")
			public ModelAndView write(
					@RequestParam Map<String, String> params
					){
				logger.info("글쓰기 요청");
				return FreeService.write(params);	
			}	
					
	  	//상세보기
	  		@RequestMapping(value="/freeDetail")
	  		public ModelAndView login(
	  				@RequestParam("idx") String idx ){
	  			logger.info("상세보기");
	  			return FreeService.freeDetail(idx);
	  		}
	  	//글 삭제
	  		@RequestMapping(value="/delete")
	  		public ModelAndView delete(
	  				@RequestParam("idx") String idx){
	  			logger.info("글 삭제");
	  			return FreeService.delete(idx);
	  		}
	  		
	  	//수정 페이지 이동
	  		@RequestMapping(value="/freeModify")
	  		public ModelAndView freeModify(
	  				@RequestParam("idx") String idx ){
	  			logger.info("수정페이지 이동");
	  			return FreeService.freeModify(idx);
	  		}
	  	//수정
	  		@RequestMapping(value="/update")
	  		public ModelAndView update(
	  				@RequestParam Map<String, String> params
	  				){
	  			logger.info("수정 요청");
	  			return FreeService.update(params);
	  		}
	  	

	  		
	}


