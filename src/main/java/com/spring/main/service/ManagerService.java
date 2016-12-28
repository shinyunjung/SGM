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

import com.spring.main.dao.ManagerInterface;
import com.spring.main.dao.MatchInterface;
import com.spring.main.dto.BoardDto;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.UserDto;

@Service
public class ManagerService {
	
	@Autowired
	SqlSession sqlSession;
	
	ManagerInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public Map<String, Object> userListCall(Map<String, String> params) {
		Map<String, ArrayList<UserDto>> obj = new HashMap<String, ArrayList<UserDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(ManagerInterface.class);
		
		int currPage=Integer.parseInt(params.get("page"));//현재 페이지
		
		int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
		
		logger.info(currPage+"/"+pagePerNum);
		
		//게시물 시작과 끝 번호
		int end=pagePerNum*currPage;
		int start=end-pagePerNum+1;
		int allCnt = inter.us_allCnt();
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		logger.info("전체 개시물:{}",allCnt);
		
		obj.put("list", inter.us_listCall(start, end));
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}

	public Map<String, Object> userSearch(Map<String, String> params) {
		inter=sqlSession.getMapper(ManagerInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String input=params.get("input");
		String type=params.get("type");
		int allCnt = inter.us_searhCount(input, type);
		json.put("count", allCnt);
		return json;
	}
	
	public Map<String, Object> userSearchCall(Map<String, String> params) {
		logger.info("유저검색중");
		Map<String, ArrayList<UserDto>> obj = new HashMap<String, ArrayList<UserDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(ManagerInterface.class);
		
		int currPage=Integer.parseInt(params.get("page"));//현재 페이지
		
		int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
		
		String input = params.get("input");
		String type = params.get("type");
		
		logger.info(currPage+"/"+pagePerNum+"/"+input);
		
		//게시물 시작과 끝 번호
		int end=pagePerNum*currPage;
		int start=end-pagePerNum+1;
		int allCnt=0;
		if(input!=""){
			allCnt = inter.us_searhCount(input, type);
			obj.put("list", inter.us_searhCall(start, end, input, type));
		}else{
			allCnt = inter.us_allCnt();
			obj.put("list", inter.us_listCall(start, end));
		}
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}

	//유저 삭제
	public ModelAndView usDelete(String idx) {
		ModelAndView mav = new ModelAndView();
		int success=0;
		String msg="삭제에 실패했습니다.";
		ArrayList<BoardDto> bdt = new ArrayList<BoardDto>();
		inter=sqlSession.getMapper(ManagerInterface.class);
		
		success=inter.usDelete(idx);
		if(success==1){
			msg="삭제에 성공했습니다.";
			inter.usRepleDelete(idx);
		}
		mav.addObject("msg",msg);
		mav.setViewName("usManager");
		return mav;
	}

	

}
