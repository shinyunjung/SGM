package com.spring.main.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ResultInterface;

@Service
public class ResultService {

	@Autowired
	SqlSession sqlSession;
	
	ResultInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView result(String idx) {
		inter=sqlSession.getMapper(ResultInterface.class);
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
