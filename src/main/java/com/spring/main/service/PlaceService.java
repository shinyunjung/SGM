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

import com.spring.main.dao.PlaceInterface;
import com.spring.main.dto.PlaceDto;

@Service
public class PlaceService {


	@Autowired
	SqlSession sqlSession;
	
	PlaceInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	//리스트 추가
	public Map<String, Object> listCall(Map<String, String> params) {
		Map<String, ArrayList<PlaceDto>> obj = new HashMap<String, ArrayList<PlaceDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(PlaceInterface.class);
		
		int currPage=Integer.parseInt(params.get("page"));//현재 페이지
		
		int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
		
		logger.info(currPage+"/"+pagePerNum);
		
		//게시물 시작과 끝 번호
		int end=pagePerNum*currPage;
		int start=end-pagePerNum+1;
		int allCnt = inter.a_allCount();
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		logger.info("전체 게시물:{}",allCnt);
		
		obj.put("list", inter.a_listCall(start, end));
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}


	public Map<String, Object> searchCall(Map<String, String> params) {
		Map<String, ArrayList<PlaceDto>> obj = new HashMap<String, ArrayList<PlaceDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(PlaceInterface.class);
		
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
			allCnt = inter.a_searhCount(input, type);
			obj.put("list", inter.a_searhCall(start, end, input, type));
		}else{
			allCnt = inter.a_allCount();
			obj.put("list", inter.a_listCall(start, end));
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
		inter=sqlSession.getMapper(PlaceInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String input=params.get("input");
		String type=params.get("type");
		int allCnt = inter.a_searhCount(input, type);
		json.put("count", allCnt);
		return json;
	}


	//매칭 게시판 글 등록
	public ModelAndView write(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(PlaceInterface.class);
		int success=0;
		int t_idx=1;
		String title = params.get("mch_title");
		String writer = params.get("mch_name");
 		String date = params.get("mch_date");
 		String time = params.get("mch_time");
		String type = params.get("mch_type");
		String age = params.get("mch_age");
		String content = params.get("mch_content");
		String prePosition = params.get("position");
		String ground = params.get("ground");
		int area = Integer.parseInt(params.get("gu"));
		String[] position = prePosition.split("/");
		String lat = position[0];
		String lng = position[1];
		String state="대기";
		logger.info(title+"/"+writer+"/"+date+"/"+time+"/"+type+"/"+age+"/"+content+"/"+lat+"/"+lng+"/"+area+"/"+ground);
		success = inter.a_write(t_idx, title, writer, date, time, type, age, content, lat, lng, area, ground, state);
		mav.addObject("write",params);
		mav.setViewName("placeList");
		return mav;
	}


	
	


	public ModelAndView areaMap(String lat) {
		ModelAndView mav = new ModelAndView();
		logger.info(lat);
		mav.addObject("lat",lat);
		mav.setViewName("placeWrite");
		return mav;
	}


	
	
	


}
