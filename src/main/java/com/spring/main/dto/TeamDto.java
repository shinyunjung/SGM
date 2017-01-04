package com.spring.main.dto;

public class TeamDto {
	
	String[] area = {"중구", "동구", "남구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"};
	private int t_idx;
	private String t_name;
	private String t_area;
	private String t_day;
	private String t_time;
	private String t_uniform;
	private String t_type;
	private String t_newPicture;
	private String t_oldPicture;
	private int t_matchcount;
	private int t_rankpoint;
	private String t_age;
	private int t_win;
	private int t_lose;
	private int t_draw;
	private int rank;
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getT_idx() {
		return t_idx;
	}
	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_area() {
		return t_area;
	}
	public void setT_area(int t_area) {
		this.t_area = area[t_area];
	}
	public String getT_day() {
		return t_day;
	}
	public void setT_day(String t_day) {
		this.t_day = t_day;
	}
	public String getT_time() {
		return t_time;
	}
	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	public String getT_uniform() {
		return t_uniform;
	}
	public void setT_uniform(String t_uniform) {
		this.t_uniform = t_uniform;
	}
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public String getT_newPicture() {
		return t_newPicture;
	}
	public void setT_newPicture(String t_newPicture) {
		this.t_newPicture = t_newPicture;
	}
	public String getT_oldPicture() {
		return t_oldPicture;
	}
	public void setT_oldPicture(String t_oldPicture) {
		this.t_oldPicture = t_oldPicture;
	}
	public int getT_matchcount() {
		return t_matchcount;
	}
	public void setT_matchcount(int t_matchcount) {
		this.t_matchcount = t_matchcount;
	}
	public int getT_rankpoint() {
		return t_rankpoint;
	}
	public void setT_rankpoint(int t_rankpoint) {
		this.t_rankpoint = t_rankpoint;
	}
	public String getT_age() {
		return t_age;
	}
	public void setT_age(String t_age) {
		this.t_age = t_age;
	}
	public int getT_win() {
		return t_win;
	}
	public void setT_win(int t_win) {
		this.t_win = t_win;
	}
	public int getT_lose() {
		return t_lose;
	}
	public void setT_lose(int t_lose) {
		this.t_lose = t_lose;
	}
	public int getT_draw() {
		return t_draw;
	}
	public void setT_draw(int t_draw) {
		this.t_draw = t_draw;
	}
	
}
