package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.EvalueDto;
import com.spring.main.dto.MemberDto;
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
	
	//팀소속멤버
	ArrayList<MemberDto> memberCall(String t_idx);
	
	//평가수
	int evalueCount(String t_idx);
	
	//멤버수
	int memberCount(String t_idx);

}
