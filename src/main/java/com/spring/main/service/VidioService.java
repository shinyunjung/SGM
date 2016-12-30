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
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.VidioInterface;
import com.spring.main.dto.vidioDTO;

@Service
public class VidioService {

	@Autowired SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	Map<String, String> fileList = new HashMap<String, String>();
	
	VidioInterface inter = null;

	//리스트 추가
		public Map<String, Object> v_listCall(Map<String, String> params) {
			Map<String, ArrayList<vidioDTO>> obj = new HashMap<String, ArrayList<vidioDTO>>();
			Map<String, Object> json = new HashMap<String, Object>();
			inter=sqlSession.getMapper(VidioInterface.class);
			
			int currPage=Integer.parseInt(params.get("page"));//현재 페이지
			
			int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
			
			logger.info(currPage+"/"+pagePerNum);
			
			//게시물 시작과 끝 번호
			int end=pagePerNum*currPage;
			int start=end-pagePerNum+1;
			int allCnt = inter.v_allCount();
			
			int totalPage=allCnt/pagePerNum;
			System.out.println(totalPage%pagePerNum);
			if(allCnt%pagePerNum!=0){
				totalPage+=1;
			}
			logger.info("전체 개시물:{}",allCnt);
			
			obj.put("list", inter.v_listCall(start, end));
			json.put("jsonList", obj);
			json.put("currPage", currPage);
			json.put("totalCount", allCnt);
			json.put("totalPage", totalPage);
			
			return json;
		}


		public Map<String, Object> v_searchCall(Map<String, String> params) {
			Map<String, ArrayList<vidioDTO>> obj = new HashMap<String, ArrayList<vidioDTO>>();
			Map<String, Object> json = new HashMap<String, Object>();
			inter=sqlSession.getMapper(VidioInterface.class);
			
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
				allCnt = inter.v_searhCount(input, type);
				obj.put("list", inter.v_searhCall(start, end, input, type));
			}else{
				allCnt = inter.allCount();
				obj.put("list", inter.v_listCall(start, end));
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


		public Map<String, Object> v_search(Map<String, String> params) {
			inter=sqlSession.getMapper(VidioInterface.class);
			Map<String, Object> json = new HashMap<String, Object>();
			String input=params.get("input");
			String type=params.get("type");
			int allCnt = inter.v_searhCount(input, type);
			json.put("count", allCnt);
			return json;
		}

		//글등록
		public ModelAndView Write(Map<String, String> params) {      
			inter=sqlSession.getMapper(VidioInterface.class);
		    ModelAndView mav = new ModelAndView();      
		    String j_title = params.get("v_title");
		    String j_name = params.get("v_name");
		    String j_content = params.get("v_content");      
		    int success = inter.Write(j_title, j_name, j_content); 
		    String page = "vidioList";
		    String msg = "등록에 실패하였습니다.";   
		    if(success == 1){
		       msg = "등록에 성공 하였습니다.";
		    }
		    mav.addObject("msg", msg);
		    mav.setViewName(page);
		    return mav;
		}

		//상세보기
		@Transactional
		public ModelAndView vidioDetail(String j_idx) {
			inter = sqlSession.getMapper(VidioInterface.class);
			ModelAndView mav = new ModelAndView();
			//조회수
			inter.j_vcount(j_idx);
			//불러오기
			logger.info("상세보기");
			mav.addObject("content", inter.vidioDetail(j_idx));
			mav.setViewName("vidioDetail");      
			return mav;
		}


		//글삭제
	    public ModelAndView delete(String j_idx) {
	      inter = sqlSession.getMapper(VidioInterface.class);
	         ModelAndView mav = new ModelAndView();
	         logger.info(j_idx);
	   
	                  
	         String msg="삭제에 성공 했습니다.";
	        
	         //글삭제
	         if(inter.delete(j_idx) == 1){
	            msg="삭제에 성공 했습니다.";
	            
	         }
	         mav.addObject("msg", msg);      
	         mav.setViewName("vidioList");
	         return mav;
	      }


	    //수정 보기
	    public ModelAndView vidioModify(String j_idx) {
	       inter = sqlSession.getMapper(VidioInterface.class);
	       ModelAndView mav = new ModelAndView();
	       //불러오기
	       logger.info("수정페이지1");
	       mav.addObject("content", inter.vidioDetail(j_idx));
	       mav.setViewName("vidioModify");      
	       return mav;
	    }

	    //수정하기
	    public ModelAndView update(Map<String, String> params) {
	       inter = sqlSession.getMapper(VidioInterface.class);
	       ModelAndView mav = new ModelAndView();      
	       String j_title = params.get("j_title");
	       String j_name = params.get("j_name");
	       String j_content = params.get("j_content");
	       String j_idx = params.get("j_idx");
	        logger.info(j_title+" / "+j_name+" / "+j_content);
	      String msg = "수정에 실패 했습니다.";
	       int success = inter.update(j_title, j_name, j_content, j_idx);
	       if(success == 1){
	          msg = "수정에 성공 했습니다.";
	       }
	       mav.addObject("msg", msg);
	       mav.setViewName("vidioList");
	       
	       return mav;
	    }
}
