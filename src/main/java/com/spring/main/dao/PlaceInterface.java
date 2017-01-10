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

	//장소 상세보기
	PlaceDto a_detail(String idx);

	//장소 댓글 등록
	int a_replyRegist(int category, String idx, String replyer, String reple);

	//장소 댓글 up
	void a_replyUp(String idx);
	
	//장소 글 쓰기
	int a_write(String a_name, String a_area, String a_address, String a_ground, String a_content,
			String a_oldPicture, String a_newPicture, String a_lat, String a_lng);

	//삭제할 파일명
	String[] fileDelName(String a_idx);

	//수정하기
	int a_modify(String a_idx, String a_area, String a_address, String a_ground, String a_content, String a_oldPicture,
			String a_newPicture, String a_lat, String a_lng);

	//글삭제
	int a_delete(String idx);

	//별점등록
	int star(String value, String idx);

	//조회수 올리기
	void upHit(String idx);

	
}