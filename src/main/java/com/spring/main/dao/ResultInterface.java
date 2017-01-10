package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.EntirelyDto;
import com.spring.main.dto.MatchDto;
import com.spring.main.dto.ResultDto;


public interface ResultInterface {

	//경기일,t_idx 가져오기
	ArrayList<EntirelyDto> matchDay(String Dday);

	//difference 
	void difference(String string, String idx);

	//t_rankpoint
	void rankpoint(int t_rankpoint, String result, String t_name);

	//평가메일발송
	ArrayList<ResultDto> result(String time);

	//경기결과
	MatchDto eva(String idx);

	//전적정보
	ArrayList<EntirelyDto> entDto(String mch_idx);

	//평가여부
	EntirelyDto mailCnt(String t_idx);

	//평가등록
	void evalue(String t_idx, String ev_name, String ev_manner, String ev_level, String ev_defe, String ev_attk);

	//전적등록
	void entirely(String t_idx, String mch_idx, String e_difference);

	//전적완료
	void end(String mch_idx);

	//전적리셋
	void reset(String mch_idx);

	//전적메일발송
	ResultDto email(String team);

}