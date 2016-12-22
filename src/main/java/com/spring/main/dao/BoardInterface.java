package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MatchDto;
import com.spring.main.dto.vidioDTO;

public interface BoardInterface {

	//게시물 전체 갯수
	int allCount();

	//매치리스트
	ArrayList<MatchDto> listCall(int start, int end);
	
	//매치리스트
	ArrayList<vidioDTO> v_listCall(int start, int end);

	int v_searhCount(String input, String type);

	ArrayList<vidioDTO> v_searhCall(int start, int end, String input, String type);

	int v_allCount();

}
