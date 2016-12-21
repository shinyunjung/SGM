package com.spring.main.dao;


import com.spring.main.dto.UserDto;

public interface BoardInterface {

	//로그인
	String login(String u_id, String u_pass);

	//중복체크
	String overlay(String u_id);
	
	//회원가입
	void userJoin(UserDto info);



}
