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
	      
	      //검색 요청
	      @RequestMapping(value="/f_search")
	      public @ResponseBody Map<String, Object> search(
	    		  @RequestParam Map<String, String> params){
	         logger.info("검색 요청");
	         return FreeService.f_search(params);
	      }
	      
	      //검색 후 리스트 요청
	      @RequestMapping(value="/f_searchCall")
	      public @ResponseBody Map<String, Object> searchCall(
	    		  @RequestParam Map<String, String> params){
	         logger.info("리스트 요청");
	         return FreeService.f_searchCall(params);
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
	  		public String freeDetail() {
	  			logger.info("자유리스트 상세보기");
	  			return "freeDetail";
	  		}

	  		
	}


