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
import com.spring.main.dto.UserDto;
import com.spring.main.dto.mylistDTO;

@Service
public class BoardService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	BoardInterface inter = null;
	
	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {
		String u_id = (String) params.get("u_id");
		String u_pass = (String) params.get("u_pass");

		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();
		
		logger.info("id: {}",u_id);
		logger.info("pass: {}",u_pass);
		String page = "index";
		
		if(u_id == null || u_pass == null){
			page="redirect:/";
		}else{
			inter = sqlSession.getMapper(BoardInterface.class);			
			if(inter.login(u_id, u_pass) != null){
				page = "redirect:/";
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
			info.setU_gender(params.get("u_gender"));
			info.setU_phnum(params.get("u_phnum"));
			info.setU_email(params.get("u_mail"));
			
			inter.userJoin(info);
			
			return info;
		}
		
		//마이페이지 리스트

		public Map<String, Object> mylistCall(Map<String, String> params) {
			
			inter = sqlSession.getMapper(BoardInterface.class);
			Map<String, Object> json = new HashMap<String, Object>();
			Map<String, ArrayList<mylistDTO>> obj 
				= new HashMap<String, ArrayList<mylistDTO>>();
			
			//현재 페이지
			int currPage = Integer.parseInt(params.get("page"));
			//페이지당 보여줄 게시물 갯수
			int pagePerNum = Integer.parseInt(params.get("pagePerNum"));
			logger.info("현재 페이지 : "+currPage);
			logger.info("페이지 당 보여줄 수 : "+pagePerNum);		
			int end = currPage*pagePerNum;	//게시물 끝 번호
			int start = end-pagePerNum+1;	//게시물 시작번호
			int allCnt = inter.allCount();
			logger.info("전체 게시물 수 : {}",allCnt);
			int page = allCnt%pagePerNum >0 ?
					Math.round(allCnt/pagePerNum)+1
					:Math.round(allCnt/pagePerNum); //생성 할 수 있는 페이지
			
			obj.put("list", inter.mylistCall(start, end));
			json.put("jsonList", obj);
			json.put("currPage", currPage);
			json.put("allCnt", allCnt);		
			json.put("page", page);
			return json;
		}
		
	
}

