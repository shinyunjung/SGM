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

import com.spring.main.dao.FreeInterface;
import com.spring.main.dto.RepleDto;
import com.spring.main.dto.freelistDTO;

@Service
public class FreeService {
	
	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	FreeInterface inter = null;

	//리스트 보여주기
	   public Map<String, Object> f_listCall(Map<String, String> params) {
	         Map<String, ArrayList<freelistDTO>> obj = 
	        		 new HashMap<String, ArrayList<freelistDTO>>();
	         Map<String, Object> json = new HashMap<String, Object>();
	         inter=sqlSession.getMapper(FreeInterface.class);
	         
	         int currPage=Integer.parseInt(params.get("page"));//현재 페이지
	         
	         int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
	         logger.info("자유리스트뛰움");
	         logger.info(currPage+"/"+pagePerNum);
	         
	         //게시물 시작과 끝 번호
	         int end=pagePerNum*currPage;
	         int start=end-pagePerNum+1;
	         int allCnt = inter.f_allCount();
	         
	         int totalPage=allCnt/pagePerNum;
	         System.out.println(totalPage%pagePerNum);
	         if(allCnt%pagePerNum!=0){
	            totalPage+=1;
	         }
	         logger.info("전체 개시물:{}",allCnt);
	         
	         obj.put("list", inter.f_listCall(start, end));
	         json.put("jsonList", obj);
	         json.put("currPage", currPage);
	         json.put("totalCount", allCnt);
	         json.put("totalPage", totalPage);
	         logger.info("자유리스트뛰움");
	         return json;
	      }

	   
	//리스트 검색
	public Map<String, Object> f_searchCall(
			Map<String, String> params) {
		 Map<String, ArrayList<freelistDTO>> obj = 
				 new HashMap<String, ArrayList<freelistDTO>>();
         Map<String, Object> json = new HashMap<String, Object>();
         inter=sqlSession.getMapper(FreeInterface.class);
         
         int currPage=Integer.parseInt(params.get("page"));//현재 페이지
         
         int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
         
         String input = params.get("input");
         String type = params.get("type");
         
         logger.info(currPage+"/"+pagePerNum+"/"+input);
         logger.info("검색요청11");
         
         //게시물 시작과 끝 번호
         int end=pagePerNum*currPage;
         int start=end-pagePerNum+1;
         int allCnt=0;
         if(input!=""){
            allCnt = inter.f_searhCount(input, type);
            obj.put("list", inter.f_searhCall(start, end, input, type));
         }else{
            allCnt = inter.allCount();
            obj.put("list", inter.f_listCall(start, end));
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
         
         logger.info("검색요청2");
         
         return json;

	}
	
		//검색 요청
		public Map<String, Object> f_search(Map<String, String> params) {
			inter=sqlSession.getMapper(FreeInterface.class);
	         Map<String, Object> json = new HashMap<String, Object>();
	         String input=params.get("input");
	         String type=params.get("type");
	         int allCnt = inter.f_searhCount(input, type);
	         json.put("count", allCnt);

       
         return json;
      } 
		
		//상세보기
		@Transactional
		public ModelAndView freeDetail(String j_idx) {		
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();
			//조회수
			inter.j_vcount(j_idx);
			//불러오기
			logger.info("상세보기");
			mav.addObject("content", inter.freeDetail(j_idx));
			mav.setViewName("freeDetail");		
			return mav;
		}
		
		//글쓰기(일반)
		public ModelAndView write(Map<String, String> params) {		
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();		
			String j_title = params.get("j_title");
			String j_name = params.get("j_name");
			String j_content = params.get("j_content");		
			int success = inter.write(j_title, j_name, j_content);	
			String page = "freeList";
			String msg = "등록에 실패하였습니다.";	
			if(success == 1){
				msg = "등록에 성공 하였습니다.";
			}
			mav.addObject("msg", msg);
			mav.setViewName(page);		
			return mav;
		}

		//글삭제
		public ModelAndView delete(String j_idx) {
			inter = sqlSession.getMapper(FreeInterface.class);
		      ModelAndView mav = new ModelAndView();
		      logger.info(j_idx);
	
			         
		      String msg="삭제에 성공 했습니다.";
		     
		      //글삭제
		      if(inter.delete(j_idx) == 1){
		         msg="삭제에 성공 했습니다.";
		         
		      }
		      mav.addObject("msg", msg);      
		      mav.setViewName("freeList");
		      return mav;
		   }


		//수정 보기
		public ModelAndView freeModify(String j_idx) {
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();
			//불러오기
			logger.info("수정페이지1");
			mav.addObject("content", inter.freeDetail(j_idx));
			mav.setViewName("freeModify");		
			return mav;
		}

		//수정하기
		public ModelAndView update(Map<String, String> params) {
			inter = sqlSession.getMapper(FreeInterface.class);
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
			mav.setViewName("freeList");
			
			return mav;
		}
		
		//댓글 등록
		public Map<String, String> replyRegist(Map<String, String> params) {
			Map<String, String> obj = new HashMap<String, String>();
			inter=sqlSession.getMapper(FreeInterface.class);
			int success=0;
			String msg="댓글 등록에 실패하셨습니다.";
			String r_idx=params.get("r_idx");
			String r_replyer=params.get("r_replyer");
			String r_reple=params.get("r_reple");
			int r_category = Integer.parseInt(params.get("r_category"));
			logger.info(r_idx);
			logger.info(r_replyer);
			logger.info(r_reple);
			success=inter.f_replyRegist(r_category, r_idx, r_replyer, r_reple);
			if(success==1){
				inter.f_replyUp(r_idx);
				msg="댓글 등록에 성공하셨습니다.";
			}
			obj.put("msg", msg);
			return obj;
		}


		public Map<String, ArrayList<RepleDto>> replyList(Map<String, String> params) {
			Map<String, ArrayList<RepleDto>> obj = new HashMap<String, ArrayList<RepleDto>>();
			inter=sqlSession.getMapper(FreeInterface.class);
			String r_idx=params.get("r_idx");
			String r_category=params.get("r_category");
			obj.put("replyList", inter.f_replyList(r_idx, r_category));
			
			return obj;
		}


		public Map<String, String> replyDel(Map<String, String> params) {
			Map<String, String> obj = new HashMap<String, String>();
			int success=0;
			inter=sqlSession.getMapper(FreeInterface.class);
			String r_idx=params.get("r_idx");
			String r_category=params.get("r_category");
			String r_parentIdx = params.get("r_parent");
			String msg="삭제에 실패했습니다.";
			
			success=inter.f_replyDel(r_idx, r_category);
			if(success==1){
				inter.f_repleDown(r_parentIdx);
				msg="삭제에 성공했습니다.";
			}
			obj.put("msg", msg);
			return obj;
		}
		
}

