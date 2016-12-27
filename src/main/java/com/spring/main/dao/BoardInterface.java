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

	//자유게시판 게시물 전체 갯수
	int f_allCount();

	//자유게시판 리스트 뛰우기
	ArrayList<freelistDTO> f_listCall(int start, int end);

	//자유게시판 검색 뛰우기
	ArrayList<freelistDTO> f_searhCall(int start, int end, String input, String type);

	//자유게시판 카운트
	int f_searhCount(String input, String type);

	//조회수 카운트
	void j_vcount(String j_idx);

	//상세보기
	freelistDTO contentView(String j_idx);

	//글쓰기
	int write(String j_title, String j_name, String j_content);


}
