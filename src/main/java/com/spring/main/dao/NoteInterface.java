package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MatchDto;
import com.spring.main.dto.NoteDto;

public interface NoteInterface {

	int note_searhCount(String input, String type);

	ArrayList<NoteDto> note_searhCall(int start, int end, String input, String type);

	int note_allCount();

	ArrayList<NoteDto> note_listCall(int start, int end);

	void confirmUpdate();

	ArrayList<NoteDto> newListCall(String idx0, String idx1, String idx2);

}
