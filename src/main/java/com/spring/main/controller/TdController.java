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

import com.spring.main.service.TdService;

@Controller("TdController")
@RequestMapping(value="/td")
public class TdController {
	
	@Autowired
	TdService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//팀일지리스트
	@RequestMapping(value = "/tdList")
	public @ResponseBody Map<String, Object> tdList(@RequestParam Map<String, String> params) {
		logger.info("팀일지리스트");
		return service.tdList(params);
	}
	//팀일지상세
	@RequestMapping(value = "/tdDetail")
	public String tdDetail() {
		logger.info("팀일지상세");
		return "tdDetail";
	}
	//팀일지쓰기
	@RequestMapping(value = "/tdWrite")
	public String tdWrite() {
		logger.info("팀일지쓰기");
		return "tdWrite";
	}
	//팀일지수정
	@RequestMapping(value = "/tdModify")
	public String tdModify() {
		logger.info("팀일지수정");
		return "tdModify";
	}
	
	//글쓰기(파일추가)
	@RequestMapping(value="/write")
	public ModelAndView write(MultipartHttpServletRequest multi){
		logger.info("글쓰기 요청");
		return service.write(multi);
	}
	
	/*//파일올리기
	@RequestMapping(value = "/file")
	public  @ResponseBody Map<String, Object> fileUP(@RequestParam MultipartHttpServletRequest multi) {
		logger.info("파일올리기");
		return service.fileUP(multi);
	}*/

}
