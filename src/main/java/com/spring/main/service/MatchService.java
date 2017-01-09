package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MatchInterface;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.PlaceDto;
import com.spring.main.dto.RepleDto;
import com.spring.main.dto.TeamDto;

@Service
public class MatchService {

	@Autowired
	SqlSession sqlSession;
	
	MatchInterface inter=null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	//리스트 추가
	public Map<String, ArrayList<MatchDto>> listCall(int count) {
		Map<String, ArrayList<MatchDto>> obj = new HashMap<String, ArrayList<MatchDto>>();
		inter=sqlSession.getMapper(MatchInterface.class);
		
		int start=1;
		int end=count;
		
		obj.put("list", inter.mch_listCall(start, end));
		
		return obj;
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
	public ModelAndView write(Map<String, String> params)  {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		MatchDto mdt = new MatchDto();
		
		String teamInfo=params.get("team_info");
		String mch_title = params.get("mch_title");
		String mch_date = params.get("mch_date");
		String mch_time = params.get("mch_time");
		String mch_type = params.get("mch_type");
		String mch_age = params.get("mch_age");
		String mch_content = params.get("mch_content");
		mch_content = mch_content.replace("\r\n","<br>");
		String areaInfo = params.get("areaInfo");
		String mch_area = params.get("mch_area");
		String[] position = areaInfo.split("/");
		String[] team = teamInfo.split("/");
		String t_idx=team[0];
		String mch_name=team[1];
		String mch_lat = position[0];
		String mch_lng = position[1];
		String mch_ground=position[2];
		String mch_state="대기";
		
		logger.info(mch_title+"/"+mch_name+"/"+mch_date+"/"+mch_time+"/"+mch_type+"/"+mch_age+"/"+mch_content+"/"+mch_lat+"/"+mch_lng+"/"+mch_area+"/"+mch_ground);
		success = inter.mch_write(t_idx, mch_title, mch_name, mch_date, mch_time, mch_type, mch_age, mch_content, mch_lat, mch_lng, mch_area, mch_ground, mch_state);
		mav.addObject("success", success);
		mav.setViewName("matchList");
		return mav;
	}


	public Map<String, ArrayList<PlaceDto>> areaList(Map<String, String> params) {
		Map<String, ArrayList<PlaceDto>> obj = new HashMap<String, ArrayList<PlaceDto>>();
		String area=params.get("area");
		logger.info("area:{}",area);
		inter=sqlSession.getMapper(MatchInterface.class);
		obj.put("area", inter.mch_areaList(area));
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
	public ModelAndView detail(Map<String, String> params, boolean modFlag) {
		inter=sqlSession.getMapper(MatchInterface.class);
		MatchDto mdt = new MatchDto();
		ModelAndView mav = new ModelAndView();
		String idx=params.get("idx");
		String userIdx="";
		userIdx=params.get("userIdx");
		logger.info("userIdx:{}",userIdx);
		if(!modFlag){
			inter.vcountUp(idx);
			ArrayList<TeamDto> obj = new ArrayList<TeamDto>();
			if(userIdx!=""){
				logger.info("세션 있음");
				obj=inter.selectTeam(userIdx);
				mav.addObject("teamList", obj);
			}else{
				logger.info("세션없음");
			}
		}
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


	public ModelAndView modify(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		
		String mch_title = params.get("mch_title");
		String mch_date = params.get("mch_date");
		String mch_time = params.get("mch_time");
		String mch_type = params.get("mch_type");
		String mch_age = params.get("mch_age");
		String mch_content = params.get("mch_content");
		String areaInfo = params.get("areaInfo");
		
		logger.info("areaInfo:{}",areaInfo);
		
		String mch_area = params.get("mch_area");
		String[] position = areaInfo.split("/");
		String mch_lat = position[0];
		String mch_lng = position[1];
		String mch_ground=position[2];
		String mch_state="대기";
		String mch_idx=params.get("mch_idx");
		
		
		logger.info(mch_title+"/"+mch_date+"/"+mch_type+"/"+mch_age+"/"+mch_content+"/"+mch_lat+"/"+mch_lng+"/"+mch_area+"/"+mch_ground);
		success = inter.mch_modify(mch_title, mch_date, mch_time, mch_type, mch_age, mch_content, mch_lat, mch_lng, mch_area, mch_ground, mch_state, mch_idx);
		mav.addObject("success", success);
		mav.setViewName("matchList");
		return mav;
	}


	public ModelAndView memberCheck(String idx) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		ArrayList<TeamDto> obj = new ArrayList<TeamDto>();
		int count=0;
		obj=inter.selectTeam(idx);
		count=obj.size();
		String msg="쓰기권한이 없습니다.";
		logger.info("count:{}",count);
		if(count>0){
			mav.addObject("teamList",obj);
			mav.setViewName("matchWrite");
		}else{
			mav.addObject("msg",msg);
			mav.setViewName("matchList");
		}
		return mav;
	}


	public ModelAndView delete(String idx, String category) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		String msg="삭제에 실패했습니다.";
		success=inter.delete(idx);
		if(success==1){
			inter.repleDelete(idx, category);
			msg="삭제에 성공했습니다.";
		}
		mav.addObject("msg",msg);
		mav.setViewName("matchList");
		return mav;
	}


	public Map<String, Object> gradeCheck(String idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		inter=sqlSession.getMapper(MatchInterface.class);
		ArrayList<TeamDto> obj = new ArrayList<TeamDto>();
		int count=0;
		int success=0;
		obj=inter.selectTeam(idx);
		count=obj.size();
		String msg="신청권한이 없습니다.";
		logger.info("count:{}",count);
		if(count>0){
			map.put("teamList",obj);
			success=1;
		}else{
			map.put("msg", msg);
		}
		map.put("success", success);
		return map;
	}


	public ModelAndView sendNote(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(MatchInterface.class);
		int success=0;
		String msg="신청 쪽지 보내기가 실패했습니다.";
		String writer=params.get("writer");
		String writer_idx=params.get("t_idx");
		String receiver = params.get("recever");
		String receiver_idx=params.get("receverIdx");
		String content=params.get("noteContent");
		String title=params.get("noteTitle");
		String mchIdx=params.get("mchIdx");
		logger.info(writer+"/"+receiver+"/"+content+"/"+title+"/"+mchIdx);
		String confirm="Stay";
		String newState="Y";
		success=inter.sendNote(writer, writer_idx, receiver, receiver_idx, title, content, confirm, newState, mchIdx);
		if(success==1){
			msg="신청 쪽지 보내기가 성공했습니다.";
		}
		mav.addObject("msg",msg);
		mav.setViewName("matchList");
		return mav;
	}


	public Map<String, ArrayList<MatchDto>> playing() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Map<String, ArrayList<MatchDto>> map = new HashMap<String, ArrayList<MatchDto>>();
        Calendar c1 = Calendar.getInstance();
        inter=sqlSession.getMapper(MatchInterface.class);
        int hour = c1.get(Calendar.HOUR_OF_DAY)-2;
        int min = c1.get(Calendar.MINUTE);
        String[] toDayTime = sdf.format(c1.getTime()).split(" ");
        String toDay=toDayTime[0];
        String toTime=toDayTime[1];
        String preTime="";
        if(hour<10){
        	preTime+="0";
        }
        preTime+=Integer.toString(hour)+":";
        if(min<10){
        	preTime+="0";
        }
        preTime+=Integer.toString(min);
        logger.info(toDay+" "+preTime+"~"+toTime);
        map.put("mchList", inter.mch_playing(toDay, preTime, toTime));
		return map;
	}


	
	
	


}
