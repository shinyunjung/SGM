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

import com.spring.main.service.TeamService;

@Controller("TeamController")
@RequestMapping(value="/team")
public class TeamController {
	
	@Autowired
	TeamService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//팀가입
	@RequestMapping(value = "/teamJoin")
	public String teamJoin() {
		
		return "teamJoin";
	}
	//팀
	@RequestMapping(value = "/teamList")
	public String teamList(){
		logger.info("팀리스트 보기");
		return "teamList";
	}
	//팀상세
	@RequestMapping(value = "/teamDetail")
	public ModelAndView teamDetail(@RequestParam("t_idx") String t_idx) {
		logger.info("팀상세");
		return service.teamDetail(t_idx);
	}
	//팀수정
	@RequestMapping(value = "/teamModify")
	public ModelAndView memberUpdate(@RequestParam("t_idx") String t_idx) {
		logger.info("팀수정");
		return service.teamModify(t_idx);
	}
	//멤버상세
	@RequestMapping(value = "/memberDetail")
	public ModelAndView memberDetail(@RequestParam Map<String, String> params) {
		logger.info("멤버상세");
		return service.memberDetail(params);
	}
	
	//리스트보여주기
	@RequestMapping(value = "/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params) {
		logger.info("리스트보여주기");
		return service.listCall(params);
	}
	
	//중복체크
	@RequestMapping(value = "/tName")
	public @ResponseBody Map<String, String> tName(@RequestParam("t_name") String t_name) {
		logger.info("중복체크");
		return service.tName(t_name);
	}
	
	//팀생성
	@RequestMapping(value = "/insertTeam")
	public ModelAndView insertTeam(MultipartHttpServletRequest multi) {
		logger.info("팀생성");
		return service.insertTeam(multi);
	}
	
	//팀수정
	@RequestMapping(value = "/teamUpdate")
	public ModelAndView teamUpdate(MultipartHttpServletRequest multi) {
		logger.info("팀수정");
		return service.teamUpdate(multi);
	}
		
	//팀삭제
	@RequestMapping(value = "/teamDel")
	public @ResponseBody Map<String, String> teamDel(@RequestParam("t_idx") String t_idx) {
		logger.info("팀삭제");
		return service.teamDel(t_idx);
	}
	
	//멤버추가
	@RequestMapping(value = "/memberAdd")
	public @ResponseBody Map<String, Object> memberAdd(@RequestParam Map<String, String> params) {
		logger.info("멤버추가");
		return service.memberAdd(params);
	}
	
	//멤버수정
	@RequestMapping(value = "/memberup")
	public @ResponseBody Map<String, Object> memberup(@RequestParam Map<String, String> params) {
		logger.info("멤버수정");
		return service.memberup(params);
	}
	
	//멤버삭제
	@RequestMapping(value = "/memberDel")
	public @ResponseBody Map<String, Object> memberDel(@RequestParam Map<String, String> params) {
		logger.info("멤버삭제");
		return service.memberDel(params);
	}
	
	//대표변경
	@RequestMapping(value = "/leader")
	public @ResponseBody Map<String, String> leader(@RequestParam Map<String, String> params) {
		logger.info("대표변경");
		return service.leader(params);
	}
	
	
	//멤버탈퇴
	@RequestMapping(value = "/Delete")
	public @ResponseBody Map<String, String> Delete(@RequestParam Map<String, String> params) {
		logger.info("멤버탈퇴");
		return service.Delete(params);
	}
}
