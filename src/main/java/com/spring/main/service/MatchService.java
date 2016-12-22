package com.spring.main.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.dao.MatchInterface;
import com.spring.main.dto.AreaDto;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.RepleDto;

@Service
public class MatchService {

	@Autowired
	SqlSession sqlSession;
	
	MatchInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	//리스트 추가
	public Map<String, Object> listCall(Map<String, String> params) {
		Map<String, ArrayList<MatchDto>> obj = new HashMap<String, ArrayList<MatchDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(MatchInterface.class);
		
		int currPage=Integer.parseInt(params.get("page"));//현재 페이지
		
		int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
		
		logger.info(currPage+"/"+pagePerNum);
		
		//게시물 시작과 끝 번호
		int end=pagePerNum*currPage;
		int start=end-pagePerNum+1;
		int allCnt = inter.mch_allCount();
		
		int totalPage=allCnt/pagePerNum;
		System.out.println(totalPage%pagePerNum);
		if(allCnt%pagePerNum!=0){
			totalPage+=1;
		}
		logger.info("전체 개시물:{}",allCnt);
		
		obj.put("list", inter.mch_listCall(start, end));
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("totalCount", allCnt);
		json.put("totalPage", totalPage);
		
		return json;
	}


	public Map<String, Object> searchCall(Map<String, String> params) {
		Map<String, ArrayList<MatchDto>> obj = new HashMap<String, ArrayList<MatchDto>>();
		Map<String, Object> json = new HashMap<String, Object>();
		inter=sqlSession.getMapper(MatchInterface.class);
		
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
			allCnt = inter.mch_searhCount(input, type);
			obj.put("list", inter.mch_searhCall(start, end, input, type));
		}else{
			allCnt = inter.mch_allCount();
			obj.put("list", inter.mch_listCall(start, end));
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
		inter=sqlSession.getMapper(MatchInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String input=params.get("input");
		String type=params.get("type");
		int allCnt = inter.mch_searhCount(input, type);
		json.put("count", allCnt);
		return json;
	}


	//매칭 게시판 글 등록
	public ModelAndView write(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		String t_idx=params.get("t_idx");
		String title = params.get("mch_title");
		String writer = params.get("mch_name");
		String date = params.get("mch_date");
		String time = params.get("mch_time");
		String type = params.get("mch_type");
		String age = params.get("mch_age");
		String content = params.get("mch_content");
		String prePosition = params.get("position");
		String ground = params.get("ground");
		String area = params.get("gu");
		String[] position = prePosition.split("/");
		String lat = position[0];
		String lng = position[1];
		String state="대기";
		logger.info(title+"/"+writer+"/"+date+"/"+time+"/"+type+"/"+age+"/"+content+"/"+lat+"/"+lng+"/"+area+"/"+ground);
		success = inter.mch_write(t_idx, title, writer, date, time, type, age, content, lat, lng, area, ground, state);
		mav.addObject("success", success);
		mav.setViewName("matchList");
		return mav;
	}


	public Map<String, ArrayList<AreaDto>> areaList(Map<String, String> params) {
		Map<String, ArrayList<AreaDto>> obj = new HashMap<String, ArrayList<AreaDto>>();
		inter=sqlSession.getMapper(MatchInterface.class);
		obj.put("area", inter.mch_areaList());
		return obj;
	}


	public ModelAndView areaMap(String lat) {
		ModelAndView mav = new ModelAndView();
		logger.info(lat);
		mav.addObject("lat",lat);
		mav.setViewName("matchWrite");
		return mav;
	}


	//상세보기/수정페이지 
	public ModelAndView detail(int idx, boolean modFlag) {
		inter=sqlSession.getMapper(MatchInterface.class);
		MatchDto mdt = new MatchDto();
		ModelAndView mav = new ModelAndView();
		mdt=inter.mch_detail(idx);
		mav.addObject("detail",mdt);
		if(modFlag){
			mav.setViewName("matchModify");
		}else{
			mav.setViewName("matchDetail");
		}
		return mav;
	}


	
	//댓글 등록
	public Map<String, String> replyRegist(Map<String, String> params) {
		Map<String, String> obj = new HashMap<String, String>();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		String msg="댓글 등록에 실패하셨습니다.";
		String idx=params.get("idx");
		String replyer=params.get("replyer");
		String reple=params.get("reple");
		int category = Integer.parseInt(params.get("category"));
		logger.info(idx);
		logger.info(replyer);
		logger.info(reple);
		success=inter.mch_replyRegist(category, idx, replyer, reple);
		if(success==1){
			inter.mch_replyUp(idx);
			msg="댓글 등록에 성공하셨습니다.";
		}
		obj.put("msg", msg);
		return obj;
	}


	public Map<String, ArrayList<RepleDto>> replyList(Map<String, String> params) {
		Map<String, ArrayList<RepleDto>> obj = new HashMap<String, ArrayList<RepleDto>>();
		inter=sqlSession.getMapper(MatchInterface.class);
		String idx=params.get("idx");
		String category=params.get("category");
		obj.put("replyList", inter.mch_replyList(idx, category));
		
		return obj;
	}


	public Map<String, String> replyDel(Map<String, String> params) {
		Map<String, String> obj = new HashMap<String, String>();
		int success=0;
		inter=sqlSession.getMapper(MatchInterface.class);
		String idx=params.get("idx");
		String category=params.get("category");
		String parentIdx = params.get("parent");
		String msg="삭제에 실패했습니다.";
		
		success=inter.mch_replyDel(idx, category);
		if(success==1){
			inter.mch_repleDown(parentIdx);
			msg="삭제에 성공했습니다.";
		}
		obj.put("msg", msg);
		return obj;
	}


	public ModelAndView modify(Map<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		String mch_idx=(String) params.get("mch_idx");
		String t_idx=(String)params.get("t_idx");
		String title =(String) params.get("mch_title");
		String writer =(String) params.get("mch_name");
		String date = (String)params.get("mch_date");
		String time = (String)params.get("mch_time");
		String type =(String) params.get("mch_type");
		String age =(String) params.get("mch_age");
		String content =(String) params.get("mch_content");
		String prePosition =(String) params.get("position");
		String ground =(String) params.get("ground");
		String area = (String)params.get("gu");
		String[] position = prePosition.split("/");
		String lat = position[0];
		String lng = position[1];
		String state="대기";
		
		
		logger.info(t_idx+"/"+title+"/"+writer+"/"+date+"/"+time+"/"+type+"/"+age+"/"+content+"/"+lat+"/"+lng+"/"+area+"/"+ground+"/"+state+"/"+mch_idx);
		success = inter.mch_modify(t_idx, title, writer, date, time, type, age, content, lat, lng, area, ground, state, mch_idx);
		mav.addObject("success", success);
		mav.setViewName("matchList");
		return mav;
	}


	public ModelAndView writeCheck(Map<String, String> params) throws ParseException {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		MatchDto mdt = new MatchDto();
		String msg="";
		mav.addObject("writeData", params);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date mchDate;
		
		String t_idx=params.get("t_idx");
		String title = params.get("mch_title");
		String writer = params.get("mch_name");
		String date = params.get("mch_date");
		String time = params.get("mch_time");
		String type = params.get("mch_type");
		String age = params.get("mch_age");
		String content = params.get("mch_content");
		String prePosition = params.get("position");
		String ground = params.get("ground");
		String area = params.get("gu");
		
		if(title!=""){
			mdt.setMch_title(title);
		}else{
			msg="제목을 입력해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("matchWrite");
			return mav;
		}
		
		if(date!=""){
			mchDate=(Date) transFormat.parse(date);
			mdt.setMch_date(mchDate);
		}else{
			msg="시합날짜를 결정해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("matchWrite");
			return mav;
		}
		
		if(time!=""){
			mdt.setMch_time(time);
		}else{
			msg="시합시간을 결정해주세요";
			mav.addObject("msg",msg);
			mav.setViewName("matchWrite");
			return mav;
		}
		
		if(content!=""){
			mdt.setMch_content(content);
		}else{
			msg="내용을 적어주세요";
			mav.addObject("msg",msg);
			mav.setViewName("matchWrite");
			return mav;
		}
		/*String[] position = prePosition.split("/");
		String lat = position[0];
		String lng = position[1];
		String state="대기";*/
		return mav;
	}


	
	
	


}
