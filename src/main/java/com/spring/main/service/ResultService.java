package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MatchInterface;
import com.spring.main.dao.ResultInterface;
import com.spring.main.dto.EntirelyDto;

@Service
public class ResultService {

	@Autowired
	SqlSession sqlSession;
	
	ResultInterface inter=null;
	MatchInterface match=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView result(String idx) {
		inter=sqlSession.getMapper(ResultInterface.class);
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	//무승부
	public ModelAndView tie() {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(ResultInterface.class);
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(date);
		ArrayList<EntirelyDto> Dday = inter.matchDay();
		logger.info(today);
		return null;
	}

}
