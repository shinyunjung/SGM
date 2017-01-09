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

import com.spring.main.dao.PlaceInterface;
import com.spring.main.dao.TdInterface;
import com.spring.main.dao.TeamInterface;
import com.spring.main.dto.PlaceDto;
import com.spring.main.dto.PrDto;
import com.spring.main.util.UploadFile;

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


	
/*
	//검색 하려다 말았음
	public Map<String, Object> search(Map<String, String> params) {
		inter=sqlSession.getMapper(PlaceInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String input=params.get("input");
		String type=params.get("type");
		int allCnt = inter.a_searhCount(input, type);
		json.put("count", allCnt);
		return json;
	}*/


	//장소 게시판 글 등록
	public ModelAndView write(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(PlaceInterface.class);
		int success=0;
		String a_name = multi.getParameter("a_name");
		String a_area = multi.getParameter("a_area");
		String a_address = multi.getParameter("address");
		String a_content = multi.getParameter("a_content");
		a_content = a_content.replace("\r\n","<br>");
		String a_ground = multi.getParameter("a_ground");
		String a_lat = multi.getParameter("lat");
		String a_lng = multi.getParameter("lng");
		String fileName = multi.getParameter("fileName");
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(fileName !=null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileUp(multi);
		}
		ArrayList<String> newName = newFile.get("newName");
		logger.info(a_ground+"/"+a_name+"/"+a_content+"/"+a_lat+"/"+a_lng+"/"+a_area);
		success = inter.a_write(a_name,a_area,a_address,a_ground,a_content,fileName,newName.get(0),a_lat,a_lng);
		
		mav.addObject("success",success);
		mav.setViewName("redirect:placeList");
		logger.info("장소추가");
		return mav;
	}


	
	//장소 상세보기
	public ModelAndView placeDetail(String idx) {
		inter=sqlSession.getMapper(PlaceInterface.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("detail",inter.a_detail(idx));
		mav.setViewName("placeDetail");
		return mav;
	}
	
	//장소수정보기
	public ModelAndView placeModify(String idx) {
		inter=sqlSession.getMapper(PlaceInterface.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("detail",inter.a_detail(idx));
		mav.setViewName("placeModify");
		return mav;
	}
	
	//장소 게시판 글 수정
	public ModelAndView modify(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(PlaceInterface.class);
		int success=0;
		String a_idx = multi.getParameter("a_idx");
		String a_area = multi.getParameter("a_area");
		String a_address = multi.getParameter("address");
		String a_content = multi.getParameter("a_content");
		a_content = a_content.replace("\r\n","<br>");
		String a_ground = multi.getParameter("a_ground");
		String a_lat = multi.getParameter("lat");
		String a_lng = multi.getParameter("lng");
		String fileName = multi.getParameter("fileName");
		logger.info(fileName);
		String newfileName = "";
		String[] delName = inter.fileDelName(a_idx);
		Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
		if(!fileName.equals("")){
			//파일 업로드
			UploadFile upload = new UploadFile();
			newFile = upload.fileModify(multi,delName);
			ArrayList<String> newName = newFile.get("newName");
			newfileName = newName.get(0);
		}else{
			newfileName = delName[0];
		}
		logger.info(a_ground+"/"+a_idx+"/"+a_content+"/"+a_lat+"/"+a_lng+"/"+a_area);
		success = inter.a_modify(a_idx,a_area,a_address,a_ground,a_content,fileName,newfileName,a_lat,a_lng);
		
		mav.addObject("success",success);
		mav.setViewName("redirect:placeList");
		logger.info("장소수정");
		return mav;
	}

	//삭제
	public ModelAndView delete(String idx) {
		
		ModelAndView mav = new ModelAndView();
		inter=sqlSession.getMapper(PlaceInterface.class);
		
		String[] delName = inter.fileDelName(idx);
		logger.info(Integer.toString(delName.length));
		//글삭제
		if(inter.a_delete(idx) == 1){
			//파일삭제
			if(delName != null){				
				UploadFile file = new UploadFile();
				for(int i=0 ; i<delName.length;i++){
					logger.info("지운다 : "+delName[i]);
					file.delete(delName[i]);
				}				
			}
		}
		mav.setViewName("redirect:placeList");
		
		return mav;
	}
	


	
	
	


}
