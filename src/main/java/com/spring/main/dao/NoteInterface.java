package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MatchDto;
import com.spring.main.dto.NoteDto;

public interface NoteInterface {

	int note_searhCount(String input, String type, String idx);

	ArrayList<NoteDto> note_searhCall(int start, int end, String input, String type, String idx);

	int note_allCount(String idx);

	ArrayList<NoteDto> note_listCall(int start, int end, String idx);

	void note_confirmUpdate();

	ArrayList<NoteDto> note_newListCall(String idx0, String idx1, String idx2);

	void note_newChange(String idx);

}
