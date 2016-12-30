package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.vidioDTO;

public interface VidioInterface {

	//게시물 전체 갯수
		int allCount(String j_category);

		int v_searhCount(String input, String type, String j_category);

		ArrayList<vidioDTO> v_searhCall(int start, int end, String input, String type, String j_category);

		int v_allCount(String j_category);

		ArrayList<vidioDTO> v_listCall(int start, int end, String j_category);


		int Write(String j_title, String j_name, String j_content, String j_category);

		vidioDTO vidioDetail(String totalidx);

		//조회수카운트
		void j_vcount(String totalidx);

		int delete(String totalidx);

		int update(String j_title, String j_name, String j_content, String totalidx);

}
