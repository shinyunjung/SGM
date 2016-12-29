package com.spring.main.dao;


import java.util.ArrayList;

import com.spring.main.dto.UserDto;
import com.spring.main.dto.freelistDTO;
import com.spring.main.dto.mylistDTO;

public interface BoardInterface {

	//로그인
	String login(String u_id, String u_pass);
	

	//중복체크
	String overlay(String u_id);
	
	//회원가입
	void userJoin(UserDto info);

	//마이리스트 뛰우기
	ArrayList<mylistDTO> mylistCall(int start, int end);

	//게시물 전체 갯수
	int allCount();


}
