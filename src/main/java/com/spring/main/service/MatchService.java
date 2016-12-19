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

import com.spring.main.dao.BoardInterface;
import com.spring.main.dto.AreaDto;
import com.spring.main.dto.MatchDto;

@Service
public class MatchService {

	@Autowired
	SqlSession sqlSession;
	
	BoardInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	//리스트 추가
	public Map<String, Object> listCall(Map<String, String> params) {
		Map<String, ArrayList<MatchDto>> obj = new HashMap<String, ArrayList<MatchDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(BoardInterface.class);
		
		int currPage=Integer.parseInt(params.get("page"));//현재 페이지
		
		int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
		
		logger.info(currPage+"/"+pagePerNum);
		
		//게시물 시작과 끝 번호
		int end=pagePerNum*currPage;
		int start=end-pagePerNum+1;
		int allCnt = inter.allCount();
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		logger.info("전체 개시물:{}",allCnt);
		
		obj.put("list", inter.listCall(start, end));
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}


	public Map<String, Object> searchCall(Map<String, String> params) {
		Map<String, ArrayList<MatchDto>> obj = new HashMap<String, ArrayList<MatchDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(BoardInterface.class);
		
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
			allCnt = inter.searhCount(input, type);
			obj.put("list", inter.searhCall(start, end, input, type));
		}else{
			allCnt = inter.allCount();
			obj.put("list", inter.listCall(start, end));
		}
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		logger.info("전체 개시물:{}",allCnt);
		logger.info("전체 개시물:{}",allCnt);
		logger.info("전체 개시물:{}",allCnt);
		logger.info("전체 개시물:{}",allCnt);
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}


	


	public Map<String, Object> search(Map<String, String> params) {
		inter=sqlSession.getMapper(BoardInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String input=params.get("input");
		String type=params.get("type");
		int allCnt = inter.searhCount(input, type);
		json.put("count", allCnt);
		return json;
	}


	//매칭 게시판 글 등록
	public ModelAndView write(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}


	public Map<String, ArrayList<AreaDto>> areaList(Map<String, String> params) {
		Map<String, ArrayList<AreaDto>> obj = new HashMap<String, ArrayList<AreaDto>>();
		inter=sqlSession.getMapper(BoardInterface.class);
		obj.put("area", inter.areaList());
		return obj;
	}
	
	


}
