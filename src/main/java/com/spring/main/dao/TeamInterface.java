package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.EntirelyDto;
import com.spring.main.dto.EvalueDto;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.PrDto;
import com.spring.main.dto.TeamDto;

public interface TeamInterface {

	//리스트
	ArrayList<TeamDto> listCall();
	
	//게시물 전체수
	int allCount();
	//검색
	ArrayList<TeamDto> search(String t_name);
	
	//검색게시물 전체수
	int searchCount(String t_name);
	
	//팀상세 정보
	TeamDto teamDetail(String t_idx);
	
	//팀평가정보
	EvalueDto evalueCall(String t_idx);
	
	//전적
	ArrayList<EntirelyDto> entCall(String t_idx);
	
	//팀소속멤버
	ArrayList<MemberDto> memberCall(String t_idx);
	
	//평가수
	int evalueCount(String t_idx);
	
	//멤버수
	int memberCount(String t_idx);
	
	//팀안내
	TeamDto teamInfo(String t_idx);
	
	//팀대표
	ArrayList<MemberDto> grade(String t_idx);
	
	//멤버개인기록
	PrDto memberDetail(String m_idx);
	
	//팀생성
	void insertTeam(String t_idx, String t_name, String t_area, String t_day, String t_time, String t_uniform, String t_oldPicture,
			String t_newPicture, String t_age);
	
	//중복체크
	String tName(String t_name);
	
	//엠블럼수정
	void picture(String fileName, String string, String t_idx);
	
	//삭제할 파일 이름
	String oldName(String t_idx);
	
	//팀수정
	void teamUpdate(String t_area, String t_day, String t_time, String t_uniform, String t_age,
			String t_idx);
	
	//팀삭제
	int teamDel(String t_idx);
	
	//t_idx
	String idxCall();
	
	//멤버추가
	int memberAdd(String u_idx, String t_idx, String u_name, String m_position, String m_grade);
	
	//멤버삭제
	int memberDel(String m_idx);
	
	//u_idx 가져오기
	String uidx(String u_id);
	
	//가입된 팀 수
	int uCount(String idx);
	
	//팀수정 페이지 멤버목록
	ArrayList<MemberDto> updateCall(String t_idx);
	
	//대표->멤버
	int leaderDn(String t_idx);
	
	//멤버->대표
	int leaderUp(String m_idx);
	
	//멤버수정
	int memberup(String u_idx, String m_position, String m_idx);
	
	//멤버 탈퇴
	int Delete(String t_idx, String u_idx);
	
	
	

}
