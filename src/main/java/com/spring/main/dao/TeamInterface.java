package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.TeamDto;

public interface TeamInterface {

	//리스트
	ArrayList<TeamDto> listCall();
	//게시물 전체수
	int allCount();
	//검색
	ArrayList<TeamDto> search(String t_name);
	
	//검색게시물 전체수
	int searchallCount(String t_name);

}
