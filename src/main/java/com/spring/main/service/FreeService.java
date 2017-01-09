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
import com.spring.main.dto.BoardDto;
import com.spring.main.dto.RepleDto;

@Service
public class FreeService {
	
	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	FreeInterface inter = null;

   
	//리스트
	public Map<String, Object> f_listCall(
			Map<String, String> params) {
		 Map<String, ArrayList<BoardDto>> obj = 
				 new HashMap<String, ArrayList<BoardDto>>();
         Map<String, Object> json = new HashMap<String, Object>();
         inter=sqlSession.getMapper(FreeInterface.class);
         
         int currPage=Integer.parseInt(params.get("page"));//현재 페이지
         
         int pagePerNum=Integer.parseInt(params.get("pagePerNum"));//페이지에 넣을 데이터 갯수
         
         String input = params.get("input");
         String type = params.get("type");
         int j_category = 3;
         
         logger.info(currPage+"/"+pagePerNum+"/"+input);
         logger.info("검색요청11");
         
         //게시물 시작과 끝 번호
         int end=pagePerNum*currPage;
         int start=end-pagePerNum+1;
         int allCnt=0;
         if(input!=""){
            allCnt = inter.f_searhCount(input, type, j_category);
            obj.put("list", inter.f_searhCall(start, end, input, type, j_category));
         }else{
            allCnt = inter.f_allCount(j_category);
            obj.put("list", inter.f_listCall(start, end, j_category));
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
	
		
		//상세보기
		@Transactional
		public ModelAndView freeDetail(String idx) {		
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();
			//조회수
			inter.j_vcount(idx);
			//불러오기
			logger.info("상세보기");
			mav.addObject("content", inter.freeDetail(idx));
			mav.setViewName("freeDetail");		
			return mav;
		}
		
		//글쓰기(일반)
		public ModelAndView write(Map<String, String> params) {		
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();		
			String j_title = params.get("j_title");
			String u_idx = params.get("u_idx");
			String j_name = params.get("j_name");
			String j_content = params.get("j_content");	
			j_content = j_content.replace("\r\n","<br>");
			int j_category = 3;
			int success = inter.write(j_title, j_name, j_content, j_category, u_idx);	
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
		public ModelAndView delete(String idx) {
			inter = sqlSession.getMapper(FreeInterface.class);
		      ModelAndView mav = new ModelAndView();
		      logger.info(idx);
	
			         
		      String msg="삭제에 성공 했습니다.";
		     
		      //글삭제
		      if(inter.delete(idx) == 1){
		         msg="삭제에 성공 했습니다.";
		         
		      }
		      mav.addObject("msg", msg);      
		      mav.setViewName("freeList");
		      return mav;
		   }


		//수정 보기
		public ModelAndView freeModify(String idx) {
			inter = sqlSession.getMapper(FreeInterface.class);
			ModelAndView mav = new ModelAndView();
			//불러오기
			logger.info("수정페이지1");
			mav.addObject("content", inter.freeDetail(idx));
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
			j_content = j_content.replace("\r\n","<br>");
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
		
		
}

