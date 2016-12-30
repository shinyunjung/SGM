package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.vidioDTO;

public interface VidioInterface {

	//게시물 전체 갯수
		int allCount();

		int v_searhCount(String input, String type);

		ArrayList<vidioDTO> v_searhCall(int start, int end, String input, String type);

		int v_allCount();

		ArrayList<vidioDTO> v_listCall(int start, int end);


		int Write(String j_title, String j_name, String j_content);

		vidioDTO vidioDetail(String j_idx);

		//조회수카운트
		void j_vcount(String j_idx);

		int delete(String j_idx);

		int update(String j_title, String j_name, String j_content, String j_idx);

}
