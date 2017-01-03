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

import com.spring.main.dao.AdInterface;
import com.spring.main.dto.TdDto;
import com.spring.main.util.UploadFile;

@Service
public class AdService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	AdInterface inter = null;

	public Map<String, Object> listCall(Map<String, String> params) {
		inter = sqlSession.getMapper(AdInterface.class);
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
		String type = params.get("type");
		String value = params.get("value");
		logger.info(value);
		if(value!=""){
			allCnt = inter.searchCount(type,value); //전체 게시물 수
			obj.put("list", inter.search(start,end,type,value));
			logger.info("검색");
		}else{
			allCnt = inter.allCount();			//전체 게시물 수
			obj.put("list", inter.listCall(start,end));
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

	//광고 글쓰기
	public ModelAndView write(MultipartHttpServletRequest multi) {
		
		inter = sqlSession.getMapper(AdInterface.class);
		ModelAndView mav = new ModelAndView();
		String ad_title = multi.getParameter("ad_title");
		String ad_manager = multi.getParameter("ad_manager");
		String ad_host = multi.getParameter("ad_host");
		String ad_type = multi.getParameter("ad_type");
		String ad_count = multi.getParameter("ad_count");
		String s_date = multi.getParameter("s_date");
		String e_date = multi.getParameter("e_date");
		String[] ad_URL = multi.getParameterValues("ad_URL");
		String ad_area = multi.getParameter("ad_area");
		String ad_address = multi.getParameter("address");
		String ad_lat = multi.getParameter("lat");
		String ad_lng = multi.getParameter("lng");
		String ad_content = multi.getParameter("ad_content");
		String fileName = multi.getParameter("fileName");
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileUp(multi);
		}
		ArrayList<String> oldName = newFile.get("oldName");
		ArrayList<String> newName = newFile.get("newName");
		String ad_idx = inter.idxCall();
		logger.info(ad_URL[1]+"/"+ad_URL[2]+"/"+ad_URL[0]+"/"+ad_type+"/"+ad_area);
		int success = inter.write(ad_idx,ad_host,ad_manager,ad_type,ad_title,ad_content,ad_area,ad_address,ad_lat,ad_lng,s_date,e_date,ad_count);
		for(int i=0; i<oldName.size(); i++){
			logger.info(ad_URL[i]+"/"+oldName.get(i)+"/"+newName.get(i));
		inter.fileUp(ad_idx,oldName.get(i),newName.get(i),ad_URL[i]);
		}
		mav.setViewName("adList");
		return mav;
	}
	
	//삭제
	public ModelAndView delete(Map<String, String> params) {
		
		inter = sqlSession.getMapper(AdInterface.class);
		ModelAndView mav = new ModelAndView();
		String ad_idx = params.get("ad_idx");
		
		String[] delName = inter.fileDelName(ad_idx);
		logger.info(Integer.toString(delName.length));
		//글삭제
		if(inter.delete(ad_idx) == 1){
			//파일삭제
			if(delName != null){				
				UploadFile file = new UploadFile();
				for(int i=0 ; i<delName.length;i++){
					logger.info("지운다 : "+delName[i]);
					file.delete(delName[i]);
				}				
			}
		}
		mav.setViewName("adList");
		return mav;
	}
	
	//수정(파일 업로드)
	public ModelAndView modify(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(AdInterface.class);
		ModelAndView mav = new ModelAndView();
		String ad_idx = multi.getParameter("ad_idx");
		String ad_title = multi.getParameter("ad_title");
		String ad_manager = multi.getParameter("ad_manager");
		String ad_host = multi.getParameter("ad_host");
		String ad_type = multi.getParameter("ad_type");
		String ad_count = multi.getParameter("ad_count");
		String s_date = multi.getParameter("s_date");
		String e_date = multi.getParameter("e_date");
		String[] ad_URL = multi.getParameterValues("ad_URL");
		String ad_area = multi.getParameter("ad_area");
		String ad_address = multi.getParameter("ad_address");
		String ad_lat = multi.getParameter("ad_lat");
		String ad_lng = multi.getParameter("ad_lng");
		String ad_content = multi.getParameter("ad_content");
		String fileName = multi.getParameter("fileName");
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			String[] delName = inter.fileDelName(ad_idx);
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileModify(multi,delName);
		}
		ArrayList<String> oldName = newFile.get("oldName");
		ArrayList<String> newName = newFile.get("newName");
		inter.update(ad_idx,ad_host,ad_manager,ad_type,ad_title,ad_content,ad_area,ad_address,ad_lat,ad_lng,s_date,e_date,ad_count);
		for(int i=0; i<newName.size(); i++){
			if(oldName.get(i)!=""){
				inter.fileModify(ad_idx, oldName.get(i),newName.get(i),ad_URL[i]);
			}
		}
		mav.setViewName("adList");
		return mav;
	}

	//광고 상세보기
	public ModelAndView adDetail(String ad_idx) {
		inter = sqlSession.getMapper(AdInterface.class);
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
