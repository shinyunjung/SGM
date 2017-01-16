package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.ResultInterface;
import com.spring.main.dto.EntirelyDto;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.ResultDto;
import com.spring.main.util.EmailTest;
import com.spring.main.util.ResultEmail;

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
						result();
						thread.sleep(1000*60*60);
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
	
	//결과 메일
	public void result(){
		inter = sqlSession.getMapper(ResultInterface.class);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = format.format(date);
		ResultEmail mail = new ResultEmail();
		logger.info(time);
		ArrayList<ResultDto> result = inter.result(time);
		for(int i=0; i<result.size(); i++){
			String email = result.get(i).getU_mail();
			String idx = result.get(i).getMch_idx();
			String t_idx = result.get(i).getT_idx();
			String content = "http://localhost:8080/main/result/eva?idx="+idx+"&t_idx="+t_idx+"";
			try {
				mail.gmailtest(email, content);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	//경기결과
	public ModelAndView eva(Map<String, String> params) {
		inter = sqlSession.getMapper(ResultInterface.class);
		ModelAndView mav = new ModelAndView();
		String t_idx = params.get("t_idx");
		String idx = params.get("idx");
		mav.addObject("result", inter.eva(idx));
		mav.addObject("mail", inter.mailCnt(t_idx,idx));
		mav.setViewName("result");
		return mav;
	}

	//평가정보넣기
	public ModelAndView evaUp(Map<String, String> params) {
		inter = sqlSession.getMapper(ResultInterface.class);
		ModelAndView mav = new ModelAndView();
		String mch_idx = params.get("mch_idx");
		String t_idx = params.get("t_idx");
		String eva = params.get("eva");
		String lteam = params.get("lteam");
		String rteam = params.get("rteam");
		inter.entirely(t_idx,mch_idx,lteam+":"+rteam);
		ArrayList<EntirelyDto> ent = inter.entDto(mch_idx);
		String con1 = ent.get(0).getE_condition();
		String con2 = ent.get(1).getE_condition();
		String dif1 = ent.get(0).getE_difference();
		String dif2 = ent.get(1).getE_difference();
		if(con1.equals(con2)){
			if(dif1.equals(dif2)){
				inter.end(mch_idx);
				String[] score = dif1.split(":");
				String team =  ent.get(0).getE_team();
				String[] tname = team.split(":");
				if(Integer.parseInt(score[0])>Integer.parseInt(score[1])){
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
			}else{
				if(!ent.get(0).getE_mail().equals("3")){
					inter.reset(mch_idx);
					ResultEmail mail = new ResultEmail();
					for(int i=0; i<2; i++){
						String team = ent.get(i).getT_idx();
						ResultDto result = inter.email(team);
						String email = result.getU_mail();
						String content = "http://192.168.0.31/main/result/eva?idx="+mch_idx+"&t_idx="+team+"";						
						try {
							mail.gmailtest(email, content);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}else{
					inter.difference("0:0",mch_idx);
					String team =  ent.get(0).getE_team();
					String[] tname = team.split(":");
					inter.rankpoint(2,"t_draw",tname[0]);
					inter.rankpoint(2,"t_draw",tname[1]);
				}
			}
		}
		if(eva.equals("0")){
			String team = ent.get(0).getT_idx();
			if(t_idx.equals(team)){
				team = ent.get(1).getT_idx();
			}
			String ev_name = params.get("ev_name");
			String ev_manner = params.get("ev_manner");
			String ev_level = params.get("ev_level");
			String ev_defe = params.get("ev_defe");
			String ev_attk = params.get("ev_attk");
			inter.evalue(team,ev_name,ev_manner,ev_level,ev_defe,ev_attk);
		}
		mav.setViewName("redirect:../");
		return mav;
	}

}