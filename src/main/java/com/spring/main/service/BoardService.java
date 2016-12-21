package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.dto.LoginDto;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.SelectTeamDto;
import com.spring.main.dto.UserDto;

@Service
public class BoardService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	BoardInterface inter = null;
	
	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {
		inter = sqlSession.getMapper(BoardInterface.class);		
		LoginDto login = new LoginDto();
		String u_id = (String) params.get("u_id");
		String u_pass = (String) params.get("u_pass");
		String u_idx="";

		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();
		
		logger.info("id: {}",u_id);
		logger.info("pass: {}",u_pass);
		String page = "index";
		login=inter.login(u_id, u_pass);
		if(u_id == null || u_pass == null){
			page="redirect:/";
		}else{	
			if(login != null){
				page = "redirect:/";
				u_idx=inter.userIdx(u_id);
				logger.info(u_idx);
				if(u_idx!=""){
					session.setAttribute("userIdx", u_idx);
				}
				session.setAttribute("userId", u_id);
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}
	
	
	//중복체크
		public Map<String, String> overlay(String u_id) {
			
			inter = sqlSession.getMapper(BoardInterface.class);
			Map<String, String> json = new HashMap<String, String>();
			logger.info("id중복확인");
			String use = "N";
			if(inter.overlay(u_id) == null){
				use = "Y";
			}
			json.put("use", use);
			
			logger.info("id중복확인");
			
			return json;
		}

	
	//회원가입
		public UserDto userJoin(Map<String, String> params) {
			
			inter = sqlSession.getMapper(BoardInterface.class);
			UserDto info = new UserDto();
			
			info.setU_id(params.get("u_id"));
			info.setU_pass(params.get("u_pass"));
			info.setU_name(params.get("u_name"));
			info.setU_age(params.get("u_age"));
			info.setU_gender(params.get("gender"));
			info.setU_phnum(params.get("u_phnum"));
			info.setU_email(params.get("u_mail"));
			
			inter.userJoin(info);
			
			return info;
		}


		//유저 정보 찾기
		public Map<String, UserDto> userSearch(Map<String, String> params) {
			inter = sqlSession.getMapper(BoardInterface.class);
			
			Map <String, UserDto> map = new HashMap<String, UserDto>();
			String u_id=params.get("userId");
			logger.info(u_id);
			map.put("user", inter.userSearch(u_id));
			return map;
		}


		public Map<String, ArrayList<SelectTeamDto>> selectTeam(String idx) {
			inter = sqlSession.getMapper(BoardInterface.class);
			
			Map<String, ArrayList<SelectTeamDto>> map = new HashMap<String, ArrayList<SelectTeamDto>>();
			map.put("userTeam", inter.selectTeam(idx));
			return map;
		}
}	

