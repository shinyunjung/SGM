package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDto;
import com.spring.main.dto.TManagerDto;
import com.spring.main.dto.UserDto;

public interface ManagerInterface {

	int us_allCnt();

	ArrayList<UserDto> us_listCall(int start, int end);

	int us_searhCount(String input, String type);

	ArrayList<UserDto> us_searhCall(int start, int end, String input, String type);

	int usDelete(String idx);

	void boradDelete(String idx, String string);

	ArrayList<BoardDto> boradSearch(String idx);

	void usRepleDelete(String idx);
	

/***********************************/
	
	int TManger_searhCount(String input);

	ArrayList<TManagerDto> TManger_searhCall(int start, int end, String input);

	int TManger_allCnt();

	ArrayList<TManagerDto> TManger_listCall(int start, int end);

	UserDto memberInfo(String idx);

	int teamDelete(String idx);

	void noteConfirm(String idx);

}
