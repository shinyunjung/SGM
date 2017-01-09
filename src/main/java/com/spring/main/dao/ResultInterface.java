package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.EntirelyDto;

public interface ResultInterface {

	//경기일,t_idx 가져오기
	ArrayList<EntirelyDto> matchDay(String Dday);

	//difference 
	void difference(String string, String idx);

	//t_rankpoint
	void rankpoint(int t_rankpoint, String result, String t_name);

}
