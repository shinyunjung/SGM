package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.TeamDto;

public interface TeamInterface {

	ArrayList<TeamDto> listCall(int start, int end);
	//게시물 전체 갯수
	int allCount();

}
