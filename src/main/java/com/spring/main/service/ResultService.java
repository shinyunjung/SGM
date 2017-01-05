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
	Thread thread =null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView result(String idx) {
		inter=sqlSession.getMapper(ResultInterface.class);
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	// 스레드
	public ModelAndView threadRun(String chk) {
		ModelAndView mav = new ModelAndView();

		thread = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					while (true) {
						logger.info("스레드 실행중");
						tie();
						thread.sleep(1000*60*2);
					}

				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		});
		thread.start();
		mav.setViewName("index");
		return mav;
	}

	//승부처리
	public void tie() {
		inter = sqlSession.getMapper(ResultInterface.class);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		GregorianCalendar cal = new GregorianCalendar();
		cal.add(cal.DATE, -3);
		Date date = cal.getTime();
		String Dday = format.format(date);
		ArrayList<EntirelyDto> ent = inter.matchDay(Dday);
		logger.info(Dday);
		
		for(int i=0; i<ent.size(); i+=2){
			int j=i+1;
			String con1 = ent.get(i).getE_condition();
			String con2 = ent.get(j).getE_condition();
			String team = ent.get(i).getE_team();
			String[] tname = team.split(":");
			String dif = ent.get(i).getE_difference();
			if(con2.equals("1")){
				dif = ent.get(j).getE_difference();
			}
			String[] score = dif.split(":");
			String idx = ent.get(i).getMch_idx();
			logger.info(tname[0]+"/"+tname[1]);
			logger.info(score[0]+"/"+score[1]);
			
			inter.difference(dif,idx);
			
			if(Integer.parseInt(score[0])>Integer.parseInt(score[1])){
				logger.info(score[0]);
				inter.rankpoint(3,"t_win",tname[0]);
				inter.rankpoint(1,"t_lose",tname[1]);
			}else if(score[0].equals(score[1])){
				inter.rankpoint(2,"t_draw",tname[0]);
				inter.rankpoint(2,"t_draw",tname[1]);
			}else{
				logger.info(score[1]);
				inter.rankpoint(1,"t_win",tname[0]);
				inter.rankpoint(3,"t_lose",tname[1]);
			}
		}
	}

}
