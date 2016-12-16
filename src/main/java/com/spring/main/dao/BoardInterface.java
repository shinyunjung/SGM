package com.spring.main.dao;

import java.util.ArrayList;


import com.spring.main.dto.vidioDTO;

public interface BoardInterface {

	//게시물 전체 갯수
	int allCount();

	//비디오 리스트
	ArrayList<vidioDTO> vidiolist(int start, int end);
}
