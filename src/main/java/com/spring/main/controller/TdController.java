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
	public ModelAndView tdList(@RequestParam("t_idx") String t_idx) {
		logger.info("팀상세");
		return service.tdList(t_idx);
	}
	//팀일지상세
	@RequestMapping(value = "/tdDetail")
	public ModelAndView tdDetail(@RequestParam Map<String, String> params){
		logger.info("팀일지상세");
		return service.tdDetail(params);
	}
	//팀일지쓰기
	@RequestMapping(value = "/tdWrite")
	public ModelAndView tdWrite(@RequestParam("t_idx") String t_idx) {
		logger.info("팀일지쓰기");
		return service.tdWrite(t_idx);
	}
	//팀일지수정
	@RequestMapping(value = "/tdModify")
	public ModelAndView tdModify(@RequestParam Map<String, String> params) {
		logger.info("팀일지수정");
		return service.tdModify(params);
	}
	
	//팀일지리스트
	@RequestMapping(value = "/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params) {
		logger.info("팀일지리스트");
		return service.listCall(params);
	}
	
	//글쓰기
	@RequestMapping(value="/write")
	public ModelAndView write(MultipartHttpServletRequest multi){
		logger.info("글쓰기 요청");
		return service.write(multi);
	}
	
	//멩버목록
	@RequestMapping(value = "/member")
	public @ResponseBody Map<String, Object> member(@RequestParam("t_idx") String t_idx) {
		logger.info("멩버목록");
		return service.member(t_idx);
	}
	
	//글수정
	@RequestMapping(value="/modify")
	public ModelAndView modify(MultipartHttpServletRequest multi){
		logger.info("글수정 요청");
		return service.modify(multi);
	}
	
	//글삭제
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam Map<String, String> params) {
		logger.info("글삭제");
		return service.delete(params);
	}

}
