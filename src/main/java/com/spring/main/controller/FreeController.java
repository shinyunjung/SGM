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
	  		public ModelAndView login(
	  				@RequestParam("j_idx") String j_idx ){
	  			logger.info("상세보기");
	  			return FreeService.freeDetail(j_idx);
	  		}
	  	//글 삭제
	  		@RequestMapping(value="/delete")
	  		public ModelAndView delete(
	  				@RequestParam("j_idx") String j_idx){
	  			logger.info("글 삭제");
	  			return FreeService.delete(j_idx);
	  		}
	  		
	  	//수정 페이지 이동
	  		@RequestMapping(value="/freeModify")
	  		public ModelAndView freeModify(
	  				@RequestParam("j_idx") String j_idx ){
	  			logger.info("수정페이지 이동");
	  			return FreeService.freeModify(j_idx);
	  		}
	  	//수정
	  		@RequestMapping(value="/update")
	  		public ModelAndView update(
	  				@RequestParam Map<String, String> params
	  				){
	  			logger.info("수정 요청");
	  			return FreeService.update(params);
	  		}
	  	//댓글 등록
	  		@RequestMapping(value = "/replyRegist")
	  		public @ResponseBody Map<String, String> replyRegist(
	  				@RequestParam Map<String, String> params) {
	  			logger.info("매칭댓글등록");
	  			return FreeService.replyRegist(params);
	  		}
	  		
	  		//댓글 요청	
	  		@RequestMapping(value="/replyList")
	  		public @ResponseBody Map<String, ArrayList<RepleDto>> replyList(
	  				@RequestParam Map<String, String> params){
	  			logger.info("댓글 리스트 요청");
	  			return FreeService.replyList(params);
	  		}
	  		
	  		
	  		//댓글 삭제
	  		@RequestMapping(value="/replyDel")
	  		public @ResponseBody Map<String, String> replyDel(
	  				@RequestParam Map<String, String> params){
	  			logger.info("삭제 요청");
	  			return FreeService.replyDel(params);
	  		}
	  		

	  		
	}


