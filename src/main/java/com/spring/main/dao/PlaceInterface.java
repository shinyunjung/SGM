package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.PlaceDto;

public interface PlaceInterface {
	
	//매칭 게시글 개수
    int a_allCount();
    
    //매칭 리스트
    ArrayList<PlaceDto> a_listCall(int start, int end);
    
    //매칭 게시글 개수(검색)
    int a_searhCount(String input, String type);
    
    //매칭 리스트(검색)
    ArrayList<PlaceDto> a_searhCall(int start, int end, String input, String type);
	
	//장소목록
	ArrayList<PlaceDto> a_PlaceList();

	//매칭 글 쓰기
	int a_write(int t_idx, String title, String writer, String date, String time, String type, String age, String content,
			String lat, String lng, int area, String ground, String state);

	//매칭 상세보기
	PlaceDto a_detail(String idx);

	//매칭 댓글 등록
	int a_replyRegist(int category, String idx, String replyer, String reple);

	//매칭 댓글 up
	void a_replyUp(String idx);

	
	
}