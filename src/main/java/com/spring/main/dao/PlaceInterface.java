package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.PlaceDto;

public interface PlaceInterface {
	
	//장소 게시글 개수
    int a_allCount();
    
    //장소 리스트
    ArrayList<PlaceDto> a_listCall(int start, int end);
    
    //장소 게시글 개수(검색)
    int a_searhCount(String input, String type);
    
    //장소 리스트(검색)
    ArrayList<PlaceDto> a_searhCall(int start, int end, String input, String type);
	
	//장소목록
	ArrayList<PlaceDto> a_PlaceList();

	//장소 글 쓰기
	int a_write(int totalIdx, String title, String name, String date, String time, 
			String type, String age, String content,
			String lat, String lng, int area, String ground, String state);

	//장소 상세보기
	PlaceDto a_detail(String idx);

	//장소 댓글 등록
	int a_replyRegist(int category, String idx, String replyer, String reple);

	//장소 댓글 up
	void a_replyUp(String idx);

	
	
}