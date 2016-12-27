package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.FileDto;
import com.spring.main.dto.TdDto;

public interface TdInterface {

	//전체게시물수
	int allCount(String j_category);

	//리스트
	ArrayList<TdDto> listCall(int start, int end, String j_category);

	//검색리스트
	ArrayList<TdDto> search(int start, int end, String j_category, String type, String value);

	//검색수
	int searchCount( String j_category, String type, String value);

	int fileUp(int idx, String j_category, String fileName, String newFileName);

	//idx받아오기
	int idxCall();

	//글쓰기
	int write(int idx, String u_idx, String j_category, String j_name, String j_title, String j_content);
	

}
