package com.spring.main.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.spring.main.dao.NoteInterface;

@Service
public class NoteService {

	@Autowired
	SqlSession sqlSession;
	
	NoteInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ModelAndView msgPage(String t_idx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("idx",t_idx);
		mav.setViewName("msgpage");
		return mav;
	}
}
