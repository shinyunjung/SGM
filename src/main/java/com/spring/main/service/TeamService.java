package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.TeamInterface;
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
		int end = currPage*pagePerNum;	//게시물 끝 번호
		int start = end-pagePerNum+1;	//게시물 시작번호
		int allCnt = inter.allCount();			//전체 게시물 수
		logger.info("전체 게시물 수 : {}",allCnt);
		int page = allCnt%pagePerNum >0 ? 
				Math.round(allCnt/pagePerNum)+1
				:Math.round(allCnt/pagePerNum);//생성 할 수 있는 페이지
		
		obj.put("list", inter.listCall(start, end));		
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);		
		json.put("page", page);
		return json;
	}


}
