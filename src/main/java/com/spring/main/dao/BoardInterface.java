package com.spring.main.dao;


import java.util.ArrayList;
import java.util.Map;

import com.spring.main.dto.LoginDto;
import com.spring.main.dto.RepleDto;
import com.spring.main.dto.SelectTeamDto;
import com.spring.main.dto.UserDto;


public interface BoardInterface {

	//로그인
	LoginDto login(String u_id, String u_pass);

	//중복체크
	String overlay(String u_id);
	
	//회원가입
	int userJoin(UserDto info);

	//유저 정보
	UserDto userSearch(String u_id);

	//유저가 속한 팀 정보
	ArrayList<SelectTeamDto> selectTeam(String idx);

	//유저 정보 수정
	int userModify(UserDto udt);

	//유저이름과 메일찾기
	String idFind(String userFind, String userMail);
	
	String passFind(String userFind, String userMail);

	String logout(String idx);
	
	//댓글 등록
	int replyRegist(String column, String idx, String u_idx, String replyer, String reple);

	//댓글 up
	void replyUp(String table,String repleCnt, String idx);

	//댓글 리스트
	ArrayList<RepleDto> replyList(String column, String idx);

	//댓글 삭제
	int replyDel(String r_idx);

	//댓글 down
	void repleDown(String table,String repleCnt, String idx);


}
