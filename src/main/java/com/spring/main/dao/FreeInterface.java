package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.freelistDTO;

public interface FreeInterface {

	//게시물 갯수
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
	freelistDTO freeDetail(String j_idx);

	//글쓰기
	int write(String j_title, String j_name, String j_content);

	//글삭제
	int delete(String j_idx);
	
	//글 수정하기
	int update(String j_title, String j_name, String j_content, String j_idx);


	
}
