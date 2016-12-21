package com.spring.main.dao;


import java.util.ArrayList;

import com.spring.main.dto.AreaDto;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.RepleDto;


public interface MatchInterface {

	//매칭 게시글 개수
    int mch_allCount();
    
    //매칭 리스트
    ArrayList<MatchDto> mch_listCall(int start, int end);
    
    //매칭 게시글 개수(검색)
    int searhCount(String input, String type);
    
    //매칭 리스트(검색)
    ArrayList<MatchDto> mch_searhCall(int start, int end, String input, String type);
	
	//장소목록
	ArrayList<AreaDto> mch_areaList();

	//매칭 글 쓰기
	int mch_write(int t_idx, String title, String writer, String date, String time, String type, String age, String content,
			String lat, String lng, int area, String ground, String state);

	//매칭 상세보기
	MatchDto mch_detail(int idx);

	//매칭 댓글 등록
	int mch_replyRegist(int category, String idx, String replyer, String reple);

	//매칭 댓글 up
	void mch_replyUp(String idx);

	//매칭 댓글 리스트
	ArrayList<RepleDto> mch_replyList(String idx, String category);

	//매칭 댓글 삭제
	int mch_replyDel(String idx, String category);

}
