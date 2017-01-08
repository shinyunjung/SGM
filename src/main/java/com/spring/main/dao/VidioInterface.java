package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDto;

public interface VidioInterface {

	//게시물 전체 갯수
		int allCount(int j_category);

		int v_searhCount(String input, String type, int j_category);

		ArrayList<BoardDto> v_searhCall(int start, int end, String input, String type, int j_category);

		int v_allCount(int j_category);

		ArrayList<BoardDto> v_listCall(int start, int end, int j_category);


		int Write(String j_title, String j_name, String j_content, int j_category);

		BoardDto vidioDetail(String totalidx);

		//조회수카운트
		void j_vcount(String totalidx);

		int delete(String totalidx);

		int update(String j_title, String j_name, String j_content, String totalidx);

}
