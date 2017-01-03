package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.TdInterface;
import com.spring.main.dao.TeamInterface;
import com.spring.main.dto.FileDto;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.PrDto;
import com.spring.main.dto.TdDto;
import com.spring.main.util.UploadFile;


@Service
public class TdService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	TdInterface inter = null;
	TeamInterface team = null;
	
	//팀일지 리스트 팀정보
	public ModelAndView tdList(String t_idx) {
		
		team = sqlSession.getMapper(TeamInterface.class);
		ModelAndView mav = new ModelAndView();

		mav.addObject("team",team.teamDetail(t_idx));
		mav.addObject("evalue",team.evalueCall(t_idx));
		mav.addObject("ent",team.entCall(t_idx));
		mav.addObject("member",team.memberCall(t_idx));
		mav.addObject("meCnt",team.memberCount(t_idx));
		mav.setViewName("tdList");
		
		return mav;
	}
	
	//리스트 불러오기
	public Map<String, Object> listCall(Map<String, String> params) {
		inter = sqlSession.getMapper(TdInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<TdDto>> obj = new HashMap<String, ArrayList<TdDto>>();
		
		//현재 페이지
		int currPage = Integer.parseInt(params.get("page"));
		//페이지당 보여 줄 게시물 갯수
		int pagePerNum = Integer.parseInt(params.get("pagePerNum"));
		logger.info("현재 페이지: {}",currPage);
		logger.info("페이지 당 보여줄 수: {}",pagePerNum);
		int end = currPage*pagePerNum;	//게시물 끝번호
		int start = end-pagePerNum+1;	//게시물 시작번호
		int allCnt = 0;
		String j_category = params.get("j_category");
		String type = params.get("type");
		String value = params.get("value");
		logger.info(value);
		if(value!=""){
			allCnt = inter.searchCount(j_category,type,value); //전체 게시물 수
			obj.put("list", inter.search(start,end,j_category,type,value));
			logger.info("검색");
		}else{
			allCnt = inter.allCount(j_category);			//전체 게시물 수
			obj.put("list", inter.listCall(start,end,j_category));
			logger.info("리스트");
		}
		logger.info("전체게시물 수: {}",allCnt);
		int page = allCnt%pagePerNum >0 ?
				Math.round(allCnt/pagePerNum)+1:Math.round(allCnt/pagePerNum);//생성 할 수 있는 페이지
		
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);
		json.put("page", page);
		return json;
	}

	//글쓰기(파일 업로드)
	public ModelAndView write(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(TdInterface.class);
		ModelAndView mav = new ModelAndView();
		String u_idx = multi.getParameter("u_idx");
		String j_category = multi.getParameter("j_category");
		String j_title = multi.getParameter("j_title");
		String j_content = multi.getParameter("j_content");
		String j_name = multi.getParameter("j_name");
		String fileName = multi.getParameter("fileName");
		String tf = multi.getParameter("tf");
		String idx = inter.idxCall();
		logger.info(j_title+"/"+j_content+"/"+j_name+"/"+fileName);
		inter.write(idx,u_idx,j_category,j_name, j_title, j_content);
		if(tf.equals("t")){
			String p_date = multi.getParameter("p_date");
			String[] p_goal = multi.getParameterValues("p_goal[]");
			String[] p_assist = multi.getParameterValues("p_assist[]");
			String[] p_shoot = multi.getParameterValues("p_shoot[]");
			String[] p_poul = multi.getParameterValues("p_poul[]");
			String[] p_warning = multi.getParameterValues("p_warning[]");
			String[] p_off = multi.getParameterValues("p_off[]");
			String[] p_ck = multi.getParameterValues("p_ck[]");
			String[] p_pk = multi.getParameterValues("p_pk[]");
			String[] p_offside = multi.getParameterValues("p_offside[]");
			String[] p_effectshot = multi.getParameterValues("p_effectshot[]");
			String[] m_idx = multi.getParameterValues("chk[]");
			for(int i=0; i<m_idx.length; i++){
	        int p_atkpoint = Integer.parseInt(p_goal[i])+Integer.parseInt(p_assist[i]);
			inter.record(idx,m_idx[i],p_offside[i],p_effectshot[i],p_goal[i],
					p_assist[i],p_atkpoint,p_shoot[i],p_poul[i],p_warning[i],
					p_off[i],p_ck[i],p_pk[i],p_date);
			inter.point(p_atkpoint,m_idx[i]);
			}
		}
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileUp(multi);
		}
		ArrayList<String> oldName = newFile.get("oldName");
		ArrayList<String> newName = newFile.get("newName");
		
		for(int i=0; i<newName.size(); i++){
			inter.fileUp(idx,j_category, oldName.get(i),newName.get(i));
		}
		String t_idx = j_category.substring(1);
		mav.setViewName("redirect:../td/tdList?t_idx="+t_idx);
		return mav;
	}

		//멤버정보 가져오기
		public Map<String, Object> member(String t_idx) {
			inter = sqlSession.getMapper(TdInterface.class);
			Map<String, Object> json = new HashMap<String, Object>();
			Map<String, ArrayList<MemberDto>> obj = new HashMap<String, ArrayList<MemberDto>>();


			obj.put("list", inter.member(t_idx));
			json.put("jsonList", obj);
			return json;
		}
		
		//상세보기
		public ModelAndView tdDetail(Map<String, String> params) {
			
			inter = sqlSession.getMapper(TdInterface.class);
			team = sqlSession.getMapper(TeamInterface.class);
			ModelAndView mav = new ModelAndView();
			String idx = params.get("idx");
			String t_idx = params.get("t_idx");

			inter.upHit(idx);
			mav.addObject("td",inter.tdDetail(idx));
			mav.addObject("file",inter.fileCall(idx));
			mav.addObject("record",inter.tdRecord(idx));
			mav.addObject("team",team.teamInfo(t_idx));
			mav.addObject("member",team.grade(t_idx));
			mav.setViewName("tdDetail");
			
			return mav;
		}
		
		//삭제
		public ModelAndView delete(Map<String, String> params) {
			
			inter = sqlSession.getMapper(TdInterface.class);
			team = sqlSession.getMapper(TeamInterface.class);
			ModelAndView mav = new ModelAndView();
			String idx = params.get("idx");
			String t_idx = params.get("t_idx");
			ArrayList<PrDto> del = inter.delMember(idx);
			for(int i=0; i<del.size(); i++){
				String m_idx = del.get(i).getM_idx();
				int p_atkpoint = Integer.parseInt(del.get(i).getP_atkpoint());
	        	inter.recordDel(idx);
				inter.pointDel(p_atkpoint,m_idx);
			}
			
			String[] delName = inter.fileDelName(idx);
			logger.info(Integer.toString(delName.length));
			//글삭제
			if(inter.delete(idx) == 1){
				//파일삭제
				if(delName != null){				
					UploadFile file = new UploadFile();
					for(int i=0 ; i<delName.length;i++){
						logger.info("지운다 : "+delName[i]);
						file.delete(delName[i]);
					}				
				}
			}
			mav.setViewName("redirect:../td/tdList?t_idx="+t_idx);
			
			return mav;
		}

		//수정보기
		public ModelAndView tdModify(Map<String, String> params) {
			inter = sqlSession.getMapper(TdInterface.class);
			team = sqlSession.getMapper(TeamInterface.class);
			ModelAndView mav = new ModelAndView();
			String idx = params.get("idx");
			String t_idx = params.get("t_idx");
			
			mav.addObject("td",inter.tdDetail(idx));
			mav.addObject("file",inter.fileCall(idx));
			mav.addObject("record",inter.modifyRec(t_idx,idx));
			mav.addObject("team",team.teamInfo(t_idx));
			mav.addObject("member",team.grade(t_idx));
			mav.setViewName("tdModify");
			
			return mav;
		}
		
		//수정(파일 업로드)
		public ModelAndView modify(MultipartHttpServletRequest multi) {
			inter = sqlSession.getMapper(TdInterface.class);
			ModelAndView mav = new ModelAndView();
			String idx = multi.getParameter("idx");
			String t_idx = multi.getParameter("t_idx");
			String j_title = multi.getParameter("j_title");
			String j_content = multi.getParameter("j_content");
			String fileName = multi.getParameter("fileName");
			String tf = multi.getParameter("tf");
			if(tf!="t"){
				String p_date = multi.getParameter("p_date");
				String[] p_goal = multi.getParameterValues("p_goal[]");
				String[] p_assist = multi.getParameterValues("p_assist[]");
				String[] p_shoot = multi.getParameterValues("p_shoot[]");
				String[] p_poul = multi.getParameterValues("p_poul[]");
				String[] p_warning = multi.getParameterValues("p_warning[]");
				String[] p_off = multi.getParameterValues("p_off[]");
				String[] p_ck = multi.getParameterValues("p_ck[]");
				String[] p_pk = multi.getParameterValues("p_pk[]");
				String[] p_offside = multi.getParameterValues("p_offside[]");
				String[] p_effectshot = multi.getParameterValues("p_effectshot[]");
				String[] oldAtk = multi.getParameterValues("oldAtk[]");
				String[] m_idx = multi.getParameterValues("chk[]");
				String[] set = multi.getParameterValues("set[]");
				for(int i=0; i<m_idx.length; i++){					
		        int p_atkpoint = Integer.parseInt(p_goal[i])+Integer.parseInt(p_assist[i]);
		        if(set[i].equals("in")){
				inter.record(idx,m_idx[i],p_offside[i],p_effectshot[i],p_goal[i],
						p_assist[i],p_atkpoint,p_shoot[i],p_poul[i],p_warning[i],
						p_off[i],p_ck[i],p_pk[i],p_date);
				inter.point(p_atkpoint,m_idx[i]);
		        }else if(set[i].equals("up")){
		        	int pointUp = p_atkpoint - Integer.parseInt(oldAtk[i]);
		        	inter.recordUP(idx,m_idx[i],p_offside[i],p_effectshot[i],p_goal[i],
							p_assist[i],p_atkpoint,p_shoot[i],p_poul[i],p_warning[i],
							p_off[i],p_ck[i],p_pk[i],p_date);
					inter.pointUp(pointUp,m_idx[i]);
		        }else if(set[i].equals("del")){
		        	inter.recordDel(idx);
					inter.pointDel(p_atkpoint,m_idx[i]);
		        }
				}
			}
			Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
			if(fileName !=null){
				String[] delName = inter.fileDelName(idx);
				//파일 업로드
				UploadFile upload = new UploadFile();
				newFile = upload.fileModify(multi,delName);
			}
			ArrayList<String> oldName = newFile.get("oldName");
			ArrayList<String> newName = newFile.get("newName");
			inter.update(idx, j_title, j_content);
			for(int i=0; i<newName.size(); i++){
				if(oldName.get(i)!=""){
					inter.fileModify(idx, oldName.get(i),newName.get(i));
				}
			}
			mav.setViewName("redirect:../td/tdList?t_idx="+t_idx);
			return mav;
		}
		
		

		


}
