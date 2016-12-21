package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.TeamInterface;
import com.spring.main.dto.EvalueDto;
import com.spring.main.dto.TeamDto;


@Service
public class TeamService {

	@Autowired
	SqlSession sqlSession;
	
	TeamInterface inter = null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public Map<String, Object> listCall(Map<String, String> params) {
		
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<TeamDto>> obj 
			= new HashMap<String, ArrayList<TeamDto>>();
		
		//현재 페이지
		int currPage = Integer.parseInt(params.get("page"));
		//페이지당 보여줄 게시물 갯수
		int pagePerNum = Integer.parseInt(params.get("pagePerNum"));
		logger.info("현재 페이지 : "+currPage);
		logger.info("페이지 당 보여줄 수 : "+pagePerNum);
		int allCnt = 0;
		String t_name = params.get("t_name");
		logger.info(t_name);
		if(t_name!=""){
			allCnt = inter.searchCount(t_name); //전체 게시물 수
			obj.put("list", inter.search(t_name));
			logger.info("검색");
		}else{
			allCnt = inter.allCount();			//전체 게시물 수
			obj.put("list", inter.listCall());
			logger.info("리스트");
		}
		logger.info("전체 게시물 수 : {}",allCnt);
		int page = allCnt%pagePerNum >0 ? 
				Math.round(allCnt/pagePerNum)+1
				:Math.round(allCnt/pagePerNum);//생성 할 수 있는 페이지
		
		
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);		
		json.put("page", page);
		return json;
	}
/*
	public Map<String, String> search(String t_name) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, String> obj = new HashMap<String, String>();
		logger.info(t_name);
		String result = inter.search(t_name);
		
			
		obj.put("msg", msg);		
		
		return obj;
	}
*/

	public ModelAndView teamDetail(String t_idx) {
		
		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();
		ArrayList<EvalueDto> list = new ArrayList<EvalueDto>();
		EvalueDto info = new EvalueDto();
		ArrayList<EvalueDto> evalue = inter.evalueCall(t_idx);
		logger.info(t_idx);

		mav.addObject("team",inter.teamDetail(t_idx));
		mav.addObject("evalue",evalue);
		mav.addObject("evCnt",inter.evalueCount(t_idx));
		mav.addObject("member",inter.memberCall(t_idx));
		mav.addObject("meCount",inter.memberCount(t_idx));
		mav.setViewName("teamDetail");
		
		return mav;
	}

}
