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
import com.spring.main.dto.TdDto;
import com.spring.main.util.FileUpload;

@Service
public class TdService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	TdInterface inter = null;

	public Map<String, Object> tdList(Map<String, String> params) {
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
	
	/*//파일 업로드
	public  Map<String, Object> fileUP(MultipartHttpServletRequest multi) {
		inter = sqlSession.getMapper(TdInterface.class);
		Map<String, Object> json = new HashMap<String, Object>();
		String j_category = multi.getParameter("idx");
		String fileName = multi.getParameter("fileName");
		logger.info(fileName);
		String newFileName = null;
		if(fileName !=null){
			//파일 업로드
			FileUpload upload = new FileUpload();
			newFileName = upload.fileUp(multi);
		}
		int success = inter.fileUp(j_category,fileName,newFileName);
		
		
		json.put("file", success);
		return json;
	}*/

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
			String newFileName = null;
			if(fileName !=null){
				//파일 업로드
				FileUpload upload = new FileUpload();
				newFileName = upload.fileUp(multi);
			}
			int j_idx = inter.idxCall();
			logger.info(j_title+"/"+j_content+"/"+j_name+"/"+fileName+"/"+newFileName);
			int success = inter.write(j_idx,u_idx,j_category,j_name, j_title, j_content);
			inter.fileUp(j_idx,j_category, fileName, newFileName);
			mav.setViewName("teamDetail");
			return mav;
		}


}
