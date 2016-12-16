package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MatchDto;

public interface BoardInterface {

	int allCount();

	ArrayList<MatchDto> listCall(int start, int end);

}
