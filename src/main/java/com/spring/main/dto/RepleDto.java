package com.spring.main.dto;

import oracle.sql.DATE;

public class RepleDto {
	
	private int j_idx;
	private int mch_idx;
	private int area_idx;
	private int r_idx;
	private int r_category;
	private int r_reple;
	private int r_writer;
	private DATE r_date;
	
	
	public int getJ_idx() {
		return j_idx;
	}
	public void setJ_idx(int j_idx) {
		this.j_idx = j_idx;
	}
	public int getMch_idx() {
		return mch_idx;
	}
	public void setMch_idx(int mch_idx) {
		this.mch_idx = mch_idx;
	}
	public int getArea_idx() {
		return area_idx;
	}
	public void setArea_idx(int area_idx) {
		this.area_idx = area_idx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getR_category() {
		return r_category;
	}
	public void setR_category(int r_category) {
		this.r_category = r_category;
	}
	public int getR_reple() {
		return r_reple;
	}
	public void setR_reple(int r_reple) {
		this.r_reple = r_reple;
	}
	public int getR_writer() {
		return r_writer;
	}
	public void setR_writer(int r_writer) {
		this.r_writer = r_writer;
	}
	public DATE getR_date() {
		return r_date;
	}
	public void setR_date(DATE r_date) {
		this.r_date = r_date;
	}

	
}
