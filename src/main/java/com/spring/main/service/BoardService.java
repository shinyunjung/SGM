package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.dto.LoginDto;
import com.spring.main.dto.RepleDto;
import com.spring.main.dto.SelectTeamDto;
import com.spring.main.dto.UserDto;
import com.spring.main.util.EmailTest;


@Service
public class BoardService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	BoardInterface inter = null;
	
	private String authNum="";
	
	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {
		inter = sqlSession.getMapper(BoardInterface.class);		
		LoginDto login = new LoginDto();
		String u_id = (String) params.get("u_id");
		String u_pass = (String) params.get("u_pass");
		String u_idx="";
		String u_grade="";
		String u_name="";

		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();
		
		logger.info("id: {}",u_id);
		logger.info("pass: {}",u_pass);
		String page = "index";
		if(u_id == null || u_pass == null){
			page="redirect:/";
		}else{	
			login=inter.login(u_id, u_pass);
			if(login != null){
				u_idx=login.getU_idx();
				u_grade=login.getU_grade();
				u_name=login.getU_name();
				logger.info("grade:{}",u_grade);
				logger.info("name:{}",u_name);
				if(u_grade.equals("관리자")){
					page="usManager";
					session.setAttribute("manager", u_grade);
				}
				logger.info(u_idx);
				if(u_idx!=""){
					session.setAttribute("userIdx", u_idx);
				}
				session.setAttribute("userId", u_id);
				session.setAttribute("userName", u_name);
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}
	
	
	//중복체크
		public Map<String, String> overlay(String u_id) {
			
			inter = sqlSession.getMapper(BoardInterface.class);
			Map<String, String> json = new HashMap<String, String>();
			logger.info("id중복확인");
			String use = "N";
			if(inter.overlay(u_id) == null){
				use = "Y";
			}
			json.put("use", use);
			
			logger.info("id중복확인");
			
			return json;
		}

	
	//회원가입
		public Map<String, String> userJoin(Map<String, String> params) {
			
			inter = sqlSession.getMapper(BoardInterface.class);
			UserDto info = new UserDto();
			Map<String, String> map = new HashMap<String, String>();
			String msg="회원가입에 실패했습니다.";
			int success=0;
			
			info.setU_id(params.get("id"));
			info.setU_pass(params.get("pass"));
			info.setU_name(params.get("name"));
			info.setU_age(params.get("age"));
			info.setU_gender(params.get("gender"));
			info.setU_phnum(params.get("phonNum"));
			info.setU_mail(params.get("mail"));
			info.setU_grade("회원");
			
			success=inter.userJoin(info);
			if(success==1){
				msg="회원가입에 성공했습니다.";
			}
			map.put("msg", msg);
			return map;
		}


		//유저 정보 찾기
		public Map<String, UserDto> userSearch(Map<String, String> params) {
			inter = sqlSession.getMapper(BoardInterface.class);
			
			Map <String, UserDto> map = new HashMap<String, UserDto>();
			String u_id=params.get("userId");
			logger.info(u_id);
			map.put("user", inter.userSearch(u_id));
			return map;
		}


		public Map<String, ArrayList<SelectTeamDto>> selectTeam(String idx) {
			inter = sqlSession.getMapper(BoardInterface.class);
			
			Map<String, ArrayList<SelectTeamDto>> map = new HashMap<String, ArrayList<SelectTeamDto>>();
			map.put("userTeam", inter.selectTeam(idx));
			return map;
		}


		//인증번호
		public Map<String, String> certification(String email) {
			EmailTest mail = new EmailTest();
			String success="인증번호가 보내지지 않았습니다.";
			Map<String, String> map = new HashMap<String, String>();
			authNum=RandomNum();
			try {
				success = mail.gmailtest(email, authNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
			map.put("msg", success);
			
			return map;
		}
		
		//인증번호 확인
		public Map<String, String> certificationCheck(String num) {
			Map<String, String> map = new HashMap<String, String>();
			String result="N";
			if(authNum.equals(num)){
				result="Y";
			}
			map.put("result", result);
			return map;
		}
		
		


		//랜덤(인증번호)
		private String RandomNum() {
			StringBuffer buffer = new StringBuffer();
			//인증번호 수
			for(int i=0; i<7; i++){
				int n=(int)(Math.random()*10);
				buffer.append(n);
			}
			return buffer.toString();
		}

		//마이페이지(회원 정보 불러오기)/수정페이지(회원정보 수정)
		public ModelAndView myPage(String id, boolean modFlag) {
			ModelAndView mav = new ModelAndView();
			UserDto udt =  new UserDto();
			inter = sqlSession.getMapper(BoardInterface.class);
			logger.info("id:{}",id);
			udt=inter.userSearch(id);
			mav.addObject("user",udt);
			if(!modFlag){
				mav.setViewName("myPage");
			}else{
				mav.setViewName("userModify");
			}
			return mav;
		}


		public ModelAndView modify(Map<String, String> params) {
			ModelAndView mav = new ModelAndView();
			UserDto udt = new UserDto();
			inter = sqlSession.getMapper(BoardInterface.class);
			int success=0;
			String msg="수정에 실패했습니다.";
			String id=params.get("u_id");
			String pass=params.get("u_pass");
			String email=params.get("u_email");
			
			udt=inter.userSearch(id);
			if(!pass.equals("")){
				udt.setU_pass(pass);
			}
			if(!email.equals(udt.getU_mail())){
				udt.setU_mail(email);
			}
			udt.setU_phnum(params.get("u_phonNum"));
			
			success = inter.userModify(udt);
			if(success==1){
				msg="수정에 성공했습니다.";
			}
			mav.addObject("msg", msg);
			mav.setViewName("index");
			return mav;
		}


		//이름으로 메일찾기
		public Map<String, String> mailFind(Map<String, String> params) {
			Map<String, String> map = new HashMap<String, String>();
			inter = sqlSession.getMapper(BoardInterface.class);	
			String userFind=params.get("find");
			String userMail=params.get("mail");
			String findType=params.get("type");
			String msg="";
			
			logger.info("findType:{}",findType);
			if(findType.equals("name")){
				logger.info(userFind+"/"+userMail);
				String userId =inter.idFind(userFind, userMail);
				if(userId==null)	{
					msg="N";
				}else{
					msg="Y";
					map.put("userId", userId);
				}
			}else{
				logger.info(userFind+"/"+userMail);
				String userPass=inter.passFind(userFind, userMail);
				if(userPass==null){
					msg="N";
				}else{
					msg="Y";
					map.put("userPass", userPass);
				}
			}
			map.put("mail", userMail);
			map.put("msg", msg);
			return map;
		}


		public ModelAndView logout(Map<String, Object> params) {
			String idx=(String)params.get("idx");
			HttpSession session=(HttpSession)params.get("session");
			ModelAndView mav = new ModelAndView();
			inter = sqlSession.getMapper(BoardInterface.class);
			String id = inter.logout(idx);
			String msg="로그아웃에 실패했습니다.";
			String page="index";
			if(id!=null){
				session.removeAttribute("userName");
				session.removeAttribute("userId");
				session.removeAttribute("userIdx");
				session.removeAttribute("manager");
				msg="로그아웃에 성공했습니다.";
			}
			mav.addObject("msg", msg);
			mav.setViewName(page);
			return mav;
		}


		//댓글 등록
		public Map<String, String> replyRegist(Map<String, String> params) {
			Map<String, String> obj = new HashMap<String, String>();
			inter=sqlSession.getMapper(BoardInterface.class);
			int success=0;
			String msg = "댓글 등록에 실패하셨습니다.";
			String idx = params.get("idx");
			String u_idx = params.get("u_idx");
			String column = params.get("column");
			String replyer = params.get("replyer");
			String reple = params.get("reple");
			String table = params.get("table");
			String repleCnt  = params.get("repleCnt");
			logger.info(idx);
			logger.info(replyer);
			logger.info(reple);
			success=inter.replyRegist(column, idx, u_idx, replyer, reple);
			if(success==1){
				inter.replyUp(table,repleCnt,idx);
				msg="댓글 등록에 성공하셨습니다.";
			}
			obj.put("msg", msg);
			return obj;
		}


		public Map<String, ArrayList<RepleDto>> replyList(Map<String, String> params) {
			Map<String, ArrayList<RepleDto>> obj = new HashMap<String, ArrayList<RepleDto>>();
			inter=sqlSession.getMapper(BoardInterface.class);
			String idx=params.get("idx");
			String column=params.get("column");
			obj.put("replyList", inter.replyList(column,idx));
			
			return obj;
		}


		public Map<String, String> replyDel(Map<String, String> params) {
			Map<String, String> obj = new HashMap<String, String>();
			int success=0;
			inter=sqlSession.getMapper(BoardInterface.class);
			String r_idx=params.get("r_idx");
			String idx=params.get("idx");
			String table=params.get("table");
			String repleCnt  = params.get("repleCnt");
			String msg="삭제에 실패했습니다.";
			
			success=inter.replyDel(r_idx);
			if(success==1){
				inter.repleDown(table,repleCnt,idx);
				msg="삭제에 성공했습니다.";
			}
			obj.put("msg", msg);
			return obj;
		}


}	

