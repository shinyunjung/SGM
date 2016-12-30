package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.FileDto;
import com.spring.main.dto.MemberDto;
import com.spring.main.dto.PrDto;
import com.spring.main.dto.TdDto;

public interface TdInterface {

	//전체게시물수
	int allCount(String j_category);

	//리스트
	ArrayList<TdDto> listCall(int start, int end, String j_category);

	//검색리스트
	ArrayList<TdDto> search(int start, int end, String j_category, String type, String value);

	//검색수
	int searchCount( String j_category, String type, String value);
	
	//idx받아오기
	String idxCall();

	//글쓰기
	void write(String idx, String u_idx, String j_category, String j_name, String j_title, String j_content);
	
	//파일 업로드
	void fileUp(String idx, String j_category, String fileName, String newFileName);

	//멤버정보
	ArrayList<MemberDto> member(String t_idx);

	//개인기록
	void record(String idx, String m_idx, String string, String string2, String string3, 
			String string4, int p_atkpoint,String string5, String string6, 
			String string7, String string8, String string9, String string10,String p_date);

	//멤버정보 업
	void point(int p_atkpoint, String m_idx);

	//상세보기
	TdDto tdDetail(String idx);

	//개인기록보기
	ArrayList<PrDto> tdRecord(String idx);

	//삭제할 파일명
	String[] fileDelName(String idx);

	//글삭제
	int delete(String idx);

	//조회수 올리기
	void upHit(String idx);

	//파일명불러오기
	ArrayList<FileDto> fileCall(String idx);

	//멤버정보 다운
	void pointDel(int p_atkpoint, String string);

	//개인기록 삭제
	void recordDel(String idx);

	//삭제시 멤버idx,공격포인트
	ArrayList<PrDto> delMember(String idx);

	//수정페이지 개인기록
	ArrayList<PrDto> modifyRec(String t_idx, String idx);

	//글수정
	void update(String idx, String j_title, String j_content);

	//파일 수정
	void fileModify(String idx, String string, String string2);

	//개인기록 수정
	void recordUP(String idx, String string, String string2, String string3, String string4, String string5,
			int p_atkpoint, String string6, String string7, String string8, String string9, String string10,
			String string11, String p_date);

	//멤버포인트 수정
	void pointUp(int pointUp, String string);
	

}
