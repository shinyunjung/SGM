package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MatchDto;
import com.spring.main.dto.NoteDto;

public interface NoteInterface {

	int note_searhCount(String input, String type, String idx);

	ArrayList<NoteDto> note_searhCall(int start, int end, String input, String type, String idx);

	int note_allCount(String idx);

	ArrayList<NoteDto> note_listCall(int start, int end, String idx);

	void note_confirmUpdate(String noteIdx);

	ArrayList<NoteDto> note_newListCall(String idx0, String idx1, String idx2);

	void note_newChange(String idx);

	int sendNote(String writer, String writer_idx, String receiver, String receiver_idx, String title, String content,
			String confirm, String newState);

	int note_delete(String idx);

	int note_count();

	void matching_stateUpdate(String mchIdx, String receiver);

}
