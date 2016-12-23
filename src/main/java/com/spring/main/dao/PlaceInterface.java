package com.spring.main.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.spring.main.dto.PlaceDto;

public interface PlaceInterface {

	int allCount();

	ArrayList<PlaceDto> listCall(int start, int end);

	int searhCount(String input, String type);

	ArrayList<PlaceDto> areaList(int a_idx, int u_idx, String a_name, 
			int a_area, String a_address, String a_ground, String a_content, Date a_date,
			int a_reple, int a_vcount, int a_total, int a_evalunum, String a_picfile,
			double a_lat, double a_lng);
	
	ArrayList<PlaceDto> searhCall(int start, int end, String input, String type);

	
	int write(int t_idx, String title, String writer, String date, String time, String type, String age, String content,
			String lat, String lng, int area, String ground, String state);
	
	

}
