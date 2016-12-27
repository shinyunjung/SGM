package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.FileDto;
import com.spring.main.dto.MemberDto;
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
	
	//idx받아오기
	int idxCall();

	//글쓰기
	void write(int idx, String u_idx, String j_category, String j_name, String j_title, String j_content);
	
	//파일 업로드
	void fileUp(int idx, String j_category, String fileName, String newFileName);

	//멤버정보
	ArrayList<MemberDto> member(String t_idx);

	//개인기록
	void record(String m_idx, String string, String string2, String string3, String string4, int p_atkpoint,
			String string5, String string6, String string7, String string8, String string9, String string10,
			String p_date);

	//멤버정보
	void point(int p_atkpoint, String u_idxm);
	

}
