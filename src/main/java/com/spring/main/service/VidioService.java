package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.TdInterface;
import com.spring.main.dao.VidioInterface;
import com.spring.main.dto.BoardDto;
import com.spring.main.util.UploadFile;

@Service
public class VidioService {

	@Autowired SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	Map<String, String> fileList = new HashMap<String, String>();
	
	VidioInterface inter = null;
	TdInterface vidio = null;

		//리스트 불러오기
		public Map<String, Object> v_listCall(Map<String, String> params) {
			Map<String, ArrayList<BoardDto>> obj = new HashMap<String, ArrayList<BoardDto>>();
			Map<String, Object> json = new HashMap<String, Object>();
			inter=sqlSession.getMapper(VidioInterface.class);
			
			int currPage=Integer.parseInt(params.get("page"));//현재 페이지
			
			int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
			
			String input = params.get("input");
			String type = params.get("type");
			int j_category = 2;
			
			logger.info(currPage+"/"+pagePerNum+"/"+input);
			
			//게시물 시작과 끝 번호
			int end=pagePerNum*currPage;
			int start=end-pagePerNum+1;
			int allCnt=0;
			if(input!=""){
				allCnt = inter.v_searhCount(input, type, j_category);
				obj.put("list", inter.v_searhCall(start, end, input, type, j_category));
			}else{
				allCnt = inter.v_allCount(j_category);
				obj.put("list", inter.v_listCall(start, end, j_category));
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

		//글등록
		public ModelAndView Write(Map<String, String> params) {      
			inter=sqlSession.getMapper(VidioInterface.class);
		    ModelAndView mav = new ModelAndView();      
		    String j_title = params.get("v_title");
		    String j_name = params.get("v_name");
		    String j_content = params.get("v_content");      
		    int j_category = 2;
		    int success = inter.Write(j_title, j_name, j_content, j_category); 
		    String page = "vidioList";
		    String msg = "등록에 실패하였습니다.";   
		    if(success == 1){
		       msg = "등록에 성공 하였습니다.";
		    }
		    mav.addObject("msg", msg);
		    mav.setViewName(page);
		    return mav;
		}
		//글쓰기(파일 업로드)
		public ModelAndView write(MultipartHttpServletRequest multi) {
			vidio = sqlSession.getMapper(TdInterface.class);
			ModelAndView mav = new ModelAndView();
			String u_idx = multi.getParameter("u_idx");
			String j_category = "2";
			String j_title = multi.getParameter("j_title");
			String j_content = multi.getParameter("j_content");
			String j_name = multi.getParameter("j_name");
			String fileName = multi.getParameter("fileName");
			String idx = vidio.idxCall();
			logger.info(j_title+"/"+j_content+"/"+j_name+"/"+fileName);
			vidio.write(idx,u_idx,j_category,j_name, j_title, j_content);
			
			Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
			if(fileName != null){
				//파일 업로드
				UploadFile upload = new UploadFile();
				newFile = upload.fileUp(multi);
			}
			ArrayList<String> oldName = newFile.get("oldName");
			ArrayList<String> newName = newFile.get("newName");
			
			for(int i=0; i<newName.size(); i++){
				vidio.fileUp(idx,j_category, oldName.get(i),newName.get(i));
			}
			mav.setViewName("redirect:vidioList");
			return mav;
		}

		//상세보기
		@Transactional
		public ModelAndView vidioDetail(String idx) {
			vidio = sqlSession.getMapper(TdInterface.class);
			ModelAndView mav = new ModelAndView();
			//조회수
			inter.j_vcount(idx);
			//불러오기
			logger.info("상세보기");
			mav.addObject("content", vidio.tdDetail(idx));
			mav.addObject("file",vidio.fileCall(idx));
			mav.setViewName("vidioDetail");      
			return mav;
		}


	    //수정 보기
	    public ModelAndView vidioModify(String idx) {
	    	vidio = sqlSession.getMapper(TdInterface.class);
	       ModelAndView mav = new ModelAndView();
	       //불러오기
	       logger.info("수정페이지1");
	       mav.addObject("content", vidio.tdDetail(idx));
	       mav.addObject("file",vidio.fileCall(idx));
	       mav.setViewName("vidioModify");      
	       return mav;
	    }
		
		//글 수정
		public ModelAndView modify(MultipartHttpServletRequest multi) {
			ModelAndView mav = new ModelAndView();
			vidio=sqlSession.getMapper(TdInterface.class);
			int success=0;
			String idx = multi.getParameter("idx");
			String j_title = multi.getParameter("j_title");
			String j_content = multi.getParameter("j_content");
			String fileName = multi.getParameter("fileName");
			logger.info(fileName);
			String newfileName = "";
			Map<String, ArrayList<String>> newFile = new HashMap<String, ArrayList<String>>();
			success = vidio.update(idx, j_title, j_content);
			if(!fileName.equals("")){
				String[] delName = vidio.fileDelName(idx);
				//파일 업로드
				UploadFile upload = new UploadFile();
				newFile = upload.fileModify(multi,delName);
				ArrayList<String> newName = newFile.get("newName");
				newfileName = newName.get(0);
				if(newfileName!=""){
					vidio.fileModify(delName[0],fileName,newfileName);
				}
			}
			
			mav.addObject("success",success);
			mav.setViewName("redirect:placeList");
			logger.info("장소수정");
			return mav;
		}

		//삭제
		public ModelAndView delete(String idx) {
			
			ModelAndView mav = new ModelAndView();
			vidio=sqlSession.getMapper(TdInterface.class);
			
			String[] delName = vidio.fileDelName(idx);
			logger.info(Integer.toString(delName.length));
			//글삭제
			if(vidio.delete(idx) == 1){
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
