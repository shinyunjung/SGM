package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.AreaDto;
import com.spring.main.dto.MatchDto;

public interface BoardInterface {

	int allCount();

	ArrayList<MatchDto> listCall(int start, int end);

	int searhCount(String input, String type);

	ArrayList<MatchDto> searhCall(int start, int end, String input, String type);

	ArrayList<AreaDto> areaList();

	int write(int t_idx, String title, String writer, String date, String time, String type, String age, String content,
			String lat, String lng, int area, String ground, String state);

}
