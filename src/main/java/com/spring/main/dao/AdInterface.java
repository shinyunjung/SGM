package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDto;

public interface AdInterface {

	//게시물수
	int allCount();

	//리스트 보이기
	ArrayList<BoardDto> listCall(int start, int end);
	
	//검색수
	int searchCount(String type, String value);

	//검색리스트보이기
	ArrayList<BoardDto> search(int start, int end, String type, String value);

	//ad_idx불러오기
	String idxCall();

	//광고등록
	int write(String ad_idx,String ad_host, String ad_manager, String ad_type, String ad_title, String ad_content,
			String ad_area, String ad_address, String ad_lat, String ad_lng, String s_date, String e_date,
			String ad_count);

	//파일등록
	void fileUp(String ad_idx, String ad_imgo, String ad_imgn, String ad_URL);

	//삭제할 파일이름
	String[] fileDelName(String ad_idx);

	//글삭제
	int delete(String ad_idx);

	//글수정
	void update(String ad_idx, String ad_host, String ad_manager, String ad_type, String ad_title, String ad_content,
			String ad_area, String ad_address, String ad_lat, String ad_lng, String s_date, String e_date,
			String ad_count);

	//파일수정
	void fileModify(String ad_idx, String ad_imgo, String ad_imgn, String ad_URL);

	

	

}
