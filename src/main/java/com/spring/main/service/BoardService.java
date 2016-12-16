package com.spring.main.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;


@Service
public class BoardService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	BoardInterface inter = null;
	
	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {
		String u_id = (String) params.get("userId");
		String u_pass = (String) params.get("userPass");

		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();
		
		logger.info("u_id: {}",u_id);
		logger.info("u_pass: {}",u_pass);
		String page = "index";
		
		if(u_id == null || u_pass == null){
			page="redirect:/list";
		}else{
			inter = sqlSession.getMapper(BoardInterface.class);			
			if(inter.login(u_id, u_pass) != null){
				page = "redirect:/list";
				session.setAttribute("userId", u_id);
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}

}
