package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String teamDetail() {
		logger.info("팀상세");
		return "teamDetail";
	}
	//멤버등록
	@RequestMapping(value = "/memberUpdate")
	public String memberUpdate() {
		logger.info("멤버등록");
		return "memberUpdate";
	}
	//멤버상세
	@RequestMapping(value = "/memberDetail")
	public String memberDetail() {
		logger.info("멤버상세");
		return "memberDetail";
	}
	
	//리스트보여주기
	@RequestMapping(value = "/listCall")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params) {
		logger.info("리스트보여주기");
		return service.listCall(params);
	}
	
	/*//검색하기
	@RequestMapping(value = "/search")
	public @ResponseBody Map<String, String> search(@RequestParam("t_name") String t_name) {
		logger.info("검색");
		return service.search(t_name);
	}*/
}
