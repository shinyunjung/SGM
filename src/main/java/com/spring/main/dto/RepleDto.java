package com.spring.main.dto;

import java.sql.Date;

public class RepleDto {
	private int r_idx;
	private int r_category;
	private int parent_idx;
	private String r_reple;
	private String r_writer;
	private Date r_date;
	
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
	public int getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}
	public String getR_reple() {
		return r_reple;
	}
	public void setR_reple(String r_reple) {
		this.r_reple = r_reple;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
	
	
}
