package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

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
		
		/*Date date = new Date();*/
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		GregorianCalendar cal = new GregorianCalendar();
		cal.add(cal.DATE, -3);
		Date date = cal.getTime();
		String Dday = format.format(date);
		ArrayList<EntirelyDto> ent = inter.matchDay(Dday);
		
		for(int i=0; i<ent.size(); i+=2){
			int j=i+1;
			String con1 = ent.get(i).getE_condition();
			String con2 = ent.get(j).getE_condition();
			String team = ent.get(i).getE_team();
			String[] tname = team.split(":");
			logger.info(tname[0]+"/"+tname[1]);
			String idx = ent.get(i).getMch_idx();
			if(con1.equals(con2)){
				inter.difference("0:0",idx);/*
				inter.rankpoint(2,"t_draw",tname[0]);
				inter.rankpoint(2,"t_draw",tname[1]);*/
			}else{
				if(con1.equals("1")){
					String dif = ent.get(i).getE_difference();
					String[] score = dif.split(":");
					inter.difference(dif,idx);
					logger.info(score[0]+"/"+score[1]);
					/*if(score[0]>score[1]){
						inter.rankpoint(3,"t_draw",tname[0]);
					}*/
				}else{
					String dif = ent.get(j).getE_difference();
					String[] score = dif.split(":");
					inter.difference(dif,idx);
					logger.info(score[0]+"/"+score[1]);
				}
			}
		}
		logger.info(Dday);
		return null;
	}

}
