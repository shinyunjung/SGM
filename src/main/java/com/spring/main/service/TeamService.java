package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.TeamInterface;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.TeamDto;
import com.spring.main.util.UploadFile;


@Service
public class TeamService {

	@Autowired
	SqlSession sqlSession;
	
	TeamInterface inter = null;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//팀리스트불러오기
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

	//팀상세
	public ModelAndView teamDetail(String t_idx) {
		
		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();

		mav.addObject("team",inter.teamDetail(t_idx));
		mav.addObject("evalue",inter.evalueCall(t_idx));
		mav.addObject("ent",inter.entCall(t_idx));
		mav.addObject("member",inter.memberCall(t_idx));
		mav.addObject("meCnt",inter.memberCount(t_idx));
		mav.setViewName("teamDetail");
		
		return mav;
	}

	//엠버개인기록
	public ModelAndView memberDetail(String m_idx,String t_idx) {
		
		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("team",inter.memberDetail(m_idx));
		mav.addObject("team",inter.teamInfo(t_idx));
		mav.addObject("member",inter.grade(t_idx));
		mav.setViewName("memberDetail");
		return mav;
	}

	//팀생성
	public ModelAndView insertTeam(MultipartHttpServletRequest multi) {

		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();
		
		String u_idx = multi.getParameter("u_idx");
		String u_name = multi.getParameter("u_name");
		String t_name = multi.getParameter("t_name");
		String t_area = multi.getParameter("t_area");
		String t_day[] = multi.getParameterValues("t_day");
		String t_time = multi.getParameter("t_time");
		String t_uniform = multi.getParameter("t_uniform");
		String fileName = multi.getParameter("fileName");
		String t_age = multi.getParameter("t_age");
		String day = "";
		logger.info(day);
		for(int i=0; i<t_day.length; i++){
			day += t_day[i];
			if (i < t_day.length - 1) day += ",";
		}
		
		String t_idx = inter.idxCall();//t_idx받기
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileUp(multi);
		}
		ArrayList<String> newName = newFile.get("newName");
		inter.insertTeam(t_idx,t_name,t_area,day,t_time,t_uniform,fileName,newName.get(0),t_age);
		inter.memberAdd(u_idx,t_idx,u_name,"","대표");
		mav.setViewName("redirect:../team/teamDetail?t_idx="+t_idx);
		return mav;
	}

	//중복체크
	public Map<String, String> tName(String t_name) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, String> json = new HashMap<String, String>();
		String use = "N";
		if(inter.tName(t_name) == null){
			use = "Y";
		}
		json.put("use", use);
		return json;
	}

	//팀수정
	public ModelAndView teamUpdate(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();
		
		String t_idx = multi.getParameter("t_idx");
		String t_area = multi.getParameter("t_area");
		String t_day = multi.getParameter("t_day");
		String t_time = multi.getParameter("t_time");
		String t_uniform = multi.getParameter("t_uniform");
		String fileName = multi.getParameter("fileName");
		String t_age = multi.getParameter("t_age");
		
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileUp(multi);
			ArrayList<String> newName = newFile.get("newName");
			String delName = inter.oldName(t_idx);
			inter.picture(fileName,newName.get(0),t_idx);
			//파일삭제
			if(delName != null){				
				UploadFile file = new UploadFile();
				logger.info("지운다 : "+delName);
				file.delete(delName);			
			}
		}
		inter.teamUpdate(t_area,t_day,t_time,t_uniform,t_age,t_idx);
		
		mav.setViewName("redirect:../team/teamDetail?t_idx="+t_idx);
		return mav;
	}

	//팀삭제
	public Map<String, String> teamDel(String t_idx) {

		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, String> json = new HashMap<String, String>();
		String delName = inter.oldName(t_idx);
		//글삭제
		String msg = "삭제에 실패 했습니다.";
		if(inter.teamDel(t_idx) == 1){
			msg = "삭제에 성공 했습니다.";
			//파일삭제
			if(delName != null){				
				UploadFile file = new UploadFile();
				logger.info("지운다 : "+delName);
				file.delete(delName);			
			}
		}
		json.put("msg", msg);
		return json;
	}

	//팀수정 페이지 이동
	public ModelAndView teamModify(String t_idx) {
		inter = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("team",inter.teamDetail(t_idx));
		mav.addObject("member",inter.updateCall(t_idx));	
		mav.setViewName("teamModify");
		return mav;
	}

	//멤버추가
	public Map<String, Object> memberAdd(Map<String, String> params) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<MemberDto>> obj = new HashMap<String, ArrayList<MemberDto>>();

		String u_id = params.get("u_id");
		String t_idx = params.get("t_idx");
		String m_name = params.get("m_name");
		String m_position = params.get("m_position");
		String msg = "추가에 실패 했습니다.";
		int success = 0;
		if(u_id.equals("")){
			success = inter.memberAdd("",t_idx,m_name,m_position,"멤버");
		}else{
			String idx = inter.uidx(u_id);
			if(idx!=null){
				if(inter.uCount(idx)<3){
					success = inter.memberAdd(idx,t_idx,m_name,m_position,"멤버");
				}else{
					msg = "3개 팀에 가입된 ID로 더이상 가입하실 수 없습니다.";
				}
			}else{
				msg = "존재하지 않는 ID입니다. 다시한번 확인해주세요.";
			}
		}
		if(success == 1){
			msg = "추가에 성공 했습니다.";
		}
		obj.put("member",inter.updateCall(t_idx));
		json.put("list", obj);
		json.put("msg", msg);
		return json;
	}

	//멤버수정
	public Map<String, Object> memberup(Map<String, String> params) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<MemberDto>> obj = new HashMap<String, ArrayList<MemberDto>>();
		
		String t_idx = params.get("t_idx");
		String u_id = params.get("u_id");
		String m_idx = params.get("m_idx");
		String m_position = params.get("m_position");
		String msg = "등록에 실패 했습니다.";
		int success = 0;
		if(u_id.equals("")){
			success = inter.memberup("",m_position,m_idx);
		}else{
			String idx = inter.uidx(u_id);
			if(idx!=null){
				if(inter.uCount(idx)<3){
					success = inter.memberup(idx,m_position,m_idx);
				}else{
					msg = "3개 팀에 가입된 ID로 더이상 가입하실 수 없습니다.";
				}
			}else{
				msg = "존재하지 않는 ID입니다. 다시한번 확인해주세요.";
			}
		}
		if(success == 1){
			msg = "등록에 성공 했습니다.";
		}
		obj.put("member",inter.updateCall(t_idx));
		json.put("list", obj);
		return json;
	}

	//멤버삭제
	public Map<String, Object> memberDel(@RequestParam Map<String, String> params) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<MemberDto>> obj = new HashMap<String, ArrayList<MemberDto>>();
		
		String m_idx = params.get("m_idx");
		String t_idx = params.get("t_idx");
		
		String msg = "삭제에 실패 했습니다.";
		if(inter.memberDel(m_idx) == 1){
			msg = "삭제에 성공 했습니다.";
		}
		obj.put("member",inter.updateCall(t_idx));
		json.put("list", obj);
		json.put("msg", msg);
		return json;
	}

	//대표변경
	public Map<String, String> leader(@RequestParam Map<String, String> params) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, String> json = new HashMap<String, String>();
		
		String m_idx = params.get("m_idx");
		String t_idx = params.get("t_idx");
		
		String msg = "변경에 실패 했습니다.";
		int dn = inter.leaderDn(t_idx);
		int up = inter.leaderUp(m_idx);
		if(dn == 1 && up == 1){
			msg = "변경에 성공 했습니다.";
		}
		json.put("msg", msg);
		return json;
	}

	//멤버 탈퇴
	public Map<String, String> Delete(Map<String, String> params) {
		inter = sqlSession.getMapper(TeamInterface.class);
		Map<String, String> json = new HashMap<String, String>();
		
		String u_idx = params.get("u_idx");
		String t_idx = params.get("t_idx");
		
		String msg = "탈퇴에 실패 했습니다.";
		if(inter.Delete(t_idx,u_idx) == 1){
			msg = "탈퇴에 성공 했습니다.";
		}
		json.put("msg", msg);
		return json;
	}

}
